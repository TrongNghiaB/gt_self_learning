"""Firestore service for conversation storage."""
import os
import uuid
from datetime import datetime
from typing import List, Optional
from google.cloud import firestore
from google.cloud.firestore_v1.base_query import FieldFilter
from app.schemas.api import ConversationSummary, ConversationDetail
from app.schemas.elements import Element


class FirestoreService:
    """Service for managing conversations in Firestore."""
    
    def __init__(self):
        """Initialize Firestore service."""
        self.db = None
        self.conversations_collection = "conversations"
    
    def _get_db(self):
        """Lazy initialization of Firestore client."""
        if self.db is None:
            try:
                self.db = firestore.Client()
            except Exception as e:
                print(f"Warning: Firestore not available: {e}")
                # Create a mock client for development
                self.db = None
        return self.db
    
    async def create_conversation(
        self,
        conversation_id: str,
        user_id: str,
        query: str,
        topic: str,
        elements: List[Element],
        image_paths: List[str]
    ) -> str:
        """
        Create a new conversation in Firestore.
        
        Args:
            conversation_id: Pre-generated conversation ID
            user_id: Firebase user ID
            query: Original user query
            topic: Main topic of the conversation
            elements: List of explanation elements
            image_paths: List of uploaded image paths
            
        Returns:
            Conversation ID
        """
        now = datetime.utcnow()
        
        conversation_data = {
            "id": conversation_id,
            "user_id": user_id,
            "query": query,
            "topic": topic,
            "elements": [element.model_dump() for element in elements],
            "image_paths": image_paths,
            "created_at": now,
            "updated_at": now,
            "image_count": len(image_paths)
        }
        
        # Store in Firestore
        db = self._get_db()
        if db is None:
            print("Warning: Firestore not available, conversation not saved")
            return conversation_id
            
        doc_ref = db.collection(self.conversations_collection).document(conversation_id)
        doc_ref.set(conversation_data)
        
        return conversation_id
    
    async def get_conversations(self, user_id: str, limit: int = 50) -> List[ConversationSummary]:
        """
        Get list of conversations for a user.
        
        Args:
            user_id: Firebase user ID
            limit: Maximum number of conversations to return
            
        Returns:
            List of conversation summaries
        """
        db = self._get_db()
        if db is None:
            print("Warning: Firestore not available, returning empty list")
            return []
            
        query = (
            db.collection(self.conversations_collection)
            .where(filter=FieldFilter("user_id", "==", user_id))
            .order_by("updated_at", direction=firestore.Query.DESCENDING)
            .limit(limit)
        )
        
        docs = query.stream()
        conversations = []
        
        for doc in docs:
            data = doc.to_dict()
            conversations.append(ConversationSummary(
                id=data["id"],
                topic=data["topic"],
                created_at=data["created_at"],
                updated_at=data["updated_at"],
                image_count=data["image_count"]
            ))
        
        return conversations
    
    async def get_conversations_paginated(
        self, 
        user_id: str, 
        limit: int = 10, 
        cursor: Optional[str] = None
    ) -> tuple[List[ConversationSummary], Optional[str]]:
        """
        Get paginated list of conversations for a user.
        
        Args:
            user_id: Firebase user ID
            limit: Number of conversations to return per page
            cursor: Last conversation ID for pagination
            
        Returns:
            Tuple of (conversations, next_cursor)
        """
        db = self._get_db()
        if db is None:
            print("Warning: Firestore not available, returning mock data")
            # Return mock data for development
            from datetime import datetime, timedelta
            mock_conversations = [
                ConversationSummary(
                    id="mock-1",
                    topic="Sample Math Problem",
                    created_at=datetime.now() - timedelta(hours=1),
                    updated_at=datetime.now() - timedelta(hours=1),
                    image_count=0
                ),
                ConversationSummary(
                    id="mock-2", 
                    topic="Quadratic Equation",
                    created_at=datetime.now() - timedelta(hours=2),
                    updated_at=datetime.now() - timedelta(hours=2),
                    image_count=1
                ),
                ConversationSummary(
                    id="mock-3",
                    topic="Arithmetic Calculation", 
                    created_at=datetime.now() - timedelta(days=1),
                    updated_at=datetime.now() - timedelta(days=1),
                    image_count=0
                )
            ]
            return mock_conversations[:limit], None
            
        # Build query
        query = (
            db.collection(self.conversations_collection)
            .where(filter=FieldFilter("user_id", "==", user_id))
            .order_by("updated_at", direction=firestore.Query.DESCENDING)
        )
        
        # Add cursor for pagination
        if cursor:
            # Get the cursor document to start from
            cursor_doc = db.collection(self.conversations_collection).document(cursor).get()
            if cursor_doc.exists:
                cursor_data = cursor_doc.to_dict()
                query = query.start_after(cursor_data)
        
        # Add limit (request one extra to check if there are more)
        query = query.limit(limit + 1)
        
        docs = list(query.stream())
        conversations = []
        next_cursor = None
        
        # Process results
        for i, doc in enumerate(docs):
            if i < limit:  # Only include up to limit
                data = doc.to_dict()
                conversations.append(ConversationSummary(
                    id=data["id"],
                    topic=data["topic"],
                    created_at=data["created_at"],
                    updated_at=data["updated_at"],
                    image_count=data["image_count"]
                ))
            else:  # If we have more than limit, set next cursor
                next_cursor = conversations[-1].id if conversations else None
                break
        
        return conversations, next_cursor
    
    async def get_conversation(self, conversation_id: str, user_id: str) -> Optional[ConversationDetail]:
        """
        Get detailed conversation information.
        
        Args:
            conversation_id: Conversation ID
            user_id: Firebase user ID
            
        Returns:
            Conversation detail or None if not found
        """
        db = self._get_db()
        if db is None:
            print("Warning: Firestore not available, returning mock data")
            # Return mock data for development
            from datetime import datetime, timedelta
            from app.schemas.elements import TextBlock, AnswerBlock, ExampleSteps, StepDetail
            
            mock_elements = [
                AnswerBlock(
                    id="elem_0",
                    type="answer_block",
                    order=0,
                    title="Final Answer",
                    answer="25",
                    explanation="The result of (2+3)^2 is 25"
                ),
                ExampleSteps(
                    id="elem_1",
                    type="example_steps", 
                    order=1,
                    title="Solution Steps",
                    steps=[
                        StepDetail(step_num=1, step_text="Calculate 2+3=5"),
                        StepDetail(step_num=2, step_text="Square the result: 5^2=25"),
                        StepDetail(step_num=3, step_text="Final answer is 25")
                    ]
                )
            ]
            
            return ConversationDetail(
                id=conversation_id,
                topic="Sample Math Problem",
                query="What is (2+3)^2?",
                elements=mock_elements,
                image_paths=[],
                created_at=datetime.now() - timedelta(hours=1),
                updated_at=datetime.now() - timedelta(hours=1)
            )
            
        doc_ref = db.collection(self.conversations_collection).document(conversation_id)
        doc = doc_ref.get()
        
        if not doc.exists:
            return None
        
        data = doc.to_dict()
        
        # Verify ownership
        if data["user_id"] != user_id:
            return None
        
        # Convert elements back to Element objects
        elements = []
        for element_data in data["elements"]:
            # This is a simplified approach - in production you'd want proper deserialization
            elements.append(element_data)
        
        return ConversationDetail(
            id=data["id"],
            topic=data["topic"],
            query=data["query"],
            elements=elements,  # Note: This needs proper deserialization
            image_paths=data["image_paths"],
            created_at=data["created_at"],
            updated_at=data["updated_at"]
        )
    
    async def update_conversation(
        self,
        conversation_id: str,
        user_id: str,
        topic: str,
        elements: List[Element],
        image_paths: List[str]
    ) -> bool:
        """
        Update an existing conversation.
        
        Args:
            conversation_id: Conversation ID
            user_id: Firebase user ID
            topic: Updated topic
            elements: Updated elements
            image_paths: Updated image paths
            
        Returns:
            True if updated successfully, False otherwise
        """
        db = self._get_db()
        if db is None:
            print("Warning: Firestore not available, returning False")
            return False
            
        doc_ref = db.collection(self.conversations_collection).document(conversation_id)
        doc = doc_ref.get()
        
        if not doc.exists:
            return False
        
        data = doc.to_dict()
        
        # Verify ownership
        if data["user_id"] != user_id:
            return False
        
        # Update conversation
        update_data = {
            "topic": topic,
            "elements": [element.model_dump() for element in elements],
            "image_paths": image_paths,
            "updated_at": datetime.utcnow(),
            "image_count": len(image_paths)
        }
        
        doc_ref.update(update_data)
        return True
    
    async def delete_conversation(self, conversation_id: str, user_id: str) -> bool:
        """
        Delete a conversation.
        
        Args:
            conversation_id: Conversation ID
            user_id: Firebase user ID
            
        Returns:
            True if deleted successfully, False otherwise
        """
        db = self._get_db()
        if db is None:
            print("Warning: Firestore not available, returning True (mock delete)")
            return True
            
        doc_ref = db.collection(self.conversations_collection).document(conversation_id)
        doc = doc_ref.get()
        
        if not doc.exists:
            return False
        
        data = doc.to_dict()
        
        # Verify ownership
        if data["user_id"] != user_id:
            return False
        
        # Delete conversation
        doc_ref.delete()
        return True
