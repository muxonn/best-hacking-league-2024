import time

from adafruit_extended_bus import ExtendedI2C as I2C

from backrest_sensor import BackrestSensor
from headrest_sensor import HeadrestSensor
from seat_sensor import SeatSensor, Position

import requests
from requests.auth import HTTPBasicAuth

URL = 'http://192.168.86.176/measurements'
USERNAME = 'user'
PASSWORD = 'password'

if __name__ == '__main__':
    i2c1 = I2C(1)
    seat_sensor = SeatSensor(i2c1)
    backrest_sensor = BackrestSensor(i2c1)

    i2c2 = I2C(3)
    headrest_sensor = HeadrestSensor(i2c2)

    while True:
        try:
            seated = seat_sensor.get_position();
            if seated is Position.BREAK:
                print("setting new empty chair position")
                backrest_sensor.save_empty_chair_position()

            backrest = backrest_sensor.get_if_backrest_used()
            headrest = headrest_sensor.get_is_position_correct()
            print(seated, backrest, headrest)

            # Send data to server
            data = {
                "values": {
                    "seated": seated.value == Position.BREAK,
                    "backrest": backrest,
                    "headrest": headrest
                }
            }
            response = requests.post(URL, json=data, auth=HTTPBasicAuth(USERNAME, PASSWORD))
            print(f'data sent with response:{response.status_code} {response.text}')

        except OSError as e:
            print("sensors not connected")

        time.sleep(1.0)


