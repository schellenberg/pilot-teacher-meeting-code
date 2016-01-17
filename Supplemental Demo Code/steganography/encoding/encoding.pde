/////////////////////////////////////////////////////////////////////////////////////////
// Encoding a simple steganography image
// Dan Schellenberg
// Jan 2, 2016
//
// User must first select a .txt file that contains the secret message, then 
// select an image file to insert the secret message into.
// Image containing the secret message is saved in 
// the file 'nothingToSeeHere.png', in the same directory as this program.
// 
// The basic algorithm used here is as follows:
// - set all red component values of pixels to even numbers, by subtracting by 1 if neccesary
// - convert the message to be hidden into binary
// - loop through the pixels of the image, continuing until message bits have been applied, by:
//    - leaving red component as is (if the bit is a 0)
//    - adding 1 to the red component (if the bit is a 1)
//
/////////////////////////////////////////////////////////////////////////////////////////


PImage source, encoded;
String secretMessage, encodedMessage;
color bgColor;

void setup() {
  size(300, 300);
  secretMessage = "";
  bgColor = color(255, 255, 255);
}

void draw() {
  //display the simple instructions
  background(bgColor);
  fill(0);
  textAlign(CENTER);
  text("t - select txt file of secret message\ne - encode and save into selected image", width/2, height/2);
}

void keyPressed() {
  if (key == 't') {
    selectInput("Select a file to process:", "selectMessage");
  }
  if (key == 'e') {
    selectInput("Select a file to process:", "selectImage");
  }
}

/////////////////////////////////////////////////////////////////////////////////////////

void selectMessage(File selection) {
  //choose a .txt file that contains the secret message
  //if a non .txt file is chosen, garbage output will occur

  if (selection == null) {
    println();
    println("Window was closed or the user hit cancel.");
    println();
  } else {

    //set background to red while loading the text file 
    bgColor = color(255, 0, 0);
    println("Secret message chosen: " + selection.getAbsolutePath());
    println();

    //open the file and concatenate each line onto the string
    String theText = "";
    String lines[] = loadStrings( selection.getAbsolutePath() );
    for (int i = 0; i < lines.length; i++) {
      theText = theText + lines[i] + "\n";
    }

    //set the global variable secret message to the loaded message, and convert it to binary
    secretMessage = theText;
    encodedMessage = encodeMessageToBinary(secretMessage);

    //return background color to white
    bgColor = color(255, 255, 255);
  }
}

/////////////////////////////////////////////////////////////////////////////////////////

void selectImage(File selection) {
  //choose an image file that the secret message should be inserted into
  //if a non image file is chosen, craziness will ensue

  if (selection == null) {
    println();
    println("Window was closed or the user hit cancel.");
    println();
  } else {

    //set background to red while inserting the message into the image 
    bgColor = color(255, 0, 0);
    println("Image to hide message in: " + selection.getAbsolutePath());
    println();


    source = loadImage(selection.getAbsolutePath());
    
    //before attempting to insert message, confirm that it will actually fit
    if (messageFits(source, encodedMessage)) {
      //insert message, and save result as a file in the same directory as this program
      encoded = initalizedImage(source);
      encoded = attachMessageToImage(encoded, encodedMessage);
      encoded.save("nothingToSeeHere.png");

      println("Message successfully inserted into image.");
      println("The image has been saved in the same directory as this program.");
      println();
    } else {
      println("Message does not fit inside image. Need to use a larger image to fit that size of message");
    }

    //reset the background to white when done
    bgColor = color(255, 255, 255);
  }
}

/////////////////////////////////////////////////////////////////////////////////////////

PImage initalizedImage(PImage source) {
  //take in the source image and remove the least important bit from the red color component
  //return version of image where all red color components are even numbers (subtracted by 1 if req'd)
  
  PImage dest = createImage(source.width, source.height, RGB);
  source.loadPixels();
  dest.loadPixels();

  for (int i = 0; i < source.pixels.length; i++) {
    dest.pixels[i] = initializeLastBit(source.pixels[i]);
  }

  dest.updatePixels();
  return dest;
}

/////////////////////////////////////////////////////////////////////////////////////////

color initializeLastBit(color thisColor) {
  //reset last bit to 0 for the red color component
  //algorithm could be adjusted to utilize all 3 color components, which would allow for
  //much more message storage space in the same source file
  
  float red = red(thisColor);
  float green = green(thisColor);
  float blue = blue(thisColor);

  if (red % 2 != 0) { //if it's odd, the last bit is on. Turn off by subtracting 1.
    red = red - 1;
  }

  color lastBitRemoved = color(red, green, blue);
  return lastBitRemoved;
}

/////////////////////////////////////////////////////////////////////////////////////////

boolean messageFits(PImage source, String message) {
  //check if the currently selected message will fit into the currently selected image
  //message is a string of bits, and we'll store one per pixel
  
  if (message.length()*8 < (source.width * source.height) ) {
    return true;
  } else {
    return false;
  }
}

/////////////////////////////////////////////////////////////////////////////////////////

String encodeMessageToBinary(String secretMessage) {
  //convert message into it's binary representation
  
  String encodedMessage = "";

  for (int i=0; i<secretMessage.length(); i++) {
    char thisChar = secretMessage.charAt(i);
    encodedMessage = encodedMessage + binary(thisChar, 8);  //use 8 bits for every character (ASCII-like)
  }

  return encodedMessage;
}

/////////////////////////////////////////////////////////////////////////////////////////

PImage attachMessageToImage(PImage source, String message) {
  //create a new image, and hide the message in the red color component values of the new image
  //assumes the source image has already been "cleaned up" (all red color component values set to even numbers)

  //start the destination image as an exact copy of the "cleaned up" source
  PImage dest = createImage(source.width, source.height, RGB);
  dest.copy(source, 0, 0, source.width, source.height, 0, 0, source.width, source.height);

  source.loadPixels();
  dest.loadPixels();

  //go through the message one character at a time (mapping this loop to a pixel loop), 
  //adding one to the current pixel's red component value if the binary value is a 1
  
  for (int i = 0; i < message.length(); i++ ) {
    if (message.charAt(i) == '1') {
      float redAmount = red(source.pixels[i]) + 1;
      float greenAmount = green(source.pixels[i]);
      float blueAmount = blue(source.pixels[i]);

      dest.pixels[i] = color(redAmount, greenAmount, blueAmount);
    }
  }

  dest.updatePixels();
  return dest;
}

/////////////////////////////////////////////////////////////////////////////////////////