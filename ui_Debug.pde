// ==== Debug stuff ====
void debug_Operations() {
  //debug_testAnim();
  //debug_testDraw();
  //debug_printConsole();                                           // Output stuff to console
}

void debug_testAnim() {
}

void debug_testDraw() {
  if (core_millisHalfSecSignal == true) {
    ui_drawTestToggle = !ui_drawTestToggle;
    return;
  }
  if (ui_drawTestToggle == true) {
    ui_currentFrame[1][1] = false;
  } else if (ui_drawTestToggle == false) {    
    ui_currentFrame[1][1] = true;
  }
}

void debug_printConsole() {
  if (conf_debugOutput == true) {
    println("#============================#   " + "#=====================================#"  );
    println("# Debug Output               #   " + "# Controls                            #"  );
    println("#============================#   " + "#=====================================#"  );    
    println("  Alive                " + tama_statAlive + "       LEFTARROW    Navigate menu left." );
    println("  Hunger               " + tama_statHunger + "           RIGHTARROW   Navigate menu right." );
    println("  Tired                " + tama_statFatigue + "           DOWNARROW    Select menu option."  );    
    println("  Illness              " + tama_statIllness );
    println("  Tantrum              " + tama_statTantrum );
    println("  Menu Index           " + ui_menuIndex );    
    println("  Current animation    " + "none" );
    println("  Lights               " + env_lightSwitch );
    println("  Millis:              " + core_Millis + " | " + core_millisStart + " | " + core_previousMillisHalfSec + " | " + core_previousMillisSec + " | " + core_previousMillisMin);
    println("  Time:                " + core_runtimeHalfSec + " half seconds passed" + " | " + core_runtimeSec + " second passed" + " | " + core_runtimeMin + " minutes passed" + " |");

  }

  if (conf_debugOutput == false) {
    println("#=====================================#");
    println("# Controls                            #");
    println("#=====================================#");    
    println("  LEFTARROW:   Navigate menu left.");
    println("  RIGHTARROW:  Navigate menu right.");
    println("  DOWNARROW:   Select menu option.");
    println("  UPARROW:     Kill / Respawn Tama.");
  }
}
