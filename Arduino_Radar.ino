#include <Servo.h>

Servo radarServo;

const int trigPin = 9;
const int echoPin = 10;
const int servoPin = 11;

void setup() {
  Serial.begin(9600);

  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);

  radarServo.attach(servoPin);
  radarServo.write(90);

  delay(1000);
}

long getDistance() {
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);

  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);

  long duration = pulseIn(echoPin, HIGH, 30000);

  if (duration == 0) {
    return 400;
  }

  long distance = duration * 0.034 / 2;

  if (distance > 400) {
    distance = 400;
  }

  return distance;
}

void scan(int startAngle, int endAngle, int step) {

  for (int angle = startAngle;
       (step > 0) ? angle <= endAngle : angle >= endAngle;
       angle += step) {

    radarServo.write(angle);
    delay(25);

    long distance = getDistance();

    Serial.print(angle);
    Serial.print(",");
    Serial.println(distance);

    delay(15);
  }
}

void loop() {

  // 0° → 180°
  scan(0, 180, 1);

  // 180° → 0°
  scan(180, 0, -1);
}
