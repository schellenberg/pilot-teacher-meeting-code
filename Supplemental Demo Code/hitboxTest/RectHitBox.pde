class RectHitBox {
  float x, y, w, h;
  boolean isHit;
  
  RectHitBox(float _x, float _y, float _w, float _h) {
    isHit = false;
    x = _x;
    y = _y;
    w = _w;
    h = _h;
  }
  
  boolean checkPointCollision(float Px, float Py) {
    boolean currentlyHitting = (Px >= x && Px <= x+w) && (Py >= y && Py <= y+h);
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
    rect(x,y,w,h);
  }
}