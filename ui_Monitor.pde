void ui_monitorManager() {

  // Alle afb. arrays bij elkaar in 1 array (currentFrame) met alle pixels
  ui_monitorReset();  // monitor leeg maken
  //ui_testDraw();   
  ui_monitorAnimator(ui_shBabytchi_idleRight);  // om de frames van de objecten te loopen (voornamelijk tama)
  //ui_monitorMovementProcessor();  // om de positie op het scherm van bijv. Tama te bepalen voor beweging. op dit moment word de bewegingsvrijheid bepaald
  //ui_monitorAgregator(); // om alle visuals bij elkaar te brengen nadat de posities van de pixels bereknd zijn. Op dit moment worden de pixels van alle te drawen objecten in ui_currentFrame gezet
  //ui_plotCharacter();
  // ui_testAnim();
  // alle true pixels drawen in de grid
  ui_monitorDraw(ui_currentFrame);        //om alles wat er in ui_monitorAgregator(); bij elkaar is verzameld te drawen
}

void ui_monitorReset() {
  for (int i = 0; i < ui_currentFrame.length; i++) {
    Arrays.fill(ui_currentFrame[i], false);
  }
}

void ui_frameTracker(int[][][] anim) {
  if (ui_frameTracker < anim.length -1) {         // As long as the frame tracker hasnt reached the end of the animation
    ++ui_frameTracker;
  }                         // plop to the next frame
  else {
    ui_frameTracker = 0;                       //*Reset the frame tracker
  }
}

void ui_monitorAnimator(int[][][] anim) {      // start de Monitor Animator met de array 'anim' als input. In deze array zitten alle frame arrays, met daarin de coordinaten arrays, met daarin de X en Y waarden van de te tekenen pixels
  int cordX;
  int cordY;
  int offsetY = 6;
  ui_animLength = anim.length; 
  for (int i = 0; i < ui_animLength; i++) {    // Voor het aantal frames(arrays met coordinaten) dat er in de animatie(array met frames) zit
    int[][] frame = anim[ui_frameTracker];     // vul de frame array met de inhoud van de frame uit de animatie array
    for (int j = 0; j < frame.length; j++) {   // voor elk van het aantal pixels in de frame                                      moet straks verplaatst naar andere functie
      int[] cordData = frame[j];               // cordData array vullen met de 2 waardes van het pixel coordinaat
      cordY = cordData[0] + offsetY;           // verticale offset om tama naar de grond te duwen
      cordX = cordData[1] + offsetX;
      ui_currentFrame[cordY][cordX] = true;
    }
    //int[] cordData = frame[j];              // de inhoud van de cordData array (de te tekenen pixels van het huidige animatie frame) dient als input voor ui_monitorMovementProcessor om de lokatie op het scherm (Y as) te manipuleren
    println(offsetX);
  }
}

void ui_monitorMovementProcessor(int [][] movableObject) {
}

void func_movementManager() {
}


//void ui_plotCharacter() {
//  // Used for tracking which frame of the animation is being shown
//  if (core_millisHalfSecSignal == true) {
//    ++ui_frameTracker;
//    return;
//  }   
//  if (ui_frameTracker == 0) {
//    for (int i = 0; i < frameA.length; i++) {
//      int[] cordData = frameA[i];
//      int cordX = cordData[0];
//      int cordY = cordData[1];
//      ui_currentFrame[cordX][cordY] = true;
//      ui_frameTracker = 1;
//    }
//    return;
//  }
//  if (ui_frameTracker == 1) {
//    ui_currentFrame = ui_emptyFrame;
//    for (int i = 0; i < frameB.length; i++) {
//      int[] cordData = frameB[i];
//      int cordX = cordData[0];
//      int cordY = cordData[1];
//      ui_currentFrame[cordX][cordY] = true;
//      ui_frameTracker = 0;
//    }
//    return;
//  }
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

void  ui_createPixels() {                                // UI - Pixel Grid - The empty pixel grid
  for (int i = 0; i < ui_pixelMonitor_cols; i++) {
    for (int j = 0; j < ui_pixelMonitor_rows; j++) {
      ui_pixelMonitor[i][j].drawPixel(0, 10);
    }
  }
}

void ui_monitorDraw(boolean[][] frame) {                                   // UI - Pixel Grid - all colored pixels. To change which pixels are being drawn by this function, manipulate the array ui_currentFrame[][]
  int oP;                                                 // opacity Pixel
  int oS = ui_strokeOpac;                                             // opacity Stroke
  for (int i = 0; i < ui_pixelMonitor_cols; i++) {        // for every column
    for (int j = 0; j < ui_pixelMonitor_rows; j++) {      // and every row
      if (frame[j][i] == true) {                // for every boolean in the 32x16 array that is true
        oP = ui_pixelOpac;                                // set the opacity
      } else {
        oP = 0;                                           // else set fully transperant
      }
      ui_pixelMonitor[i][j].drawPixel(oP, oS);            // and then do the actual drawing of the pixel
    }
  }
}
