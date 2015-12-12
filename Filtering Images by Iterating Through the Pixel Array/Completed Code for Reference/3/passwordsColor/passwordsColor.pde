//Pilot Teachers Meeting Demo
//Display Image and Retrive Info from Pixel Array
//Dan Schellenberg
//Dec 11, 2015

PImage passwords;  //can display .gif, .jpg, .tga, and .png images

void setup() {
  size(500, 380);
  passwords = loadImage("passwords.jpeg");
}

void draw() { 
  background(0);  //draw black background
  image(passwords, 0, 0);  //display the image at x-cord 0 and y-cord 0 (top left)
  
  // Constrain to not exceed the boundary of the array
  int x = constrain(mouseX, 0, width-1);  
  int y = constrain(mouseY, 0, height-1);  
  
  loadPixels();  //need to loadPixels to retrieve color info
  color c = pixels[y*width + x]; //color is a data type in Processing
  
  fill(c); //set color inside shapes
  rectMode(CENTER);
  rect(width/2, height/2, 100, 100);  //x, y, width, height
}