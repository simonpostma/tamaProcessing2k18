// ==== Debug stuff ====

void printDebug() {
  if (conf_debugOutput == true) {
    println("#============================#   " + "#=====================================#"  );
    println("# Debug Output               #   " + "# Controls                            #"  );
    println("#============================#   " + "#=====================================#"  );    
    println("  Alive                " + tama_statAlive + "        LEFTARROW    Navigate menu left." );
    println("  Hunger               " + tama_statHunger + "       RIGHTARROW   Navigate menu right." );
    println("  Tired                " + tama_statFatigue + "       DOWNARROW    Select menu option."  );    
    println("  Illness              " + tama_statIllness + "       UPARROW      Kill / Respawn Tama." );
    println("  Tantrum              " + tama_statTantrum );
    println("  Menu Index   " + ui_menuIndex + "           To make tama sleep, use light.");    
    println("  Current animation    " + "none" + "           To give tama drink, use bathroom.");
    println("  Lights               " + env_lightSwitch );
  }

  if (conf_debugOutput == false) {
    println("#=====================================#");
    println("# Controls                            #");
    println("#=====================================#");    
    println("  LEFTARROW:   Navigate menu left.");
    println("  RIGHTARROW:  Navigate menu right.");
    println("  DOWNARROW:   Select menu option.");
    println("  UPARROW:     Kill / Respawn Tama.");   
    println(""); 
    println(""); 
    println("  To give tama drink, use bathroom.");    
    println("  To make tama sleep, use light.");
  }
}
