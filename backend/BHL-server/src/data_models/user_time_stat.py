import time
from typing import Optional, Annotated

from pydantic import BaseModel, ConfigDict, BeforeValidator, Field

PyObjectId = Annotated[str, BeforeValidator(str)]


class UserTimeStatModel(BaseModel):
    correct_time: int = Field(default=0)
    incorrect_time: int = Field(default=0)
    break_time: int = Field(default=0)