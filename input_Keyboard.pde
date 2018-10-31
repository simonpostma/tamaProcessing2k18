// ===== This stuff deals with buttons being pressed and their effects ====

void keyPressed() {
  if (keyCode == LEFT) {
    keyPressedExtra();
  }
  if (keyCode == DOWN) {
    keyPressedExtra();
    if (ui_menuIndex == 1) {}                         // What happens when using the food menu
       if (ui_menuIndex == 2) {}                      // The lightbulb menu
       if (ui_menuIndex == 3) {}                      // The play/game menu
       if (ui_menuIndex == 4) {}                      // The medication menu
       if (ui_menuIndex == 5) {}                      // The bath menu
       if (ui_menuIndex == 6) {}                      // The stats menu
       else if (ui_menuIndex == 7) {}
  }
  if (keyCode == RIGHT) {
    keyPressedExtra();
  }
  if (keyCode == UP) {
    keyPressedExtra();
  }
};

void keyPressedExtra() { 
  sfx_Beep.trigger();
}
