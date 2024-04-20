from fastapi import APIRouter, Depends

from src.data_models.points_stat_model import UserRankingStatModel
from src.data_models.user_time_stat import UserTimeStatModel
from src.database.mongo_config import measurements_collection
from src.security import authenticate
from src.utils.stat_calculator import calculate_ranking, calculate_time_stats

router = APIRouter()


@router.get("/ranking",
            response_description="List ranking of users sorted by points",
            response_model=UserRankingStatModel,
            response_model_by_alias=False
            )
async def list_ranking():
    meas = await measurements_collection.find().to_list(None)
    return calculate_ranking(meas)


@router.get("/time",
            response_description="Time spent by user in correct, inorrect positions and on breaks",
            response_model=UserTimeStatModel,
            response_model_by_alias=False
            )
async def list_time(start: int, end: int, Verification=Depends(authenticate)):
    if username := Verification:
        meas = await (measurements_collection.find(
            {"owner": username, "timestamp": {"$gte": start, "$lte": end}},
            {'_id': 0}
        ).to_list(None))
    return calculate_ranking(meas)