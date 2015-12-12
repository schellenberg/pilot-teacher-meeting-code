//Pilot Teachers Meeting Demo
//First Image Filtering Example
// I find it most useful to live-code this with students,
// so you can explain each part of the code as you do it.
// This completed version is provided just in case you get
// lost during my demo.
//Dan Schellenberg
//Dec 10, 2015

PImage greatPassword;

void setup() {
  size(600, 600);
  greatPassword = loadImage("passwords.jpeg");

  //comment/uncomment the line below to toggle filter on or off
  applyFilter(greatPassword);
}

void draw() {
  background(0);
  image(greatPassword, 0, 0);
}

void applyFilter(PImage someImage) {
  //load the pixel array of the PImage
  someImage.loadPixels();
  
  //length of the array is width * height of image
  int lengthOfArray = someImage.width * someImage.height;

  for (int i=0; i<lengthOfArray; i++ ) {
    //retrieve RGB values for each pixel
    float redAmount = red(someImage.pixels[i]);
    float greenAmount = green(someImage.pixels[i]);
    float blueAmount = blue(someImage.pixels[i]);

    //apply simple image filter
    float newRed = 255 - redAmount;
    float newGreen = 255 - greenAmount;
    float newBlue = 255 - blueAmount;

    //don't let the values go above 255 or below 0
    newRed = constrain(newRed, 0, 255);
    newGreen = constrain(newGreen, 0, 255);
    newBlue = constrain(newBlue, 0, 255);

    //overwrite old pixel information with new, filtered pixel info
    someImage.pixels[i] = color(newRed, newGreen, newBlue);
  }

  //write the changes back to the PImage
  someImage.updatePixels();
}