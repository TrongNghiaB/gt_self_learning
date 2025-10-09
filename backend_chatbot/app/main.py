"""FastAPI main application."""
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from fastapi.staticfiles import StaticFiles

from app.routers import health, math, conversations


# Create FastAPI app
app = FastAPI(
    title="Math Explainer API",
    description="Multi-Agent Math Explanation System with Firebase Auth",
    version="1.0.0",
    lifespan=math.lifespan,
)

# CORS middleware for frontend
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Configure this properly in production
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Include routers
app.include_router(health.router)
app.include_router(math.router)
app.include_router(conversations.router)

# Mount static files for serving images
app.mount("/images", StaticFiles(directory="images"), name="images")

