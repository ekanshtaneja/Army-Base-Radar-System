## 🔌 Circuit Connections

| ComponentPinArduino UNO |        |     |
| ----------------------- | ------ | --- |
| **HC-SR04**             | VCC    | 5V  |
|                         | GND    | GND |
|                         | TRIG   | D9  |
|                         | ECHO   | D10 |
| **SG90 Servo**          | Signal | D11 |
|                         | VCC    | 5V  |
|                         | GND    | GND |
| **16×2 I²C LCD**        | VCC    | 5V  |
|                         | GND    | GND |
|                         | SDA    | A4  |
|                         | SCL    | A5  |

## ⚙️ Working

The **SG90 servo** rotates the HC-SR04 ultrasonic sensor from **0° to 180° and back**. At each angle, the HC-SR04 measures the distance of objects, and the Arduino processes the readings. The **I²C LCD** displays the current angle and distance, while the Arduino sends the same data to the computer through serial communication for the Processing radar display.
