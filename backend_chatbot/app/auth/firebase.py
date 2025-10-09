"""Firebase authentication middleware and dependencies."""
import os
from typing import Annotated, Optional
from fastapi import Depends, HTTPException, Request, status
from fastapi.security import HTTPBearer, HTTPAuthorizationCredentials
import firebase_admin
from firebase_admin import auth, credentials
from pydantic import BaseModel

from app.config import settings


class FirebaseUser(BaseModel):
    """Authenticated Firebase user."""

    uid: str
    email: Optional[str] = None
    name: Optional[str] = None


# Initialize Firebase Admin SDK
_firebase_initialized = False


def initialize_firebase() -> None:
    """Initialize Firebase Admin SDK."""
    global _firebase_initialized

    if _firebase_initialized:
        return

    try:
        # Try to initialize with service account credentials
        cred_path = settings.google_application_credentials 

        if cred_path and os.path.exists(cred_path):
            cred = credentials.Certificate(cred_path)
            firebase_admin.initialize_app(cred)
        else:
            # Try default credentials (e.g., from GCP environment)
            firebase_admin.initialize_app()

        _firebase_initialized = True
    except ValueError as e:
        # Firebase already initialized
        if "already exists" in str(e):
            _firebase_initialized = True
        else:
            raise


# Security scheme for bearer token
security = HTTPBearer(auto_error=False)


async def verify_firebase_token(
    credentials: Annotated[Optional[HTTPAuthorizationCredentials], Depends(security)],
) -> FirebaseUser:
    """
    Verify Firebase ID token from Authorization header.

    Args:
        credentials: HTTP bearer token from Authorization header

    Returns:
        FirebaseUser with uid, email, and name

    Raises:
        HTTPException: 401 if token is missing or invalid
    """
    if not credentials:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Missing authentication token",
            headers={"WWW-Authenticate": "Bearer"},
        )

    token = credentials.credentials

    try:
        initialize_firebase()
        decoded_token = auth.verify_id_token(token)

        return FirebaseUser(
            uid=decoded_token["uid"],
            email=decoded_token.get("email"),
            name=decoded_token.get("name"),
        )
    except auth.InvalidIdTokenError:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Invalid authentication token",
            headers={"WWW-Authenticate": "Bearer"},
        )
    except auth.ExpiredIdTokenError:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Authentication token has expired",
            headers={"WWW-Authenticate": "Bearer"},
        )
    except Exception as e:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail=f"Authentication failed: {str(e)}",
            headers={"WWW-Authenticate": "Bearer"},
        )


# Dependency for protected routes
CurrentUser = Annotated[FirebaseUser, Depends(verify_firebase_token)]

