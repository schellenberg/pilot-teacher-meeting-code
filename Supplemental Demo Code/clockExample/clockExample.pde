//Dan Schellenberg
//Oct 23, 2013

float sizeOfCircle;

void setup() {
  size(600,600);
  sizeOfCircle = 500;
}

void draw() {
  background(255);
  stroke(0);
  
  //clock face
  pushMatrix();  //save transformation matrix
    //set origin to middle of window
    translate(width/2,height/2);
    
    //outer circle
    strokeWeight(4);
    ellipse(0,0,sizeOfCircle,sizeOfCircle);
    
    //big lines - hours
    strokeWeight(4);
    for (int i = 0; i<=12;i++) {
      line(0.3*sizeOfCircle,0,.45*sizeOfCircle,0);
      rotate(2*PI/12);
    }
    
    //small lines - minutes
    strokeWeight(1);
    for (int i=0; i<=60;i++) {
      line(.325*sizeOfCircle,0,.45*sizeOfCircle,0);
      rotate(2*PI/60);
    }
  popMatrix();    //reset transformation matrix to last pushMatrix

  //get current time
  int s = second();
  int m = minute();
  int h = hour();
  
  //second hand
  pushMatrix();
    translate(width/2,height/2);
    rotate(2*PI/60*s);  
    strokeWeight(1);
    stroke(255,0,0);
    line(0,0,0,-0.45*sizeOfCircle);
  popMatrix();

  //minute hand
  pushMatrix();
    translate(width/2,height/2);
    rotate((2*PI/60*m) + (2*PI/(60*60)*s));  
    strokeWeight(3);
    stroke(255,0,0);
    line(0,0,0,-0.45*sizeOfCircle);
  popMatrix();

  //hour hand
  pushMatrix();
    translate(width/2,height/2);
    rotate((2*PI/12*h) + (2*PI/(12*60)*m));  
    strokeWeight(6);
    stroke(255,0,0);
    line(0,0,0,-0.225*sizeOfCircle);
  popMatrix();
}