"""Conversation management router."""
from fastapi import APIRouter, HTTPException, Query
from typing import List, Optional

from app.schemas.api import ConversationSummary, ConversationDetail, ConversationListResponse
from app.auth.firebase import CurrentUser
from app.core.firestore_service import FirestoreService

router = APIRouter(prefix="/api/conversations", tags=["conversations"])

# Initialize Firestore service
firestore_service = FirestoreService()


@router.get("/", response_model=ConversationListResponse)
async def get_conversations(
    user: CurrentUser,
    limit: int = Query(10, ge=1, le=50, description="Number of conversations to return per page"),
    cursor: Optional[str] = Query(None, description="Cursor for pagination (last conversation ID)")
) -> ConversationListResponse:
    """
    Get paginated list of conversations for the authenticated user.
    
    Returns conversations ordered by most recent first with pagination support.
    Default limit is 10 conversations per page.
    """
    try:
        conversations, next_cursor = await firestore_service.get_conversations_paginated(
            user_id=user.uid,
            limit=limit,
            cursor=cursor
        )
        
        return ConversationListResponse(
            conversations=conversations,
            next_cursor=next_cursor,
            has_more=next_cursor is not None,
            count=len(conversations)
        )
    except Exception as e:
        raise HTTPException(
            status_code=500,
            detail=f"Failed to retrieve conversations: {str(e)}"
        )


@router.get("/{conversation_id}", response_model=ConversationDetail)
async def get_conversation(
    user: CurrentUser,
    conversation_id: str
) -> ConversationDetail:
    """
    Get detailed conversation information including all elements and images.
    
    Args:
        conversation_id: The ID of the conversation to retrieve
        
    Returns:
        Complete conversation details with elements and image paths
    """
    try:
        conversation = await firestore_service.get_conversation(
            conversation_id=conversation_id,
            user_id=user.uid
        )
        
        if conversation is None:
            raise HTTPException(
                status_code=404,
                detail="Conversation not found or access denied"
            )
        
        return conversation
    except HTTPException:
        raise
    except Exception as e:
        raise HTTPException(
            status_code=500,
            detail=f"Failed to retrieve conversation: {str(e)}"
        )


@router.delete("/{conversation_id}")
async def delete_conversation(
    user: CurrentUser,
    conversation_id: str
) -> dict:
    """
    Delete a conversation.
    
    Args:
        conversation_id: The ID of the conversation to delete
        
    Returns:
        Success message
    """
    try:
        success = await firestore_service.delete_conversation(
            conversation_id=conversation_id,
            user_id=user.uid
        )
        
        if not success:
            raise HTTPException(
                status_code=404,
                detail="Conversation not found or access denied"
            )
        
        return {"message": "Conversation deleted successfully"}
    except HTTPException:
        raise
    except Exception as e:
        raise HTTPException(
            status_code=500,
            detail=f"Failed to delete conversation: {str(e)}"
        )
