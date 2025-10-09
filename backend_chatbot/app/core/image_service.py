"""Image processing and storage service."""
import os
import uuid
import aiofiles
from typing import List, Optional
from fastapi import UploadFile
from PIL import Image
import io


class ImageService:
    """Service for handling image uploads and processing."""
    
    def __init__(self, images_dir: str = "images"):
        """
        Initialize image service.
        
        Args:
            images_dir: Directory to store images
        """
        self.images_dir = images_dir
        self._ensure_images_dir()
    
    def _ensure_images_dir(self):
        """Ensure images directory exists."""
        os.makedirs(self.images_dir, exist_ok=True)
    
    async def save_images(self, files: List[UploadFile], conversation_id: str) -> List[str]:
        """
        Save uploaded images to local storage.
        
        Args:
            files: List of uploaded files
            conversation_id: Conversation ID for organizing images
            
        Returns:
            List of saved image paths
        """
        saved_paths = []
        
        for i, file in enumerate(files):
            if not file.content_type or not file.content_type.startswith('image/'):
                continue
            
            # Generate unique filename
            file_extension = self._get_file_extension(file.content_type)
            filename = f"{conversation_id}_{i}_{uuid.uuid4().hex}{file_extension}"
            file_path = os.path.join(self.images_dir, filename)
            
            # Read and save file
            content = await file.read()
            
            # Validate and process image
            try:
                image = Image.open(io.BytesIO(content))
                # Convert to RGB if necessary
                if image.mode in ('RGBA', 'LA', 'P'):
                    image = image.convert('RGB')
                
                # Resize if too large (max 1920x1080)
                max_size = (1920, 1080)
                if image.size[0] > max_size[0] or image.size[1] > max_size[1]:
                    image.thumbnail(max_size, Image.Resampling.LANCZOS)
                
                # Save processed image
                image.save(file_path, 'JPEG', quality=85, optimize=True)
                saved_paths.append(file_path)
                
            except Exception as e:
                print(f"Error processing image {file.filename}: {e}")
                continue
        
        return saved_paths
    
    def _get_file_extension(self, content_type: str) -> str:
        """Get file extension from content type."""
        extensions = {
            'image/jpeg': '.jpg',
            'image/jpg': '.jpg',
            'image/png': '.png',
            'image/gif': '.gif',
            'image/webp': '.webp'
        }
        return extensions.get(content_type, '.jpg')
    
    async def get_image_path(self, image_path: str) -> Optional[str]:
        """
        Get full path to an image file.
        
        Args:
            image_path: Relative image path
            
        Returns:
            Full path if image exists, None otherwise
        """
        full_path = os.path.join(self.images_dir, image_path)
        if os.path.exists(full_path):
            return full_path
        return None
    
    async def delete_images(self, image_paths: List[str]) -> bool:
        """
        Delete image files.
        
        Args:
            image_paths: List of image paths to delete
            
        Returns:
            True if all images deleted successfully
        """
        success = True
        for path in image_paths:
            try:
                if os.path.exists(path):
                    os.remove(path)
            except Exception as e:
                print(f"Error deleting image {path}: {e}")
                success = False
        return success
    
    def get_image_url(self, image_path: str) -> str:
        """
        Get URL for accessing an image.
        
        Args:
            image_path: Image path
            
        Returns:
            URL for accessing the image
        """
        # In production, this would be a proper URL
        # For now, return the relative path
        return f"/images/{os.path.basename(image_path)}"
