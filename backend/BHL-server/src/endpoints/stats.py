import time
from typing import Optional, Annotated

from pydantic import BaseModel, ConfigDict, BeforeValidator, Field

PyObjectId = Annotated[str, BeforeValidator(str)]

