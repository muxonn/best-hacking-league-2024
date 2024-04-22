import RPi.GPIO as GPIO
from hx711 import HX711

class ArmrestSensor:
    def __init__(self, dout_pin, pd_sck_pin):
        self.hx711 = HX711(dout_pin=dout_pin, pd_sck_pin=pd_sck_pin)
        self.hx711.zero()

    def read(self):
        print('aaa')
        reading = self.hx711.get_data_mean()
        print(reading)
        if abs(reading) > 100:
            return True, reading
        else:
            return False, reading

    def cleanup(self):
        GPIO.cleanup()
