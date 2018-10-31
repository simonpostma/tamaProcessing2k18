void ui_drawAlarm() {              // Function that shows if Tama needs something
  imageMode(CENTER);               // Image fiddly stuff
  img_menuIcon08.resize(50, 35);
  //  if () {
  tint(0, 0, 0, 55);
  //  } else {
  //    tint(0, 0, 0, 255);
  //  }
  image(img_menuIcon08, 460, 560);  // Draw the 'I need something' symbol
}

void ui_screenRefresh() {
  for (int i = 0; i < ui_pixelMonitor_cols; i++) {
    for (int j = 0; j < ui_pixelMonitor_rows; j++) {
      currentFrame[j][i] = false;
    }
  }
}

void ui_drawMenu() {
}

void ui_drawTest() {
  if (!ui_drawTestToggle) {
    currentFrame[1][1] = false;   
   // ui_screenRefresh();
  } else if (ui_drawTestToggle) {    
    currentFrame[1][1] = true;
  }
}

void ui_moveTest() {
}
