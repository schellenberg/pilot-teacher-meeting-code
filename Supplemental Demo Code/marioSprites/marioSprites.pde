//Dan Schellenberg
//May 13, 2015

PImage[] mario = new PImage[12];
int displayNumber;
int startTime;
int x;

void setup() {
  size(600, 600);

  for (int i=0; i < 12; i++) {
    mario[i] = loadImage(i + ".png");
  }
  displayNumber = 0;
  startTime = millis();
  x = 100;
}

void draw() {
  background(255);

  image(mario[displayNumber], x, 100); 

  if (millis() > startTime + 100) {
    if (displayNumber < 11 ) {
      displayNumber++;
    } else {
      displayNumber = 0;
    }

    startTime = millis();
  }
}


void keyPressed() {
  if (key == 'a') {
    x = x - 5;
  }
  if (key == 'd') {
    x = x + 5;
  }
}