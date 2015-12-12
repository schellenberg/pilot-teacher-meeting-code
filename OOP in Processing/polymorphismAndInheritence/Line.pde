class Line extends Shape {
  float x2, y2;
  
  Line(float _x, float _y, float _x2, float _y2) {
    super(_x, _y, 0);
    x2 = _x2;
    y2 = _y2;
  }
  
  void display() {
    line(x, y, x2, y2);
  }
  
  void jiggle() {
   super.jiggle();
   x2 += random(-1,1);
   y2 += random(-1,1);
  }
  
}