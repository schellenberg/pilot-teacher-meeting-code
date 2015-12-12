class Dude {
  float x, y;
  float xSpeed, ySpeed;
  boolean goingUp, goingDown, goingLeft, goingRight;

  Dude(float _x, float _y) {
    x = _x;
    y = _y;
    goingUp = false;
    goingDown = false;
    goingLeft = false;
    goingRight = false;
    xSpeed = 3;
    ySpeed = 3;
  }

  void display() {
    ellipse(x, y, 50, 50);
  }
  
  void move() {
    if (goingUp) {
      y -= ySpeed;
    }
    if (goingDown) {
      y += ySpeed;
    }
    if (goingLeft) {
      x -= xSpeed;
    }
    if (goingRight) {
      x += xSpeed;
    }
  }

  void handleKey() {
    if (key == 'w') {
      goingUp = true;
    }
    if (key == 'd') {
      goingRight = true;
    }
    if (key == 'a') {
      goingLeft = true;
    }
    if (key == 's') {
      goingDown = true;
    }
  }
  
  void handleRelease() {
    if (key == 'w') {
      goingUp = false;
    }
    if (key == 'd') {
      goingRight = false;
    }
    if (key == 'a') {
      goingLeft = false;
    }
    if (key == 's') {
      goingDown = false;
    }
  }
  
}