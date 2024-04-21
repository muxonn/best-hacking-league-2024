import time

import board
import busio



from adafruit_extended_bus import ExtendedI2C as I2C

from seat_sensor import SeatSensor
from backrest_sensor import BackrestSensor



if __name__ == '__main__':
    i2c = I2C(1)
    seat_sensor = SeatSensor(i2c)
    backrest_sensor = BackrestSensor(i2c)


    while True:
        print(seat_sensor.get_position())
        print(backrest_sensor.get_if_backrest_used())
        time.sleep(1.0)









    # Optionally adjust the measurement timing budget to change speed and accuracy.
    # See the example here for more details:
    #


# if __name__ == '__main__':
#
#     # Initialize I2C bus and sensor.
#     i2c = busio.I2C(board.SCL, board.SDA)
#     seat_tof = adafruit_vl53l0x.VL53L0X(i2c)
#     accelerometer = adafruit_adxl34x.ADXL345(i2c)
#
#     # Optionally adjust the measurement timing budget to change speed and accuracy.
#     # See the example here for more details:
#     #   https://github.com/pololu/vl53l0x-arduino/blob/master/examples/Single/Single.ino
#     # For example a higher speed but less accurate timing budget of 20ms:
#     # vl53.measurement_timing_budget = 20000
#     # Or a slower but more accurate timing budget of 200ms:
#     # vl53.measurement_timing_budget = 200000
#     # The default timing budget is 33ms, a good compromise of speed and accuracy.
#     accelerometer.enable_motion_detection()
#     try:
#         # Main loop will read the range and print it every second.
#         while True:
#             try:
#                 print(seat_tof.range)
#             except OSError as e:
#                 print("seat_tof not connected")
#             try:
#                 print(accelerometer.acceleration)
#                 print("Motion detected: %s" % accelerometer.events["motion"])
#             except OSError as e:
#                 print("accelerometer not connected")
#
#             time.sleep(1.0)
#     except KeyboardInterrupt:
#         print("Exit")  # Exit on CTRL+Cexi

# import time
#
# import board
# import busio
#
# import adafruit_vl53l0x
#
# # Initialize I2C bus and sensor.
# i2c = busio.I2C(board.SCL, board.SDA)
# vl53 = adafruit_vl53l0x.VL53L0X(i2c)
#
# # Optionally adjust the measurement timing budget to change speed and accuracy.
# # See the example here for more details:
# #   https://github.com/pololu/vl53l0x-arduino/blob/master/examples/Single/Single.ino
# # For example a higher speed but less accurate timing budget of 20ms:
# # vl53.measurement_timing_budget = 20000
# # Or a slower but more accurate timing budget of 200ms:
# # vl53.measurement_timing_budget = 200000
# # The default timing budget is 33ms, a good compromise of speed and accuracy.
#
# try:
#     # Main loop will read the range and print it every second.
#     while True:
#         print("Range: {0}mm".format(vl53.range))
#         time.sleep(1.0)
# except KeyboardInterrupt:
#     print("Exit")  # Exit on CTRL+C