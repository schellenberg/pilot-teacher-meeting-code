class RectLineOfSight {
  int DONT_INTERSECT, COLLINEAR, DO_INTERSECT;
  float x, y;
  int intersected;
  float rx1, ry1, rx2, ry2, rx3, ry3, rx4, ry4;
  float lx1, ly1, lx2, ly2;

  RectLineOfSight() {
    DONT_INTERSECT = 0;
    COLLINEAR = 1;
    DO_INTERSECT = 2;
    x = 0; 
    y = 0;
  }
  
  void setTargetLocation(float x, float y) {
    lx1 = x;
    ly1 = y;
  }
  
  void setEnemyLocation(float x, float y) {
    lx2 = x;
    ly2 = y;
  }
  
  void setRect(float rectX, float rectY, float rectW, float rectH, String theMode) {
    if (theMode == "CENTER") {
      rx1 = rectX - rectW/2;
      rx2 = rectX + rectW/2;
      rx3 = rectX - rectW/2;
      rx4 = rectX + rectW/2;
      
      ry1 = rectY - rectH/2;
      ry2 = rectY - rectH/2; 
      ry3 = rectY + rectH/2;
      ry4 = rectY + rectH/2;
    }
    else if (theMode == "CORNER") {
      rx1 = rectX;
      ry1 = rectY;
      rx2 = rectX + rectW;
      ry2 = rectY;
      rx3 = rectX;
      ry3 = rectY + rectH;
      rx4 = rectX + rectW;
      ry4 = rectY + rectH;
    }
    else if (theMode == "CORNERS") {
      rx1 = rectX;
      ry1 = rectY;
      rx2 = rectW;
      ry2 = rectY;
      rx3 = rectX;
      ry3 = rectH;
      rx4 = rectW;
      ry4 = rectH; 
    }
  }

  void drawRect() {
    rectMode(CORNERS);
    rect(rx1,ry1,rx4,ry4);
  }

  int doLinesIntersect(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {

    float a1, a2, b1, b2, c1, c2;
    float r1, r2, r3, r4;
    float denom, offset, num;

    // Compute a1, b1, c1, where line joining points 1 and 2
    // is "a1 x + b1 y + c1 = 0".
    a1 = y2 - y1;
    b1 = x1 - x2;
    c1 = (x2 * y1) - (x1 * y2);

    // Compute r3 and r4.
    r3 = ((a1 * x3) + (b1 * y3) + c1);
    r4 = ((a1 * x4) + (b1 * y4) + c1);

    // Check signs of r3 and r4. If both point 3 and point 4 lie on
    // same side of line 1, the line segments do not intersect.
    if ((r3 != 0) && (r4 != 0) && same_sign(r3, r4)) {
      return DONT_INTERSECT;
    }

    // Compute a2, b2, c2
    a2 = y4 - y3;
    b2 = x3 - x4;
    c2 = (x4 * y3) - (x3 * y4);

    // Compute r1 and r2
    r1 = (a2 * x1) + (b2 * y1) + c2;
    r2 = (a2 * x2) + (b2 * y2) + c2;

    // Check signs of r1 and r2. If both point 1 and point 2 lie
    // on same side of second line segment, the line segments do
    // not intersect.
    if ((r1 != 0) && (r2 != 0) && (same_sign(r1, r2))) {
      return DONT_INTERSECT;
    }

    //Line segments intersect: compute intersection point.
    denom = (a1 * b2) - (a2 * b1);

    if (denom == 0) {
      return COLLINEAR;
    }

    if (denom < 0) { 
      offset = -denom / 2;
    } else {
      offset = denom / 2 ;
    }

    // The denom/2 is to get rounding instead of truncating. It
    // is added or subtracted to the numerator, depending upon the
    // sign of the numerator.
    num = (b1 * c2) - (b2 * c1);
    if (num < 0) {
      x = (num - offset) / denom;
    } else {
      x = (num + offset) / denom;
    }

    num = (a2 * c1) - (a1 * c2);
    if (num < 0) {
      y = ( num - offset) / denom;
    } else {
      y = (num + offset) / denom;
    }

    // lines_intersect
    return DO_INTERSECT;
  }

  boolean same_sign(float a, float b) {
    return (( a * b) >= 0);
  }
  
  boolean hasLineOfSight() {
    if ( doLinesIntersect(lx1,ly1,lx2,ly2, rx1,ry1,rx2,ry2) == DO_INTERSECT  ||
         doLinesIntersect(lx1,ly1,lx2,ly2, rx1,ry1,rx3,ry3) == DO_INTERSECT  ||
         doLinesIntersect(lx1,ly1,lx2,ly2, rx2,ry2,rx4,ry4) == DO_INTERSECT  ||
         doLinesIntersect(lx1,ly1,lx2,ly2, rx3,ry3,rx4,ry4) == DO_INTERSECT
    ) {
      return false;
    }
    else {
      return true;
    }
  }
  
}