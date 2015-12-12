class TriangleHitBox {
  float x1, y1, x2, y2, x3, y3;
  boolean isHit;
  
  TriangleHitBox(float _x1, float _y1, float _x2, float _y2, float _x3, float _y3) {
    isHit = false;
    x1 = _x1;
    y1 = _y1;
    x2 = _x2;
    y2 = _y2;
    x3 = _x3;
    y3 = _y3;
  }
  
  float sign(float _x1, float _y1, float _x2, float _y2, float _x3, float _y3) {
    return (_x1 - _x3) * (_y2 - _y3) - (_x2 - _x3) * (_y1 - _y3);
  }
  
  boolean checkPointCollision(float Px, float Py) {
    boolean b1, b2, b3;
    b1 = sign(Px, Py, x1, y1, x2, y2) < 0.0;
    b2 = sign(Px, Py, x2, y2, x3, y3) < 0.0;
    b3 = sign(Px, Py, x3, y3, x1, y1) < 0.0;
    
    boolean currentlyHitting = ((b1 == b2) && (b2 == b3));
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
    triangle(x1,y1,x2,y2,x3,y3);
  }
}