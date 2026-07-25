# 🏁 FPGA-Based Autonomous Maze Solver Robot

An autonomous maze-solving robot developed as part of the **e-Yantra Robotics Competition 2026**. 
The robot has a Verilog coded Maze Solving Algorithm ( Modified Left/Right Wall ) with Sensor interfaces, Motor Controller
---

## 📌 Overview

This project aims to design an autonomous robot capable of navigating and solving unknown mazes without external computation. Instead of using a conventional microcontroller, the entire control system is implemented on an FPGA.
The FPGA manages sensor data acquisition, motor control, communication, and maze-solving algorithms through dedicated hardware modules designed in Verilog.

---

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

## ⚙️ Processor Specifications

| Feature | Specification |
|---------|---------------|
| ISA | RV32I |
| Language | Verilog HDL |
| Instruction Memory | 2 MB |
| Data Memory | 256 Bytes |
| Verification | Verilog Testbench |


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


Email: *(Add your email)*

---
