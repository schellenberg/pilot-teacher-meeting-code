class Timer {
  int startTime;
  int totalTime;
  
  Timer(int _totalTime) {
    totalTime = _totalTime;
  }
  
  void start() {
    startTime = millis();
  }
  
  boolean isFinished() {
    int elapsedTime = millis() - startTime;
    if (elapsedTime > totalTime) {
      return true;
    }
    else {
      return false;
    }
  }
}
