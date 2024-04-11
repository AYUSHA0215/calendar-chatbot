# This file is generated by the BAML compiler.
# Do not edit this file directly.
# Instead, edit the BAML files and recompile.

# ruff: noqa: E501,F401
# flake8: noqa: E501,F401
# pylint: disable=unused-import,line-too-long
# fmt: off

from baml_lib._impl.deserializer import register_deserializer
from pydantic import BaseModel
from typing import List, Optional


@register_deserializer({ "when": "time", })
class PartialMeetingRequestPartial(BaseModel):
    time: Optional[str] = None
    duration: Optional[str] = None
    attendees: List[str]
    topic: Optional[str] = None