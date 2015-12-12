class CircleHitBox {
  float x, y, r;
  boolean isHit;
  
  CircleHitBox(float _x, float _y, float _r) {
    isHit = false;
    x = _x;
    y = _y;
    r = _r;
  }
  
  boolean checkPointCollision(float Px, float Py) {
    boolean currentlyHitting = (dist(x,y,Px,Py) <= r);
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
    ellipse(x,y,r*2,r*2);
  }
}