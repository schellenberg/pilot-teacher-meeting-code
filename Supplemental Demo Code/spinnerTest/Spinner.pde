class Spinner {
  ArrayList<Bar> barList;
  float theta;
  float numberOfBars = 12;
  float x, y;
  Timer theTimer;

  Spinner(float _x, float _y) {
    theta = 0.0;
    x = _x;
    y = _y;
    numberOfBars = 12;
    barList = new ArrayList<Bar>();
    theTimer = new Timer(100);
    theTimer.start();
  }

  void next() {
    theta += (2*PI)/numberOfBars;
    barList.add(new Bar(x, y, theta));
  }

  void display() {
    for (int i=0; i < barList.size(); i++) {
      Bar thisBar = barList.get(i);
      if (thisBar.opacityAmount <= 0) {
        barList.remove(i);
      } else {
        thisBar.display();
      }
    }
    
    if (theTimer.isFinished() ) {
      next();
      theTimer.start();
    }
  }
}