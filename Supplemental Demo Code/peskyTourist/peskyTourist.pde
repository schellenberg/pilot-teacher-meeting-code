//Dan Schellenberg
//March 13, 2014
//idea for this came from http://nifty.stanford.edu/2014/nicholson-the-pesky-tourist/

PImage[] imgArray = new PImage[9];

void setup() {
  size(495, 557);
  for (int i=0;i<imgArray.length;i++) {
    String fileName = i+1 + ".png";
    imgArray[i] = loadImage(fileName);
    //println(fileName);
  }
}

void draw() {
  loadPixels();
  // We must also call loadPixels() on the PImage since we are going to read its pixels.
  println(millis());
  for (int y = 0; y < height; y++ ) {
    for (int x = 0; x < width; x++ ) {
      int loc = x + y*width;
      float[] redValues = new float[imgArray.length];
      float[] greenValues = new float[imgArray.length];
      float[] blueValues = new float[imgArray.length];

      for (int i=0;i<imgArray.length;i++) {
        imgArray[i].loadPixels();
        // The functions red(), green(), and blue() pull out the three color components from a pixel.
        float r = red(imgArray[i].pixels [loc]); 
        float g = green(imgArray[i].pixels[loc]);
        float b = blue(imgArray[i].pixels[loc]);

        // Image Processing would go here
        // If we were to change the RGB values, we would do it here, before setting the pixel in the display window.
        redValues[i] = r;
        greenValues[i] = g;
        blueValues[i] = b;
      }

      redValues = sort(redValues);
      greenValues = sort(greenValues);
      blueValues = sort(blueValues);
      
      float midR = redValues[round(imgArray.length / 2)];
      float midG = greenValues[round(imgArray.length / 2)];
      float midB = blueValues[round(imgArray.length / 2)];

      // Set the display pixel to the image pixel
      pixels[loc] = color(midR, midG, midB);
    }
  }

updatePixels();
println(millis());
}