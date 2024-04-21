import time
from datetime import datetime

import board
import busio

import adafruit_vl53l0x
import adafruit_adxl34x

correct_bottom_len = 140 #14cm
bad_bottom_len = 400 #40cm

no_person_detected_timer = 0
no_person_detected = False
no_person_acceleration_data = None
no_person_detected_data = False

actual_acceleration_data = None

def reset_no_person_timer():
    global no_person_detected_timer
    no_person_detected_timer = time.time()

def check_no_person():
    global no_person_detected_timer, no_person_detected, no_person_acceleration_data, no_person_detected_data
    no_person_timer_formatted = datetime.fromtimestamp(no_person_detected_timer).strftime('%Y-%m-%d %H:%M:%S')
    print("No person timer:", no_person_timer_formatted)
    print("Data status:", no_person_detected_data)

    # Check if 5 seconds have elapsed since no person was detected and data has not been saved
    if time.time() - no_person_detected_timer >= 5 and no_person_detected and not no_person_detected_data:
        no_person_acceleration_data = accelerometer.acceleration
        print("No person detected for 5 seconds")
        print("%f %f %f" % no_person_acceleration_data)
        no_person_detected_data = True
        return no_person_acceleration_data, no_person_detected_data  # Return the accelerometer data when condition is met
    return None, False

def check_person_back_acceleration():
    global actual_acceleration_data
    actual_acceleration_data = accelerometer.acceleration
    if abs(actual_acceleration_data[1] - no_person_acceleration_data[1])>1:
        return True
    return False


if __name__ == '__main__':
    # Initialize I2C bus and sensor.
    i2c0 = busio.I2C(board.SCL, board.SDA)
    seat_tof = adafruit_vl53l0x.VL53L0X(i2c0)
    accelerometer = adafruit_adxl34x.ADXL345(i2c0)

    i2c1 = busio.I2C(board.SCL1, board.SDA1)

    headrest = adafruit_adxl34x.ADXL345(i2c1)

    # Optionally adjust the measurement timing budget to change speed and accuracy.
    # See the example here for more details:
    #   https://github.com/pololu/vl53l0x-arduino/blob/master/examples/Single/Single.ino
    # For example a higher speed but less accurate timing budget of 20ms:
    # vl53.measurement_timing_budget = 20000
    # Or a slower but more accurate timing budget of 200ms:
    # vl53.measurement_timing_budget = 200000
    # The default timing budget is 33ms, a good compromise of speed and accuracy.
    accelerometer.enable_motion_detection()

    try:
        # Main loop will read the range and print it every second.
        while True:
            try:
                if seat_tof.range <= correct_bottom_len:
                    print("Range: {0}mm".format(seat_tof.range))
                    print("Correct Bottom")
                    reset_no_person_timer()
                    no_person_detected = False
                    no_person_detected_data = False
                elif correct_bottom_len < seat_tof.range <= bad_bottom_len:
                    print("Range: {0}mm".format(seat_tof.range))
                    print("Bad Bottom")
                    reset_no_person_timer()
                    no_person_detected = False
                    no_person_detected_data = False
                else:
                    print("Range: {0}mm".format(seat_tof.range))
                    print("No person detected")
                    no_person_detected = True
                    check_no_person()
            except OSError as e:
                print("seat_tof not connected")
            try:
                print("%f %f %f" % accelerometer.acceleration)
                # print("Motion detected: %s" % accelerometer.events["motion"])
            except OSError as e:
                print("accelerometer not connected")
            if check_person_back_acceleration():
                print("Correct Back")
            else:
                print("Bad Back")

            time.sleep(1.0)
    except KeyboardInterrupt:
        print("Exit")  # Exit on CTRL+C
