import calendar
import datetime

from fastapi import APIRouter, Depends

import time

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
async def list_ranking(month: int = None):

    year = 2024
    start_date = datetime.datetime(year, month, 1, 0, 0, 0)
    _, last_day = calendar.monthrange(year, month)
    end_date = datetime.datetime(year, month, last_day, 23, 59, 59)

    start = int(start_date.timestamp())
    end = int(end_date.timestamp())

    meas = await measurements_collection.find({"timestamp": {"$gte": start, "$lte": end}}).to_list(None)
    return calculate_ranking(meas)


@router.get("/time",
            response_description="Time spent by user in correct, inorrect positions and on breaks",
            response_model=UserTimeStatModel,
            response_model_by_alias=False
            )
async def list_time(month: int = None, Verification=Depends(authenticate)):

    year = 2024
    start_date = datetime.datetime(year, month, 1, 0, 0, 0)
    _, last_day = calendar.monthrange(year, month)
    end_date = datetime.datetime(year, month, last_day, 23, 59, 59)

    start = int(start_date.timestamp())
    end = int(end_date.timestamp())

    if username := Verification:
        meas = await (measurements_collection.find(
            {"owner": username, "timestamp": {"$gte": start, "$lte": end}},
            {'_id': 0}
        ).to_list(None))
    return calculate_ranking(meas)