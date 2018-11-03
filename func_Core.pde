void func_everyHalfSec() {                                  // Run this every half second
  println(ui_frameTracker);
  println(ui_animLength);  
  monitor.ui_frameTracker(ui_shBabytchi_idleRight);
  offsetX = offsetX + 1;
}

void func_everySec() {                                      // Run this every second
}

void func_everyMin() {                                      // Run this every minute second
}

// --

void func_timeEvents() {                                    // Function for keeping track of time
  // tellen met millis
  core_Millis = millis();
  if (core_Millis - core_previousMillisHalfSec >= 500) {    // Keep track of half seconds
    if (conf_debugTimer == true) {
      println("half second passed");
    }
    core_runtimeHalfSec = core_runtimeHalfSec+1;
    core_previousMillisHalfSec = millis();
    core_millisHalfSecSignal = true;                        // when half a second passed, give a signal of 1 cycle long
    func_everyHalfSec();
  }
  if (core_Millis - core_previousMillisSec >= 1000) {       // Keep track of seconds
    if (conf_debugTimer == true) {
      println("second passed");
    }
    core_runtimeSec = core_runtimeSec+1;
    core_previousMillisSec = millis();
    core_millisSecSignal = true;                            // when a second passed, give a signal of 1 cycle long
    func_everySec();
  }
  if (core_Millis - core_previousMillisMin >= 60000) {      // Keep track of minutes
    if (conf_debugTimer == true) {
      println("minute passed");
    }
    core_runtimeMin = core_runtimeMin+1;
    core_previousMillisMin = millis();
    core_millisMinuteSignal = true;                         // when a minute  passed, give a signal of 1 cycle long
    func_everySec();
    func_everyMin();
  }
  // signals can be used for stuff like calculating stat changes or cycling through animations at the desired rate of 2fps (one every half second)
}

void func_timeTrackerReset() {                              // After the time period marking signals were enabled for a single frame, disable them again immediately 
  core_millisHalfSecSignal = false;
  core_millisSecSignal = false;
  core_millisMinuteSignal = false;
}
