from enum import Enum

import adafruit_vl53l0x


class Position(Enum):
    CLOSE = "close"
    FAR = "far"
    BREAK = "break"


class SeatSensor:
    def __init__(self, i2c):
        self._accelerometer = adafruit_vl53l0x.VL53L0X(i2c)

    def get_position(self):
        range = self._accelerometer.range

        if range < 100:
            return Position.CLOSE
        elif range < 300:
            return Position.FAR
        else:
            return Position.BREAK
