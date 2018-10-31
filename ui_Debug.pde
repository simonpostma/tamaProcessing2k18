// ==== Debug stuff ====

void printDebug() {
  if (conf_debugOutput == true) {
    println("#============================#   " + "#=====================================#"  );
    println("# Debug Output               #   " + "# Controls                            #"  );
    println("#============================#   " + "#=====================================#"  );    
    println("  Alive                " +   "        LEFTARROW    Navigate menu left." );
    println("  Hunger               " +   "       RIGHTARROW   Navigate menu right." );
    println("  Tired                " +   "       DOWNARROW    Select menu option."  );    
    println("  Illness              " +   "       UPARROW      Kill / Respawn Tama." );
    println("  Tantrum              "   );
    println("  MenuSelectionState   " +   "           To make tama sleep, use light.");    
    println("  Current animation    " +   "           To give tama drink, use bathroom.");
    println("  Lights               "   );
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
