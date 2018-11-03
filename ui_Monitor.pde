class Monitor {

  void reset() {
    for (int i = 0; i < ui_currentFrame.length; i++) {
      Arrays.fill(ui_currentFrame[i], false);
    }
  }

  void  createPixels() {                                // UI - Pixel Grid - The empty pixel grid
    for (int i = 0; i < ui_pixelMonitor_cols; i++) {
      for (int j = 0; j < ui_pixelMonitor_rows; j++) {
        ui_pixelMonitor[i][j].drawPixel(0, 10);
      }
    }
  }

  void display(boolean[][] frame) {                  // UI - Pixel Grid - all colored pixels. To change which pixels are being drawn by this function, manipulate the array ui_currentFrame[][]
    int oP;                                                 // opacity Pixel
    int oS = ui_strokeOpac;                                 // opacity Stroke
    for (int i = 0; i < ui_pixelMonitor_cols; i++) {        // for every column
      for (int j = 0; j < ui_pixelMonitor_rows; j++) {      // and every row
        if (frame[j][i] == true) {                          // for every boolean in the 32x16 array that is true
          oP = ui_pixelOpac;                                // set the opacity
        } else {
          oP = 0;                                           // else set fully transperant
        }
        ui_pixelMonitor[i][j].drawPixel(oP, oS);            // and then do the actual drawing of the pixel
      }
    }
  }

  // Animation shouldn't take place in the Monitor class but within the objects themselves (wave, tama, turd, etc)
  void animator(int[][][] anim) {                // start the monitor with the array 'anim' as input. in this array are all frame arrays, with in them coordinate arrays, with in them the Y and X coordinates of the pixels that are to be drawn.
    int cordX;
    int cordY;
    int offsetY = 6;
    ui_animLength = anim.length; 
    for (int i = 0; i < ui_animLength; i++) {    // for the amount of frames (Arrays with coordinates) that is inside the animation (array with frames)
      int[][] frame = anim[ui_frameTracker];     // fill the frame array with the content of the selected frame from the animation array
      for (int j = 0; j < frame.length; j++) {   // for each of the pixels to be drawn inside the frame                                  FROM HERE AND ON should be moved to another function
        int[] cordData = frame[j];               // fill cordData array with the 2 values that are contained inside the pixel coordinate array
        cordY = cordData[0] + offsetY;           // add the required vertical offset to let Tama put his feet on the ground
        cordX = cordData[1] + offsetX;           
        ui_currentFrame[cordY][cordX] = true;
      }
      //int[] cordData = frame[j];               // The content of the cordData array (the pixels of the current animation frame that are to be drawn serves as input for ui_monitorMovementProcessor to manipulate the location (Y axis) on the screen  
      println(offsetX);
    }
  }

  void ui_frameTracker(int[][][] anim) {
    if (ui_frameTracker < anim.length -1) {      // As long as the frame tracker hasnt reached the end of the animation
      ++ui_frameTracker;
    }                                            // plop to the next frame
    else {
      ui_frameTracker = 0;                       //*Reset the frame tracker
    }
  }
}

//void ui_monitorMovementProcessor(int [][] movableObject) {
//}

//void func_movementManager() {
//}

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
