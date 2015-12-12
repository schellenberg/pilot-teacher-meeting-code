//Pilot Teachers Meeting Demo
//Image Filtering Example - OOP Version
// Not sure that I'll show this demo, but this just encapsulates
// the filtering functionality into a class.
//Dan Schellenberg
//Dec 11, 2015

Filter filteredBean;

void setup() {
  size(600, 600);
  filteredBean = new Filter("bean.jpg");
}

void draw() {
  background(0);
  filteredBean.displayFiltered(0, 0);
}