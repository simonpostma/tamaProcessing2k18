void func_everyHalfSec() {                                  // Run this every half second
  println(ui_frameTracker);
  println(ui_animLength);  
  ui_frameTracker(ui_shBabytchi_idleRight);
  offsetX = offsetX + 1;
}

void func_everySec() {                                      // Run this every second
}

void func_everyMin() {                                      // Run this every minute second
}


void func_timeEvents() {    // Function for keeping track of time
  // tellen met millis
  core_Millis = millis();
  if (core_Millis - core_previousMillisHalfSec >= 500) {    // Keep track of half seconds
    if (conf_debugTimer == true) {
      println("half second passed");
    }
    core_runtimeHalfSec = core_runtimeHalfSec+1;
    core_previousMillisHalfSec = millis();
    core_millisHalfSecSignal = true;                        // wanneer er een halve seconde voorbij is, geef een signaaltje van 1 frame lang
    func_everyHalfSec();
  }
  if (core_Millis - core_previousMillisSec >= 1000) {       // Keep track of seconds
    if (conf_debugTimer == true) {
      println("second passed");
    }
    core_runtimeSec = core_runtimeSec+1;
    core_previousMillisSec = millis();
    core_millisSecSignal = true;                            // wanneer er een seconde voorbij is, geef een signaaltje van 1 frame lang
    func_everySec();
  }
  if (core_Millis - core_previousMillisMin >= 60000) {      // Keep track of minutes
    if (conf_debugTimer == true) {
      println("minute passed");
    }
    core_runtimeMin = core_runtimeMin+1;
    core_previousMillisMin = millis();
    core_millisMinuteSignal = true;                         // wanneer er een minuut voorbij is, geef een signaaltje van 1 frame lang
    func_everyMin();
  }
  // signaaltje kan in een animatie cyclus bijv het volgende frame triggeren
  // bijvoorbeeld in animatie functie: if Signaaltje, doe ++Frame
}

void func_timeTrackerReset() {                               // After the time period marking signals were enabled for a single frame, disable them again immediately 
  core_millisHalfSecSignal = false;
  core_millisSecSignal = false;
  core_millisMinuteSignal = false;
}
