//Dan Schellenberg
//Dec 5, 2014
// Although it would make more sense to have these various hitboxes as children of
// a parent HitBox class, I have not done that. This way, the students can easily
// use one of these classes on its own, if they are struggling with hitbox math.

RectHitBox myHitBox;
CircleHitBox circleCheck;
EllipseHitBox elCheck;
TriangleHitBox triCheck;

void setup() {
  size(600,600);
  myHitBox = new RectHitBox(50,50,200,100);
  circleCheck = new CircleHitBox(300,300,100);
  elCheck = new EllipseHitBox(100, 400, 100, 30);
  triCheck = new TriangleHitBox(500, 500, 400, 400, 300, 450);
}

void draw() {
  background(255);
  myHitBox.display();
  myHitBox.checkPointCollision(mouseX,mouseY);
  circleCheck.display();
  circleCheck.checkPointCollision(mouseX,mouseY);
  elCheck.display();
  elCheck.checkPointCollision(mouseX,mouseY);
  triCheck.display();
  triCheck.checkPointCollision(mouseX,mouseY);
}