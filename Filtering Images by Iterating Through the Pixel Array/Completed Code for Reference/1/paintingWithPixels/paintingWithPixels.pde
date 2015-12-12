//Pilot Teachers Meeting Demo
//First Pixel Array Example
//Dan Schellenberg
//Dec 11, 2015

void setup() {
  size(600, 600);
}

void draw() {  
  // Constrain to not exceed the boundary of the array
  //  width-1, since the array starts counting at 0
  int x = constrain(mouseX, 0, width-1);
  int y = constrain(mouseY, 0, height-1);
  
  //need to loadPixels() to access the array
  loadPixels();
  
  //set a specific pixel to black
  pixels[y*width + x] = color(0);
  
  //write the changes back into the pixel array
  updatePixels();
}