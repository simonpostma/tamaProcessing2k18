class tama_Char {               // A  Tamagotchi object knows about its location in the grid as well as its size with the variables x, y, w, h.
  int char_meta_Name;           // The name of the current character
  int char_meta_posX;           // The X position of tama on the monitor
  int char_meta_poxY;           // The Y position of tama on the monitor
  int char_meta_offsetY;        // The Y axis offset in pixels for the particular character

  int char_atr_Hunger;          // The "Atributes" are used by the game calculators to determine how and when to progress tama's needs. This allows for unique behaviors for different characters
  int char_atr_Illness;    
  int char_atr_Happiness;
  int char_atr_Discipline;
  int char_atr_Defecating;

  int char_resp_Eat;            // The "factors" are used to determine how tama and his needs respond to specific player actions. This allows for unique behaviors for different characters
  int char_resp_Snack;
  int char_resp_Medicate;
  int char_resp_Discipline;
  int char_resp_Win;
  int char_resp_Lose;
  int char_resp_XpGood;
  int char_resp_XpBad;

  int char_event_Wake;           // The regular waking and sleeping times of this character
  int char_event_Sleep;

  int char_anim_Idle;            // The animations of this character
  int char_anim_Cheer;
  int char_anim_Boo;
  int char_anim_Eat;
  int char_anim_Sleep;
  int char_anim_Poop;
  int char_anim_Illness;
  int char_anim_Play;

  tama_Char() {       // constructor
  }

  void frameTracker(int[][][] anim) {
    // Updating the frame tracker
    if (ui_frameTracker < anim.length -1) {      // As long as the frame tracker hasnt reached the end of the animation
      ++ui_frameTracker;
    }                                            // plop to the next frame
    else {
      ui_frameTracker = 0;                       //*Reset the frame tracker
    }
  }
  void animate(int[][][] animForth,int[][][] animBack ) {                 // to CYCLE ANIMATION FRAMES and CALCULATE X and Y position EVERY HALF SECOND
    int cordY = 0;
    int cordX = 0;
    int offsetX = 3;
    int charWidth = 9;                           // how many pixels is the character wide
    int animLength = 0;
    
    if (ui_direction == true) {
    animLength  = animForth.length;
    anim = animForth;
    }
    
    if (ui_direction == false) {
    animLength  = animBack.length;
    anim = animBack;
    }

    // Cycling through the animation
    for (int i = 0; i < animLength; i++) {    // for the amount of frames (Arrays with coordinates) that is inside the animation (array with frames)
      animFrame = anim[ui_frameTracker];           // fill the frame array with the content (amount of frames) of the selected frame from the animation array
    }


    for (int j = 0; j < animFrame.length; j++) {   // for each of the pixels to be drawn inside the frame
      int[] cordData = animFrame[j];               // fill cordData array with the 2 values that are contained inside the pixel coordinate array

      // Applying the character specific Y offset to get Tama's feet on the ground
      cordY = cordData[0] + ui_offsetY;
      cordX = cordData[1] + posX;

      println("posX = " + posX);
      println("dir = " + ui_direction);
      // Now the coords are calculated, send each pixel to the current frame.
      ui_currentFrame[cordY][cordX] = true;
    }
    if (ui_direction == true) {
      ++posX;++posX;
      if (posX > 32-charWidth-offsetX)
      {
        ui_direction = false;
      }
    } 
    if (ui_direction == false) {
      --posX;--posX;
      if (posX < offsetX) 
      {
        ui_direction = true;
      }
    }
    println("fl  "+anim.length);
  }
}

void display(boolean[][] Cframe) {                 // to DRAW the CALCULATED PIXELS every CYCLE // with this you can do stuff like "tama.display"          // UI - Pixel Grid - all colored pixels. To change which pixels are being drawn by this function, manipulate the array ui_currentFrame[][]
  int oP;                                                 // opacity Pixel
  int oS = ui_strokeOpac;                                 // opacity Stroke
  for (int i = 0; i < ui_pixelMonitor_rows; i++) {        // for every column
    for (int j = 0; j < ui_pixelMonitor_cols; j++) {      // and every row
      if (Cframe[i][j] == true) {                          // for every boolean in the 32x16 array that is true
        oP = ui_pixelOpac;                                // set the opacity
      } else {
        oP = 0;                                           // else set fully transperant
      }
      ui_pixelMonitor[j][i].drawPixel(oP, oS);            // and then do the actual drawing of the pixel
    }
  }
}
