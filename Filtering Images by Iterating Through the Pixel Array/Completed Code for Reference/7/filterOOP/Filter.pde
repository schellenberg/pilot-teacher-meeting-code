class Filter {
  //class data
  PImage img, filtImg;

  //constructor
  Filter(String theImageFile) {
    img = loadImage(theImageFile);
    img.resize(width, 0);  //scale as required
    filtImg = createImage(img.width, img.height, RGB);
  }

  //class methods
  void displayOriginal(float x, float y) {
    image(img, x, y);
  }

  void displayFiltered(float x, float y) {
    applyFilter();
    image(filtImg, x, y);
  }

  void applyFilter() {
    img.loadPixels();
    filtImg.loadPixels();

    for (int x = 0; x < img.width; x++) {
      for (int y = 0; y < img.height; y++) {
        //accessing every pixels by y*width+x
        int pixLoc = y * img.width + x;

        float r = red(img.pixels[pixLoc]);
        float g = green(img.pixels[pixLoc]);
        float b = blue(img.pixels[pixLoc]);

        float newR;
        float newG;
        float newB;

        //image processing ("filters" go here
        float mouseDist = dist(x, y, mouseX, mouseY);
        if (mouseDist < 100) {
          newR = r;
          newG = g;
          newB = b;
        } else {
          newR = 0;
          newG = 0;
          newB = 0;
        }
        
        //update pixels
        filtImg.pixels[pixLoc] = color(newR, newG, newB);
      }
    }

    filtImg.updatePixels();
  }
}