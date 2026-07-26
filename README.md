# 🏁 FPGA-Based Autonomous Maze Solver Robot

An autonomous maze-solving robot developed as part of the **e-Yantra Robotics Competition 2026**. 
The robot has a Verilog coded Maze Solving Algorithm ( Modified Left/Right Wall ) with Sensor interfaces, Motor Controller
- Stage 1 Completed ( Top 100 from ~1000 teams ) ( Highest score in Maze Solving Algo )
- Stage 2 Completed except Last Task ( Complete maze solving + Soil Mpisture testing with DHT11 with atmost 3 assists )
- Finals ( Top 5 out of 100 ) Not selected
---

## 📌 Overview

This project aims to design an autonomous robot capable of navigating and solving unknown mazes without external computation. Instead of using a conventional microcontroller, the entire control system is implemented on an FPGA.
The FPGA manages sensor data acquisition, motor control, communication, and maze-solving algorithms through dedicated hardware modules designed in Verilog.

---
## 📂 Repository Structure

```text
eYantra2026/
├── mb_1103_task1a/
│   └── t1a_fs_pwm/          # PWM generation module
├── mb_1103_task1b/
│   └── t1b_ultrasonic/      # HC-SR04 ultrasonic sensor interface
├── mb_1103_task1c/
│   └── t1c_riscv_cpu/       # Single Cycle RV32I RISC-V Processor
├── mb_1103_task2b/
│   └── t2b_uart/            # UART Transmitter and Receiver
├── mb_1103_task3b/          # Task 3B implementation
├── t2c_maze_explorer/       # Autonomous maze exploration algorithm
├── mb_1103_task3a.png       # Hardware/System architecture image
└── README.md                # Project documentation
```
---

### Bot Picture

<table>
<tr>
<td align="center">
<img width="899" height="596" alt="front_view" src="https://github.com/user-attachments/assets/4a612810-a0ba-466a-9210-9d60a81194fc" /><br>
<b>Front View</b><br>
Ultrasonic sensor, IR sensors
</td>

<td align="center">
<img width="891" height="559" alt="side_view" src="https://github.com/user-attachments/assets/b3fc148a-a9b9-4965-8755-bcd52a75ecb2" /><br>
<b>Side View</b><br>
Motor driver, wheels
</td>

<td align="center">
<img width="827" height="822" alt="top_view" src="https://github.com/user-attachments/assets/5c4ee2f7-fb97-427d-bf53-80662aa64006" /><br>
<b>Top View</b><br>
FPGA board, battery, wiring
</td>
</tr>
</table>


### Maze View
<img width="2003" height="1685" alt="mb_1103_task3a" src="https://github.com/user-attachments/assets/880beba5-ebee-4d7f-a262-8a49347c8092" />

## ✨ Features

- 📡 UART Communication Module
- 📏 Ultrasonic Distance Sensor Interface (HC-SR04)
- 🌡️ DHT11 Temperature & Humidity Interface
- 🚗 Differential Drive Motor Controller
- 🧠 Autonomous Maze Solving Algorithm
- 📍 Wall Detection and Path Exploration
- ⚡ Fully Hardware-Based Control System
- ✔️ Functional Verification using Verilog Testbenches

---

## 🛠 Hardware

- Intel FPGA Development Board
- Ultrasonic Sensor (HC-SR04)
- DHT11 Sensor
- HC-05 Bluetooth Module
- L298N Motor Driver
- N20 DC Gear Motors
- IR Sensors
- Battery Pack

---


## 🧠 Maze Solving Strategy

The robot uses graph-based exploration techniques to efficiently navigate unknown mazes.

Algorithms implemented include:

- Left Wall Following with Hardcoded Right Wall Following capability at certain Maze Conditions to improve exploration along with Maze Solving


The robot continuously:

1. Detects surrounding walls.
2. Records visited junctions.
3. Determines the next movement.
4. Avoids loops (inherent to Map and Algo)
5. Finds the exit while maximizing exploration efficiency.

---

## 🔍 Major Modules


### Ultrasonic Sensor Interface

Finite State Machine for:

- Trigger Pulse Generation
- Echo Measurement
- Distance Calculation

---

### UART Module

- Configurable Baud Rate
- Configurable Data Width
- Optional Parity
- Stop Bit Selection
- Serial ↔ Parallel Conversion

---

### DHT11 Interface

FSM-based protocol implementation for:

- Start Signal
- Sensor Acknowledge
- Data Reception
- Temperature & Humidity Extraction

---

### Motor Controller

Responsible for:

- Forward Motion
- Reverse Motion
- Left Turn
- Right Turn
- Stop

---

## ✔️ Verification

Each hardware module is verified independently using dedicated Verilog testbenches before system-level integration.

Verification includes:

- Functional correctness
- Timing validation
- FSM transition verification
- Sensor protocol validation

---

## 🧪 Tools Used

- Verilog HDL
- Intel Quartus Prime
- ModelSim
- Git & GitHub

---

## 📚 Skills Demonstrated

- Digital Design
- RTL Design
- FPGA Development
- Finite State Machine Design
- Functional Verification
- Embedded Systems
- Hardware-Software Co-design

---

## 🏆 e-Yantra Robotics Competition

This project is being developed as part of the **e-Yantra Robotics Competition 2026**, an initiative by **IIT Bombay** that promotes embedded systems, robotics, FPGA design, and autonomous systems.

---

## 👤 Author

**Goutham Raja, Anshul L, Harini M** , SSN College Chennai

Electronics and Electrical Engineering Graduate

Interested in:

- Computer Architecture
- RISC-V
- Functional Verification
- FPGA Design
- Embedded Systems
- AI/ML

GitHub: https://github.com/Goutham7325


Email: goutham.er07@gmail.com

---
