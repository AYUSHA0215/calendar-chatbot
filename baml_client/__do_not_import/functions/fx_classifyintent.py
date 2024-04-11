# This file is generated by the BAML compiler.
# Do not edit this file directly.
# Instead, edit the BAML files and recompile.

# ruff: noqa: E501,F401
# flake8: noqa: E501,F401
# pylint: disable=unused-import,line-too-long
# fmt: off

from ..types.enums.enm_intent import Intent
from baml_core.stream import AsyncStream
from baml_lib._impl.functions import BaseBAMLFunction
from typing import AsyncIterator, Callable, List, Protocol, runtime_checkable


IClassifyIntentOutput = List[Intent]

@runtime_checkable
class IClassifyIntent(Protocol):
    """
    This is the interface for a function.

    Args:
        query: str

    Returns:
        List[Intent]
    """

    async def __call__(self, *, query: str) -> List[Intent]:
        ...

   

@runtime_checkable
class IClassifyIntentStream(Protocol):
    """
    This is the interface for a stream function.

    Args:
        query: str

    Returns:
        AsyncStream[List[Intent], List[Intent]]
    """

    def __call__(self, *, query: str
) -> AsyncStream[List[Intent], List[Intent]]:
        ...
class IBAMLClassifyIntent(BaseBAMLFunction[List[Intent], List[Intent]]):
    def __init__(self) -> None:
        super().__init__(
            "ClassifyIntent",
            IClassifyIntent,
            ["simple"],
        )

    async def __call__(self, *args, **kwargs) -> List[Intent]:
        return await self.get_impl("simple").run(*args, **kwargs)
    
    def stream(self, *args, **kwargs) -> AsyncStream[List[Intent], List[Intent]]:
        res = self.get_impl("simple").stream(*args, **kwargs)
        return res

BAMLClassifyIntent = IBAMLClassifyIntent()

__all__ = [ "BAMLClassifyIntent" ]
