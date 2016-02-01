//Dan Schellenberg
//
//2D Arrays Example
//  - loading platformer level data
//  - tiles are from http://open.commonly.cc


Level thisLevel;

void setup() {
  size(600, 450);  // 4:3 ratio
  thisLevel = new Level("levels/0.txt", "level_background.png");
}

void draw() {
  thisLevel.display();
}