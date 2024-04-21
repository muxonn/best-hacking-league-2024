from src.data_models.measurement_model import MeasurementModel
from src.data_models.points_stat_model import UserRankingStatModel, UserPointsStatModel
from src.data_models.user_time_stat import UserTimeStatModel


def _calculate_correct_incorrect(values: dict, time_difference: int):
    correct_time = {
        'headrest': 0,
        'backrest': 0
    }

    incorrect_time = {
        'headrest': 0,
        'backrest': 0
    }

    break_time = 0

    if values['seated']:
        if values['backrest']:
            correct_time['backrest'] += time_difference
        else:
            incorrect_time['backrest'] += time_difference

        if values['headrest']:
            correct_time['headrest'] += time_difference
        else:
            incorrect_time['backrest'] += time_difference
    else:
        # ktoś nie siedzi
        break_time += time_difference

    return sum(correct_time.values()), sum(incorrect_time.values()), break_time


def _calculate_points(measurement: dict):
    values = measurement['values']
    time_difference = measurement['time_difference']

    correct_time, incorrect_time, break_time = _calculate_correct_incorrect(values, time_difference)
    score = correct_time * 2 - incorrect_time
    # return score if score > 0 else 0
    return score

def calculate_ranking(meas: list[MeasurementModel]) -> UserRankingStatModel:
    user_scores = {}
    for measurement in meas:
        if measurement['owner'] not in user_scores.keys():
            user_scores[measurement['owner']] = 0
        user_scores[measurement['owner']] += _calculate_points(measurement)

    ranking = UserRankingStatModel()
    for user in user_scores.keys():
        ranking.ranking.append(
            UserPointsStatModel(
                user=user,
                score=user_scores[user]
            )
        )
    ranking.ranking.sort(key=lambda x: x.score, reverse=True)

    return ranking


def calculate_time_stats(meas: list[MeasurementModel]) -> UserTimeStatModel:
    result = UserTimeStatModel(
        correct_time=0,
        incorrect_time=0,
        break_time=0
    )

    for measurement in meas:
        correct_time, incorrect_time, break_time = _calculate_correct_incorrect(measurement['values'],
                                                                                measurement['time_difference'])
        result.correct_time += correct_time
        result.incorrect_time += incorrect_time
        result.break_time += break_time

    return result
