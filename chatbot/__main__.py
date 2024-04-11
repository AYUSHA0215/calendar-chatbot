"""
python -m chatbot
"""
import asyncio
from .pipeline import convo_demo

if __name__ == "__main__":
    asyncio.run(convo_demo())
