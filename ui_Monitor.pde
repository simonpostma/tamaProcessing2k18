class Pixel {               // A  pixel object knows about its location in the grid as well as its size with the variables x, y, w, h.
  float x, y;               // x,y location
  float w, h;               // width and height
  int visible;              // is it turned on or off

  // Pixel Constructor
  Pixel(float tempX, float tempY, float tempW, float tempH) {
    x = ui_monitorOffset[0]+tempX;
    y = ui_monitorOffset[1]+tempY;
    w = tempW;
    h = tempH;
  }

  void drawPixel(int visible) {
    fill(0, 0, 0, visible);
    stroke(0, 0, 0, 10);
    rect(x, y, w, h);
  }
}
