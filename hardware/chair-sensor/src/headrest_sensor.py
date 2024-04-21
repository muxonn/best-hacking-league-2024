import adafruit_vl53l0x


class HeadrestSensor:
    _max_distance = 500

    def __init__(self, i2c):
        self._accelerometer = adafruit_vl53l0x.VL53L0X(i2c)

    def get_is_position_correct(self):
        return self._accelerometer.range <= self._max_distance
