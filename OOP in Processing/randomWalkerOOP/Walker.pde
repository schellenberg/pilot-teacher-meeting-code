class Walker {
  //class data
  float x, y;
  color pointColor;

  //constructor
  Walker() {
    x = width/2;
    y = height/2;
    pointColor = color(255, 0, 0);
  }

  Walker(float _x, float _y) {
    x = _x;
    y = _y;
    pointColor = color(255, 0, 0);
  }
  
  Walker(float _x, float _y, color _pointColor) {
    x = _x;
    y = _y;
    pointColor = _pointColor;
  }

  //class behaviour
  void display() {
    stroke(pointColor);
    point(x, y);
  }
  
  void move() {
    int direction = int(random(1,101));
    
    if (direction <= 25) {
      //move up
      y--;
    }
    else if (direction <= 50) {
      //move down
      y++;
    }
    else if (direction <= 75) {
      //move right
      x++;
    }
    else {
      //move left
      x--;
    }
    
  }
}