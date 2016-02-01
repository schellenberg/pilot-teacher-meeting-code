class Level {

  Tile[][] tiles;
  PImage levelBackground;
  int tilesHigh, tilesWide;


  Level(String fileToLoad, String theBackground) {
    //load background
    levelBackground = loadImage(theBackground);


    //load level data
    String lines[] = loadStrings(fileToLoad);

    tilesHigh = lines.length;
    tilesWide = lines[0].length();

    float tileWidth = width/tilesWide;
    float tileHeight = height/tilesHigh;

    //println(tilesHigh, tilesWide);

    tiles = new Tile[tilesWide][tilesHigh];

    for (int y = 0; y < tilesHigh; y++) {
      for (int x = 0; x < tilesWide; x++) {
        char tileType = lines[y].charAt(x);
        tiles[x][y] = new Tile(x*tileWidth, y*tileHeight, tileWidth, tileHeight, tileType);
      }
    }
  }

  void display() {
    image(levelBackground, 0, 0, width, height);

    for (int y = 0; y < tilesHigh; y++) {
      for (int x = 0; x < tilesWide; x++) {
        tiles[x][y].display();
      }
    }
  }
}