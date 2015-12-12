//Dan Schellenberg
//Dec 2, 2015

float x, y;
float offset;

void setup() {
  size(600, 600);
  y = height/2;
  x = width/2;
  offset = 0;
}

void draw() {
  x = noise(offset)*width;
  offset += 0.01;
  background(255);
  fill(0);
  ellipse(x, y, 50, 50);
}