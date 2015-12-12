//Pilot Teachers Meeting Demo
//Image Filtering Example - Requires Second PImage
// In this demo, you can't adjust the original image, or the image will be
// messed very quickly... a second PImage is used to hold the filtered
// version of the original.
//Dan Schellenberg
//Dec 11, 2015

PImage davey;
PImage messedDavey;

void setup() {
  size(600, 600);
  davey = loadImage("davey.jpg");  //this is a constructor replacement, by the way
  davey.resize(width,0); //it's a big image. The 0 for height keeps it proportional
  messedDavey = createImage(davey.width, davey.height, RGB); //this creates an empty PImage of the same size, where we'll save filtered pixels 
}

void draw() {
  background(255);
  
  //load pixels of both images. Original will just be accessed, second one will be updated.
  davey.loadPixels();
  messedDavey.loadPixels();
  
  for (int x=0; x < davey.width; x++) {
    for (int y=0; y < davey.height; y++) {
      int pixLoc = y * davey.width + x;  //always the same formula...

      //retrieve RGB values for current pixel
      float r = red(davey.pixels[pixLoc]);
      float g = green(davey.pixels[pixLoc]);
      float b = blue(davey.pixels[pixLoc]);

      //create variables to hold new RGB values for current pixel
      float newR, newG, newB;

      //any image processing goes here
      //in this case, just a simple distace check...
      float distFromMouse = dist(x, y, mouseX, mouseY);  //how far is current pixel from mouse
      
      if (distFromMouse < 100) {  //within 100 pixel radius
        newR = r;
        newG = g;
        newB = b;
      } else {                    //outside 100 pixel radius 
        newR = 0;
        newG = 0;
        newB = 0;
      }

      //update pixels in array
      messedDavey.pixels[pixLoc] = color(newR, newG, newB);
    }
  }

  //write array back into PImage
  messedDavey.updatePixels();
  
  //display the PImage
  image(messedDavey, 0, 0);
}