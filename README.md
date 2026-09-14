# 🪖 Army Base Radar System

## 📖 Abstract

The **Army Base Radar System** is an Arduino-based object detection project designed to demonstrate the basic concept of radar scanning. An **HC-SR04 ultrasonic sensor** mounted on an **SG90 servo motor** scans an area from **0° to 180°**. Arduino measures the distance of detected objects and sends the data to a computer, where **Processing** displays the data on a real-time radar interface. The project provides a simple, low-cost platform for learning about sensors, microcontrollers, servo control, and real-time data visualization.

## ⚡ Features

- 📡 0°–180° scanning
- 📏 Real-time distance measurement
- 🔄 Servo-controlled sensor
- 💻 Live radar visualization
- 🔌 Arduino + Processing communication

## 🧰 Components

- Arduino Uno
- HC-SR04 Ultrasonic Sensor
- SG90 Servo Motor
- Jumper Wires
- Breadboard
- PC/Laptop

## 🔌 Connections

| Component | Arduino |
| --- | --- |
| HC-SR04 VCC | 5V |
| HC-SR04 GND | GND |
| HC-SR04 TRIG | D9 |
| HC-SR04 ECHO | D10 |
| Servo VCC | 5V |
| Servo GND | GND |
| Servo Signal | D11 |

## ⚙️ Working

```text
Servo rotates → HC-SR04 scans → Arduino measures distance
       ↓
Arduino sends Angle + Distance
       ↓
Processing displays the live radar
```

## 💻 Software

- **Arduino IDE** — Arduino programming
- **Processing** — Radar visualization

## 🚀 Applications

- Security demonstrations
- Robotics
- Object detection
- STEM & electronics projects

> ⚠️ This is an **educational ultrasonic radar-style system**, not a real military radar.

## 👨‍💻 Author

**Ekansh Taneja**

**SCAN • DETECT • MONITOR • PROTECT 🪖⚡**
