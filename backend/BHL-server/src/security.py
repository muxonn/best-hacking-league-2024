import secrets
from types import NoneType
from typing import Annotated

from fastapi import Depends, HTTPException
from fastapi.security import HTTPBasic, HTTPBasicCredentials
from pydantic import BaseModel
from starlette import status

from src.database.mongo_config import users_collection


security = HTTPBasic()

async def authenticate(creds: HTTPBasicCredentials = Depends(security)):
    username = creds.username
    password = creds.password
    print(username)
    user_details = await users_collection.find_one({"username": username}, {'_id': 0})
    print(user_details)
    if user_details and password == user_details["password"]:
        return username
    else:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Incorrect username or password",
            headers={"WWW-Authenticate": "Basic"},
        )