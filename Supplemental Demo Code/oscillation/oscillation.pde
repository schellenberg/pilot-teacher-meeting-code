//Dan Schellenberg
//Nov 30, 2015

float x, y;
float diam = 15;
float theta;

void setup() {
  size(600,600);
  y = height/2;
  theta = 0;
}

void draw() {
  background(255);
  theta += 0.03;
  
  //thinking about the math...
  //x = (sin(theta) + 1) * width/2;
  
  //using map() to make the math easier
  x = map(sin(theta), -1, 1, 0, width);
  //y = map(sin(theta), -1, 1, 0, height);
  
  
  //draw ellipse
  fill(0);
  stroke(0);
  line(x,y, width/2, 0);
  ellipse(x, y, diam, diam);
}