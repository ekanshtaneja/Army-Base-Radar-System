import processing.serial.*;

Serial myPort;

int angle = 90;
int distance = 400;

void setup() {
  size(1000, 600);
  smooth();

  println(Serial.list());

  // CHANGE COM3 TO YOUR ARDUINO COM PORT
  myPort = new Serial(this, "COM3", 9600);
  myPort.bufferUntil('\n');
}

void draw() {

  background(0);

  // Radar center
  translate(width / 2, height - 40);

  // Radar circles
  stroke(0, 255, 0);
  strokeWeight(2);
  noFill();

  arc(0, 0, 200, 200, PI, TWO_PI);
  arc(0, 0, 400, 400, PI, TWO_PI);
  arc(0, 0, 600, 600, PI, TWO_PI);
  arc(0, 0, 800, 800, PI, TWO_PI);

  // Radar base line
  line(-400, 0, 400, 0);

  // Radar angle lines
  line(0, 0, -346, -200);
  line(0, 0, -200, -346);
  line(0, 0, 200, -346);
  line(0, 0, 346, -200);

  // Convert angle
  float radarAngle = radians(angle);

  // Scanning line
  float x = 400 * cos(PI - radarAngle);
  float y = -400 * sin(radarAngle);

  stroke(0, 255, 0);
  strokeWeight(3);

  line(0, 0, x, y);

  // Object detection
  if (distance < 400 && distance > 2) {

    float objectDistance = map(distance, 0, 400, 0, 400);

    float objectX = objectDistance * cos(PI - radarAngle);
    float objectY = -objectDistance * sin(radarAngle);

    // Target
    fill(255, 0, 0);
    noStroke();
    ellipse(objectX, objectY, 16, 16);

    // Target glow
    noFill();
    stroke(255, 0, 0);
    ellipse(objectX, objectY, 30, 30);
  }

  // Return to normal screen coordinates
  resetMatrix();

  // Title
  fill(0, 255, 0);
  textSize(24);
  text("ARMY BASE RADAR SYSTEM", 30, 40);

  // Angle
  textSize(18);
  text("ANGLE: " + angle + "°", 30, 75);

  // Distance
  if (distance >= 400) {
    text("DISTANCE: OUT OF RANGE", 30, 105);
  } 
  else {
    text("DISTANCE: " + distance + " cm", 30, 105);
  }

  // Status
  if (distance < 400 && distance > 2) {
    fill(255, 0, 0);
    text("⚠ TARGET DETECTED", 30, 140);
  } 
  else {
    fill(0, 255, 0);
    text("● AREA CLEAR", 30, 140);
  }

  // Footer
  fill(0, 255, 0);
  textSize(15);
  text("SCAN • DETECT • MONITOR • PROTECT", 30, height - 20);
}


// Receive data from Arduino
void serialEvent(Serial myPort) {

  String data = myPort.readStringUntil('\n');

  if (data != null) {

    data = trim(data);

    String[] values = split(data, ',');

    if (values.length == 2) {

      angle = int(values[0]);
      distance = int(values[1]);
    }
  }
}
