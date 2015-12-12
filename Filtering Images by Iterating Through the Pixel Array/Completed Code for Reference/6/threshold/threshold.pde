//Pilot Teachers Meeting Demo
//Image Filtering Example - Threshold Filter
// The only change from the last demo is the image
// filtering algorithm.
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
      
      //brightness - perceived brightness of a color
      //  not certain, but I think the built-in function is doing this: http://stackoverflow.com/questions/596216/formula-to-determine-brightness-of-rgb-color
      float howBright = brightness(davey.pixels[pixLoc]);
      
      //map - remaps a number from one range to another (takes care of scaling math)
      //  mouseX normally ranges from 0 to width
      //  now we want it to be a number from 0 to 255
      float theThreshold = map(mouseX, 0, width, 0, 255); 
      
      if (howBright > theThreshold) {
        newR = 255;
        newG = 255;
        newB = 255;
      } else {
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