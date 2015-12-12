//Dan Schellenberg
//May 21, 2015
//This is an adaptation of the line intersection code found here:
// http://processingjs.org/learning/custom/intersect/
//Could be useful for controlling when an enemy follows a protagonist.

float lineX1, lineY1, lineX2, lineY2;
float rectX, rectY, rectWidth, rectHeight;
RectLineOfSight sightTest; 

void setup() {
  size(600,600);
  
  lineX1 = random(width);
  lineY1 = random(height);
  lineX2 = width/2;
  lineY2 = height/2;
  
  rectX = width/2; //random(width);
  rectY = height/2; //random(height);
  rectWidth = random(20,150);
  rectHeight = random(20,150);
  
  sightTest = new RectLineOfSight();
  sightTest.setRect(rectX, rectY, rectWidth, rectHeight, "CENTER");
}

void draw() {
  //update state
  lineX2 = mouseX;
  lineY2 = mouseY;
  sightTest.setTargetLocation(lineX2, lineY2);
  sightTest.setEnemyLocation(lineX1,lineY1);
  
  //update display
  background(255);
  stroke(0);
  ellipse(lineX1, lineY1, 20, 20);
  fill(0);
  if (sightTest.hasLineOfSight() ) {
    fill(255,0,0);
    stroke(255,0,0);
    line(lineX1, lineY1, lineX2, lineY2);
  }
  sightTest.drawRect();
}