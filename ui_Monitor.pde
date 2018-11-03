class Monitor {
  void reset() {
    for (int i = 0; i < ui_currentFrame.length; i++) {
      Arrays.fill(ui_currentFrame[i], false);
    }
  }

  void  createPixels() {                                // UI - Pixel Grid - The empty pixel grid
    for (int i = 0; i < ui_pixelMonitor_rows; i++) {
      for (int j = 0; j < ui_pixelMonitor_cols; j++) {
        ui_pixelMonitor[j][i].drawPixel(0, 10);
      }
    }
  }
}

class Pixel {               // A  pixel object knows about its location in the grid as well as its size with the variables x, y, w, h.
  float x, y;               // x,y location
  float w, h;               // width and height
  int oP;                   // the opactiy value of the pixel (255 being fully visible)
  int oS;                   // the opacity value of the stroke

  // Pixel Constructor
  Pixel(float tempX, float tempY, float tempW, float tempH, int opacPixel, int opacStroke) {
    x = ui_monitorOffset[0]+tempX;
    y = ui_monitorOffset[1]+tempY;
    w = tempW;
    h = tempH;
    oP = opacPixel;
    oS = opacStroke;
  }

  void drawPixel(int oP, int oS) {
    fill(0, 0, 0, oP);
    stroke(0, 0, 0, oS);
    rect(x, y, w, h);
  }
}
