# This file is generated by the BAML compiler.
# Do not edit this file directly.
# Instead, edit the BAML files and recompile.

# ruff: noqa: E501,F401
# flake8: noqa: E501,F401
# pylint: disable=unused-import,line-too-long
# fmt: off

from ..types.classes.cls_attendee import Attendee
from ..types.classes.cls_conversation import Conversation
from ..types.classes.cls_meetingrequest import MeetingRequest
from ..types.classes.cls_message import Message
from ..types.enums.enm_usertype import UserType
from ..types.partial.classes.cls_attendee import PartialAttendee
from ..types.partial.classes.cls_conversation import PartialConversation
from ..types.partial.classes.cls_meetingrequest import PartialMeetingRequest
from ..types.partial.classes.cls_message import PartialMessage
from baml_core.stream import AsyncStream
from baml_lib._impl.functions import BaseBAMLFunction
from typing import AsyncIterator, Callable, Protocol, runtime_checkable


IExtractMeetingRequestInfoOutput = MeetingRequest

@runtime_checkable
class IExtractMeetingRequestInfo(Protocol):
    """
    This is the interface for a function.

    Args:
        convo: Conversation
        now: str

    Returns:
        MeetingRequest
    """

    async def __call__(self, *, convo: Conversation, now: str) -> MeetingRequest:
        ...

   

@runtime_checkable
class IExtractMeetingRequestInfoStream(Protocol):
    """
    This is the interface for a stream function.

    Args:
        convo: Conversation
        now: str

    Returns:
        AsyncStream[MeetingRequest, PartialMeetingRequest]
    """

    def __call__(self, *, convo: Conversation, now: str
) -> AsyncStream[MeetingRequest, PartialMeetingRequest]:
        ...
class IBAMLExtractMeetingRequestInfo(BaseBAMLFunction[MeetingRequest, PartialMeetingRequest]):
    def __init__(self) -> None:
        super().__init__(
            "ExtractMeetingRequestInfo",
            IExtractMeetingRequestInfo,
            ["simple"],
        )

    async def __call__(self, *args, **kwargs) -> MeetingRequest:
        return await self.get_impl("simple").run(*args, **kwargs)
    
    def stream(self, *args, **kwargs) -> AsyncStream[MeetingRequest, PartialMeetingRequest]:
        res = self.get_impl("simple").stream(*args, **kwargs)
        return res

BAMLExtractMeetingRequestInfo = IBAMLExtractMeetingRequestInfo()

__all__ = [ "BAMLExtractMeetingRequestInfo" ]
