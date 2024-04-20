from typing import Annotated

from fastapi import APIRouter, Response, Depends
from starlette import status

from src.data_models.measurement_model import (
    MeasurementModel,
    MeasurementPostModel,
    MeasurementCollection,
)
from src.security import authenticate

# from src.security import autheticate_with_username_and_password as authenticate
from src.database.mongo_config import db

router = APIRouter()

measurements_collection = db.get_collection("measurements")


@router.post("/",
             response_description="Add new measurement",
             status_code=status.HTTP_201_CREATED,
             response_model_by_alias=False)
async def post_measurement(measurement: MeasurementPostModel,
                           Verification = Depends(authenticate)):
    if username := Verification:
        measurement_dict = measurement.dict(by_alias=True, exclude={"id"})
        measurement_dict["owner"] = username
        new_measurement = await measurements_collection.insert_one(measurement_dict)


        created_measurement = await measurements_collection.find_one(
            {"_id": new_measurement.inserted_id}
        )
        return Response(headers={"Location": f"/measurements/{created_measurement['_id']}"})


@router.get("/", response_description="List all measurements",
            response_model=MeasurementCollection,
            response_model_by_alias=False)
async def list_measurements(page: int = 0, size: int = 1000):
    print(f"page: {page}, size: {size}")
    measurements = await measurements_collection.find().sort("timestamp", -1).skip(page*size).limit(size).to_list(size)
    return MeasurementCollection(measurements=measurements)
