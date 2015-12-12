//Pilot Teachers Meeting Demo
//External Libraries/parsing external data
//Example of loading XML info, parsing it, and displaying images
//Dan Schellenberg
//Dec 10, 2015

//create a variable to hold the data pulled from the web news feed
XML news;

//create an array to hold all of the images referenced in the news feed
ArrayList<PImage> thePhotos = new ArrayList<PImage>();

void setup() {
  size(800, 750);
  background(0);

  //grab the news feed from the web -- open the URL in your browser to see the structure
  news = loadXML("http://www.cbc.ca/cmlink/rss-canada-saskatoon");

  //select every "item" in the feed, and parse it into an array
  XML[] items = news.getChild("channel").getChildren("item");

  //do this for each item that appears
  for (int i=0; i<items.length; i++) {
    //grab the contents of the description tag
    String theStory = items[i].getChild("description").getContent();
    //use regular expressions to pull out just the information contained inside the src=' ' links
    //  - these will always be links to images
    //  - to understand what I'm doing here, you'll need to do a bit of Googling on regular expressions. Not required.
    String[] m = match(theStory, "src='(.*?)'");

    //print out, to diagnose my errors while testing...
    //println(m[1]);

    //get the url, and remove whitespace from the front and end via the trim function
    //note that from the match ref page: the first group is [1], the second [2], and so on
    //https://processing.org/reference/match_.html
    String photoURL = trim(m[1]);

    //add the photo to the arrayList
    //use requestImage instead of loadImage to run this in a separate thread
    thePhotos.add(requestImage(photoURL));
  }
}

void draw() {
  //variables used if tiling the images
  int xLoc = 30;
  int yLoc = 30;
  float photoScalar = 0.5;
  
  //display each image, scale it down a bit, and keep them mostly in the screen
  for (PImage photo : thePhotos) {
    if (photo.width > 0) { //image loaded without problems
      //randomized locations
      //image(photo, random(width-photo.width*photoScalar), random(height-photo.height*photoScalar), photo.width*photoScalar, photo.height*photoScalar);

      //tile the images
      image(photo, xLoc, yLoc, photo.width*photoScalar, photo.height*photoScalar);
      xLoc += photo.width*photoScalar + 20;
      if (xLoc + photo.width*photoScalar >= width) {
        xLoc = 30;
        yLoc += photo.height*photoScalar + 10;
      }
    }
  }
}