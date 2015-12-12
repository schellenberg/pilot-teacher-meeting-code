//Dan Schellenberg
//May 20, 2015

Spinner theSpinner;

void setup() {
  size(600,600);
  theSpinner = new Spinner(width/2, height/2);
}

void draw() {
  background(255);
  theSpinner.display();
}