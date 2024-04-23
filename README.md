# Back Buddy - Project created during Best Hacking League 24h Hackathon (1st place in the hardware category)
#YouTube video: https://youtu.be/4osGzpCa8mc

<p align="center">
  <img width="460" src="https://github.com/muxonn/best-hacking-league-2024/assets/40025452/eb32e203-4445-4218-8a17-a278733aba8d">
</p>

## Our Goals
Currently, one of the main problems facing contemporary employees is mental health, often exacerbated by the depressing work environment. We wanted to create a tool that could make the office space more engaging and, above all, healthier! We understand how often physical health is linked to good well-being, which is why we came up with the idea of a system monitoring sitting posture using **a strain gauge, accelerometer, and Time-of-Flight (TOF) sensors**. Employees can monitor their posture **on a dedicated mobile application, with elements of gamification between coworkers,** or receive alerts about incorrect posture through vibrations in the armrest.

## Tools Used
- Raspberry Pi 4B 2G
- TOF Sensors
- Accelerometer
- Strain Gauge
---
- Server built with FastAPI and mongoDB, storing data about users' postures and points earned
- Raspberry Pi communicates with our server using HTTP protocol
- Mobile application built with Flutter retrieves data from the server also using HTTP protocol

## Strengths of Our Solution
- Limiting stimuli - vibrations instead of notifications
- Relatively accurate detection of correct posture
- Dedicated mobile application with live posture preview feature
- Reward system motivates employees - through ranking, coworkers can compete in the "simple sitting contest," with the possibility of receiving monthly rewards for the best performers!

## Potential for Future Development
- Possibility to calibrate any chair
- Haptics in both armrests for better feedback
- Built-in notifications in the application informing about more precise posture issues
- Measuring the distance of the eyes from the monitor

<p align="center">
  <img src="https://github.com/muxonn/best-hacking-league-2024/assets/40025452/6f4ea75c-35d9-4b79-8f26-ff7c2c0a06cb" alt="logo-transparent">
</p>
<p align="center">
  <img src="https://github.com/muxonn/best-hacking-league-2024/assets/40025452/279c4fd6-bd70-41ce-a801-89b1c10af4f4" alt="hackathon-transparent">
</p>

Project created by: Jakub Mądry, Szymon Pawłowski, Antoni Pękała, Piotr Wojciechowski
