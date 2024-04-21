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
from src.database.mongo_config import measurements_collection

router = APIRouter()



@router.post("/",
             response_description="Add new measurement",
             status_code=status.HTTP_201_CREATED,
             response_model_by_alias=False)
async def post_measurement(measurement: MeasurementPostModel,
                           Verification = Depends(authenticate)):
    if username := Verification:
        measurement_dict = measurement.dict(by_alias=True, exclude={"id"})
        measurement_dict["owner"] = username

        last_measurement = await measurements_collection.find_one({"owner": username}, {'_id': 0} , sort=[("timestamp", -1)])
        measurement_dict["time_difference"] = measurement_dict["timestamp"] - last_measurement["timestamp"] if last_measurement else 0
        if measurement_dict["time_difference"] > 60:
            measurement_dict["time_difference"] = 0

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
    for i in range(len(measurements)):
        if not measurements[i]["values"]["seated"]:
            measurements[i]["posture"] = "break"
        elif measurements[i]["values"]["backrest"] and measurements[i]["values"]["backrest"]:
            measurements[i]["posture"] = "correct"
        else:
            measurements[i]["posture"] = "incorrect"


    return MeasurementCollection(measurements=measurements)
