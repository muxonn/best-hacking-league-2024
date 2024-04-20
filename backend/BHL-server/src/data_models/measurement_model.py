import time
from typing import Optional, Annotated

from pydantic import BaseModel, ConfigDict, BeforeValidator, Field


PyObjectId = Annotated[str, BeforeValidator(str)]

class MeasurementModel(BaseModel):
    id: Optional[PyObjectId] = Field(alias="_id", default=None)
    timestamp: int = Field(alias="timestamp", default_factory=lambda: round(time.time()))
    seated: bool
    height: float
    owner: str

    model_config = ConfigDict(
        populate_by_alias=True,
        arbitrary_types_allowed=True,
        json_schema_extra={
            "example": {
                "timestamp": 1630550400,
                "seated": True,
                "height": 1.0,
                "owner": "John Doe"
            }
        },
    )

class MeasurementPostModel(BaseModel):
    id: Optional[PyObjectId] = Field(alias="_id", default=None)
    timestamp: int = Field(alias="timestamp", default_factory=lambda: round(time.time()))
    seated: bool
    height: float

    model_config = ConfigDict(
        populate_by_alias=True,
        arbitrary_types_allowed=True,
        json_schema_extra={
            "example": {
                "timestamp": 1630550400,
                "seated": True,
                "height": 1.0,
                "owner": "John Doe"
            }
        },
    )


class MeasurementCollection(BaseModel):
    measurements: list[MeasurementModel]
    model_config = ConfigDict(
        populate_by_alias=True,
        arbitrary_types_allowed=True,
    )
