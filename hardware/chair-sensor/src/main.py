import time

import RPi.GPIO as GPIO
import requests
from adafruit_extended_bus import ExtendedI2C as I2C
from requests.auth import HTTPBasicAuth

from armrest_sensor import ArmrestSensor
from backrest_sensor import BackrestSensor
from headrest_sensor import HeadrestSensor
from seat_sensor import SeatSensor

URL = 'http://192.168.86.176/measurements'
USERNAME = 'user'
PASSWORD = 'password'

GPIO.setmode(GPIO.BCM)
motor_pin = 25

GPIO.setup(motor_pin, GPIO.OUT)
GPIO.output(motor_pin, GPIO.LOW)


def buzz():
    GPIO.output(motor_pin, GPIO.HIGH)
    time.sleep(0.5)
    GPIO.output(motor_pin, GPIO.LOW)


if __name__ == '__main__':
    i2c1 = I2C(1)
    seat_sensor = SeatSensor(i2c1)
    backrest_sensor = BackrestSensor(i2c1)

    i2c2 = I2C(3)
    headrest_sensor = HeadrestSensor(i2c2)

    armrest_sensor = ArmrestSensor(dout_pin=5, pd_sck_pin=6)

    buzz()
    while True:
        try:
            print('------')
            armrest, reading = armrest_sensor.read()
            print(reading)
            seated = seat_sensor.get_position();
            if not seated:
                print("setting new empty chair position")
                backrest_sensor.save_empty_chair_position()

            backrest = backrest_sensor.get_if_backrest_used()
            headrest = headrest_sensor.get_is_position_correct()

            print(seated, backrest, headrest, armrest)

            if seated and (sum((not backrest, not headrest, not armrest)) >= 2):
                print("buzzing")
                buzz()
            # Send data to server
            data = {
                "values": {
                    "seated": seated,
                    "backrest": backrest,
                    "headrest": headrest,
                    "armrest": armrest
                }
            }

            print(data)

            response = requests.post(URL, json=data, auth=HTTPBasicAuth(USERNAME, PASSWORD))
            print(f'data sent with response:{response.status_code} {response.text}')

        except OSError as e:
            print("sensors not connected")
        except Exception as ex:
            print(ex)

        time.sleep(1.0)
