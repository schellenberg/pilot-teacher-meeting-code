//Dan Schellenberg
//Dec 11, 2015

void setup()
{
  size(600, 600);
  fill(0);
}

void draw()
{
  //atan2 returns a radian from PI to -PI
  //formula for angle: atan2( y1 - y2, x1 - x2)
  float angle = atan2(mouseY - width/2, mouseX - height/2);
  
  background(255);
  pushMatrix();
    translate(width/2, height/2);
    rotate(angle);
    rect(0, -5, 50, 10);
  popMatrix();
}