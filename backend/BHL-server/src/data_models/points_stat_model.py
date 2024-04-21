import time
from typing import Optional, Annotated

from pydantic import BaseModel, ConfigDict, BeforeValidator, Field

PyObjectId = Annotated[str, BeforeValidator(str)]

class UserPointsStatModel(BaseModel):
    user: str
    score: int

class UserRankingStatModel(BaseModel):
    ranking: list[UserPointsStatModel] = Field(default_factory=list)