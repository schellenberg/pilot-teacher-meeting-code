//Pilot Teachers Meeting Demo
//Functional Stickman Example, to be converted into OOP
// This is a nice demo to show students the differences between
// functional and OOP paradigms.
//Dan Schellenberg
//Dec 10, 2015

void setup() {
  size(600, 600);
}

void draw() {
  background(255);
  drawStickman(mouseX, mouseY, 5);
}

void drawStickman(float x, float y, float stickmanWeight) {
  strokeWeight(stickmanWeight);
  //body
  line(x, y, x, y+200);

  //legs
  line(x, y+200, x-50, y+250);
  line(x, y+200, x+50, y+250);

  //arms
  line(x-50, y+100, x+50, y+100);

  //head
  fill(255);
  ellipse(x, y, 80, 80);
}