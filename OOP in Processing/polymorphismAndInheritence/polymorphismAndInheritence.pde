//Pilot Teachers Meeting Demo
//Inheritence and Polymorphism OOP Example, coding already completed
// I use this as a guided walk-through for inheritence.
// I provide Shape, Square, Circle, then students create Line.
// To intro polymorphism, I then have them instantiate a random number of each shape
// and display them. After they write it the crappy (non-polymorphic) way, I show them
// the "shortcut".
//
//
// This code is from Chapter 22 of Daniel Shiffman's wonderful Learning Processing textbook
// http://learningprocessing.com/examples/chp22/example-22-02-polymorphism/
//
//Dan Schellenberg
//Dec 10, 2015

Shape[] theShapes;

void setup() {
  size(600, 600);

  theShapes = new Shape[100];

  for (int i=0; i<theShapes.length; i++) {
    int r = int(random(3));

    if (r == 0) {
      theShapes[i] = new Square(random(width), random(height), random(5, 20));
    } else if (r == 1) {
      theShapes[i] = new Circle(random(width), random(height), random(5, 20), color(random(255)) );
    } else {
      theShapes[i] = new Line(random(width), random(height), random(width), random(height));
    }
  }
}

void draw() {
  background(255);

  for (int i=0; i<theShapes.length; i++) {
    theShapes[i].jiggle();
    theShapes[i].display();
  }
}