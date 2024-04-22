from enum import Enum

import adafruit_adxl34x


class BackrestSensor:

    _empty_chair_position = 1
    _trigger_offset = 0.3

    def __init__(self, i2c):
        self._accelerometer = adafruit_adxl34x.ADXL345(i2c)

    def save_empty_chair_position(self):
        _, self._empty_chair_position, _ = self._accelerometer.acceleration

    def get_if_backrest_used(self):
        _, acc, _ = self._accelerometer.acceleration
        if abs(acc - self._empty_chair_position) > self._trigger_offset:
            return True
        else:
            return False
        