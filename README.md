# Back Buddy - Project created for 24h Hackathon Best Hacking League (1st place in category Hardware)

![app](https://github.com/muxonn/best-hacking-league-2024/assets/40025452/e7df26e7-6455-400e-8298-20cd583efeaf)


## Our Goals
Currently, one of the main problems facing contemporary employees is mental health, often exacerbated by the depressing work environment. We wanted to create a tool that could make the office space more engaging and, above all, healthier! We understand how often physical health is linked to good well-being, which is why we came up with the idea of a system monitoring sitting posture using **a strain gauge, accelerometer, and Time-of-Flight (TOF) sensors**. Employees can monitor their posture **on a dedicated mobile application, with elements of gamification between coworkers,** or receive alerts about incorrect posture through vibrations in the armrest.

## Tools Used
- Raspberry Pi 4B 2G
- TOF Sensors
- Accelerometer
- Strain Gauge
---
- Server built with FastAPI, storing user data about their postures and points earned
- Raspberry Pi communicates with our server using HTTP protocol
- Mobile application built in Flutter technology retrieves data from the server also using HTTP protocol

## Strengths of Our Solution
- Limiting stimuli - vibrations instead of notifications
- Relatively accurate detection of correct posture
- Dedicated mobile application with live posture preview feature
- Reward system motivates employees - through ranking, coworkers can compete in the "simple sitting contest," with the possibility of receiving monthly rewards for the best performers!

## Potential for Future Development
- Possibility to calibrate any chair
- Haptics in both armrests for better feedback
- Built-in notifications in the application informing about more precise posture issues

<p align="center">
  <img src="https://github.com/muxonn/best-hacking-league-2024/assets/40025452/6f4ea75c-35d9-4b79-8f26-ff7c2c0a06cb" alt="logo-transparent">
</p>

<p align="center">
  <img src="https://github.com/muxonn/best-hacking-league-2024/assets/40025452/8260319b-931b-4bf9-ae24-a073f60182c5" alt="logo-transparent">
</p>


Project created by: Jakub Mądry, Szymon Pawłowski, Antoni Pękała, Piotr Wojciechowski
