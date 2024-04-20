from src.data_models.measurement_model import MeasurementModel
from src.data_models.points_stat_model import UserRankingStatModel, UserPointsStatModel


def calculate_points(measurement: dict):
    values = measurement['values']
    time_difference = measurement['time_difference']

    correct_time = {
        'headrest': 0,
        'backrest': 0
    }

    incorrect_time = {
        'headrest': 0,
        'backrest': 0
    }

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
        pass

    return sum(correct_time.values()) * 2 - (sum(correct_time.values()) + sum(incorrect_time.values()))


def calculate_ranking(meas: list[MeasurementModel]):
    user_scores = {}
    for measurement in meas:
        if measurement['owner'] not in user_scores.keys():
            user_scores[measurement['owner']] = 0
        user_scores[measurement['owner']] += calculate_points(measurement)

    ranking = UserRankingStatModel()
    for user in user_scores.keys():
        ranking.ranking.append(
            UserPointsStatModel(
                user=user,
                score=user_scores[user]
            )
        )
    return ranking
