//Pilot Teachers Meeting Demo
//Basic OOP Example, coding already completed
// I like to get the students to code this as one 
// of their first attempts at OOP.
//This idea came from The Nature of Code, again by Daniel Shiffman
//  http://natureofcode.com/book/introduction/
//Dan Schellenberg
//Dec 10, 2015

Walker jayden;
Walker frances;
Walker charles;

void setup() {
  size(600,600);
  background(0);
  jayden = new Walker();
  frances = new Walker(100,400);
  charles = new Walker(400, 500, color(0,255,0));
}

void draw() {
  //logic of this frame
  jayden.move();
  frances.move();
  charles.move();
  
  //displaying this frame
  jayden.display();
  frances.display();
  charles.display();
}