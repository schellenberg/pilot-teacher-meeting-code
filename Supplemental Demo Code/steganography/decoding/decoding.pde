/////////////////////////////////////////////////////////////////////////////////////////
// Decoding a simple steganography image
// Dan Schellenberg
// Jan 2, 2016
//
// Image must have been created using the companion program (called encoding)
// Red background is shown while program is working to decode the message.
// Message is saved in the file 'theMessage.txt', in the same directory as this program.
//
/////////////////////////////////////////////////////////////////////////////////////////

color bgColor;

void setup() {
  size(300, 300);
  bgColor = color(255, 255, 255);
}

void draw() {
  //display the simple instructions
  background(bgColor);
  fill(0);
  textAlign(CENTER);
  text("d - select image file to decode", width/2, height/2);
}

void keyPressed() {
  if (key == 'd') {
    selectInput("Select an image file to extract message from:", "decodeFile");
  }
}

/////////////////////////////////////////////////////////////////////////////////////////

void decodeFile(File selection) {
  //if user chooses a file, attempt to decode it
  //assumption is that an appropriate image file is selected
  // if not, garbage output will occur

  if (selection == null) {
    println();
    println("Window was closed or the user hit cancel.");
    println();
  } else {
    println("User selected " + selection.getAbsolutePath());
    println();

    //initialize image and message
    PImage source;
    String retrievedMessage;

    //set red background, then do the decoding of the file
    bgColor = color(255, 0, 0);
    source = loadImage( selection.getAbsolutePath() );
    retrievedMessage = extractedMessage(source);
    saveMessage(retrievedMessage);
    println(retrievedMessage);
    bgColor = color(255, 255, 255);
  }
}

/////////////////////////////////////////////////////////////////////////////////////////


void saveMessage(String theMessage) {
  //save file in same directory as this program
  String[] list = split(theMessage, '\n');
  saveStrings("theMessage.txt", list);
}

/////////////////////////////////////////////////////////////////////////////////////////

String extractedMessage(PImage source) {
  //initialize
  String encodedMessage = "";
  String decodedMessage = "";

  //need to loadPixels, as the message is hidden in the red component of each pixel
  source.loadPixels();
  //keep track of the number of zeros in a row -- if it's a bunch, the message is done
  int zerosInARow = 0;

  //get binary representation first
  for (int i = 0; i < source.pixels.length; i++) {
    float thisAmount = red(source.pixels[i]);
    if (thisAmount % 2 == 0) {  //if red amount is an even number, this bit represents off (0)
      encodedMessage = encodedMessage + '0';
      
      //if message is over, get out of this loop to speed things up if there is a short message in a big image
      zerosInARow = zerosInARow + 1;
      if (zerosInARow > 16) {
        break;
      }
      
    } else {  //if red amount is an odd number, this bit represents on (1)
      encodedMessage = encodedMessage + '1';
      zerosInARow = 0;
    }
  }

  ////convert from binary representation to regular string
  boolean stillDecoding = true;

  int i = 0;
  while (stillDecoding) {
    //message was encoded in 8-bit chunks, so we want to look at 8 bits at a time
    // and convert each bit into a number, then into the character that number respresents -- ASCII or Unicode
    if ( (i + 8) < encodedMessage.length()) { //stay in bounds
      String currentChar = encodedMessage.substring(i, i+8);
      decodedMessage = decodedMessage + char(unbinary(currentChar));  //add the char of these 8 bits to the message
    } else { //exit loop if next 8-bits would be out of bounds
      break; 
    }
    i = i + 8;
  } 

  return decodedMessage;
}

/////////////////////////////////////////////////////////////////////////////////////////