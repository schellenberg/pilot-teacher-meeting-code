class EllipseHitBox {
  float x, y, rX, rY;
  boolean isHit;
  
  EllipseHitBox(float _x, float _y, float _rX, float _rY) {
    isHit = false;
    x = _x;
    y = _y;
    rX = _rX;
    rY = _rY;
  }
  
  boolean checkPointCollision(float Px, float Py) {
    boolean currentlyHitting = ((Px-x)*(Px-x)/(rX*rX) + (Py-y)*(Py-y)/(rY*rY) <= 1);
    if (currentlyHitting) {
      isHit = true;
      println("Hit!");
      return true;
    }
    else {
      isHit = false;
      return false;
    }
  }
  
  void display() {
    if (isHit) {
      fill(255,0,0);
    }
    else {
      fill(255);
    }
    ellipse(x,y,rX*2,rY*2);
  }
}