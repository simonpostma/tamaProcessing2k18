void ui_drawAlarm() {              // Function that shows if Tama needs something
  imageMode(CENTER);               // Image fiddly stuff
  img_menuIcon08.resize(50, 35);
  tint(0, 0, 0, 55);
  image(img_menuIcon08, 460, 560);  // Draw the 'I need something' symbol
}

void ui_drawMenu() {
}

void ui_moveTest() {
}
