//Dan Schellenberg
//Nov 20, 2015
//Demo to show use of booleans to acheive smoother character movement

Dude myGuy;

void setup() {
  size(600,600);
  myGuy = new Dude(width/2, height/2);
}

void draw() {
  background(255);
  myGuy.move();
  myGuy.display();
}

void keyPressed() {
  myGuy.handleKey();
}

void keyReleased() {
  myGuy.handleRelease();
}