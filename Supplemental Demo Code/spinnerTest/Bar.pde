class Bar {
  float x, y;
  float w, h;
  color theColor;
  float theta;
  float opacityAmount;
  
  Bar(float _x, float _y, float _theta) {
    x = _x;
    y = _y;
    w = 10;
    h = 30;
    opacityAmount = 255;
    theColor = color(255,0,0,opacityAmount);
    theta = _theta;
  }
  
  void display() {
//    float redValue = red(theColor);
//    redValue -= 15;
//    redValue = constrain(redValue, 0, 255);
    opacityAmount -= 3;
    
    theColor = color(255, 0, 0, opacityAmount);
    fill(theColor);
    noStroke();
    
    pushMatrix();
      translate(x, y);
      rotate(theta);
      rect(-5, 20, 10, 30);
    popMatrix();
  }
  
}
  
    
