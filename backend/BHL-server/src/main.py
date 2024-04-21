from fastapi import FastAPI, Depends

from src.endpoints import(
    measurements,
    stats
)

from src.security import authenticate
from src.security import security


app = FastAPI()

app.include_router(measurements.router, prefix='/measurements', tags=['measurements'])
app.include_router(stats.router, prefix='/stats', tags=['stats'])

from src.database.mongo_config import db
users_collection = db.get_collection("users")


