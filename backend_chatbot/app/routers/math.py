"""Math explanation router."""
from contextlib import asynccontextmanager
from fastapi import APIRouter, HTTPException, UploadFile, File, Form
from typing import List, Optional
import uuid

from app.schemas.api import ExplainResponse
from app.auth.firebase import CurrentUser
from app.agents.orchestrator import Orchestrator
from app.core.errors import map_to_http
from app.core.firestore_service import FirestoreService
from app.core.image_service import ImageService

router = APIRouter(prefix="/api", tags=["math"])

# Single orchestrator instance (only global state)
orchestrator = Orchestrator()
firestore_service = FirestoreService()
image_service = ImageService()


@asynccontextmanager
async def lifespan(app):
    """Manage orchestrator lifecycle."""
    # Startup
    yield
    # Shutdown
    orchestrator.shutdown()


@router.post("/explain", response_model=ExplainResponse)
async def explain_math(
    user: CurrentUser,
    prompt: str = Form(..., description="Math question or topic to explain"),
    locale: str = Form("en", description="Language locale"),
    model: str = Form("openai", description="LLM model to use"),
    images: List[UploadFile] = File(default=[]),
) -> ExplainResponse:
    """
    Explain a math concept using multi-agent pipeline.
    Supports text-only or image-enhanced explanations.
    """
    # 1) Tạo conversation id mới
    conversation_id = str(uuid.uuid4())
    image_local_paths = []

    try:
        # 2) Lưu hình ảnh vào local với image_service.save_images
        if images:
            image_local_paths = await image_service.save_images(images, conversation_id)
            
            if not image_local_paths:
                print("Warning: No valid images were processed, continuing with text-only explanation")

        # 3) Call api agent orchestrator.explain
        result = await orchestrator.explain(
            query=prompt,
            locale=locale,
            model=model,
            image_paths=image_local_paths if image_local_paths else None,
        )

        if result.is_err():
            error = result.error  # type: ignore
            raise map_to_http(error)

        topic, elements = result.unwrap()

        # 4) Tạo conversation với id đã tạo ở trên với firestore_service.create_conversation
        try:
            await firestore_service.create_conversation(
                conversation_id=conversation_id,
                user_id=user.uid,
                query=prompt,
                topic=topic,
                elements=elements,
                image_paths=image_local_paths,
            )
        except Exception as e:
            print(f"Warning: Failed to save conversation to Firestore: {e}")

        return ExplainResponse(topic=topic, elements=elements)

    except HTTPException:
        raise
    except Exception as e:
        # Cleanup images if error
        if image_local_paths:
            try:
                await image_service.delete_images(image_local_paths)
            except Exception as cleanup_error:
                print(f"Warning: Failed to cleanup images: {cleanup_error}")
        raise HTTPException(status_code=500, detail=f"Internal server error: {str(e)}")
