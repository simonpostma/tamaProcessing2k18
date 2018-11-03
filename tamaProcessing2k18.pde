// Next goal: 
//    make everything object oriented programming based.
//    move     monitor.animator, monitor.ui_monitorMovementProcessor      to tama class so tama manages his own animation
import java.util.Arrays;
import ddf.minim.*;                   // Load audio library

boolean[][] ui_emptyFrame = {  
  {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false}, 
  {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false}, 
  {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false}, 
  {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false}, 
  {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false}, 
  {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false}, 
  {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false}, 
  {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false}, 
  {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false}, 
  {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false}, 
  {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false}, 
  {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false}, 
  {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false}, 
  {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false}, 
  {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false}, 
  {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false}
};
boolean[][] ui_currentFrame = ui_emptyFrame;                      // Array with the content of the frame before drawing

// Game config variables
boolean conf_debugOutput = true;                                  // Is debug mode enabled or disabled
boolean conf_debugTimer = true;                                   // Print when one of the time units has passed?
boolean ui_drawTestToggle = false;                                // Are we running the drawing test?

// Prepare images
PImage img_bgr;                                                   // Prepare background image
PImage img_menuIcon01, img_menuIcon02, img_menuIcon03,            // Prepare the menu icons
  img_menuIcon04, img_menuIcon05, img_menuIcon06, 
  img_menuIcon07, img_menuIcon08;

// Tama class related
tama_Char tama;
Monitor monitor;

// Audio
Minim sfx_minim;                                                  // Load audio library
AudioSample sfx_Beep;                                             // Prepare 'beep' sound
AudioSample sfx_Hatch;                                            // Prepare 'hatch' sound
AudioSample sfx_Discipline;                                       // Prepare 'discipline' sound
AudioSample sfx_Reset;                                            // Prepare 'discipline' sound

// Pixel Monitor array
Pixel[][] ui_pixelMonitor;                                        // 2D Array of objects
int ui_pixelMonitor_cols = 32;                                    // Amount of columns (Width)
int ui_pixelMonitor_rows = 16;                                    // Amount of rows (Height)

int offsetX = 0;

// Game core variables
int core_gameState = 0;                                           // The current game state
int core_hungerCounter = 0;                                       // Used for keeping track of when to hunger increase
int core_defecatingCounter = 0;                                   // Used for keeping track of when to trigger defecating
int core_illnessCounter = 0;                                      // Used for keeping track of when to trigger illness
int core_tantrumCounter = 0;                                      // Used for keeping track of when to trigger tantrum
int[] ui_monitorOffset = {184, 369};                              // Set where the monitor should begin drawing (x, y)
int ui_menuIndex = 0;                                             // Which menu option is currently selected?
int ui_pixelOpac = 215;                                           // Variable used for setting pixel
int ui_strokeOpac = 10;
int ui_framteTime = 500;                                          // show every frame for 500 ms
int ui_frameTracker = 0;                                          // which frame of the current animation is being shown?
int ui_animLength = 0;
int[][] ui_movementManagerFrame;
int core_millisStart = 0;                                         // the first millis value for (time tracking)
int core_Millis = 0;                                              // the current millis value for (time tracking)
int core_previousMillisHalfSec =0;                                // used for measuring difference in the half-sec tracker
int core_runtimeHalfSec = 0;
int core_previousMillisSec =0;                                    // used for measuring difference in the sec tracker
int core_runtimeSec = 0;
int core_previousMillisMin =0;                                    // used for measuring difference in the min tracker
int core_runtimeMin = 0;
boolean core_millisHalfSecSignal = false;                         // the signal that is triggered at every half second
boolean core_millisSecSignal = false;                             // the signal that is triggered at every  second
boolean core_millisMinuteSignal = false;                          // the signal that is triggered at every minute


boolean env_lightSwitch = true;                                   // Is the light on (true) or off (false) ?
int env_Turds = 0;                                                // How many turds are there around Tama right now?

int tama_statXpGood = 0;                                          // Tama's xp for good choices and care
int tama_statXpBad = 0;                                           // Tama's xp for bad choices and neglect

boolean tama_statAlive = false;
int tama_statHunger = 0;                                          // Max 4 (satiated), min 0 (hungry)
int tama_statHappy = 0;                                           // Max 4 (happy), min 0 (unhappy)
int tama_statDiscipline = 0;                                      // Max 4 (disciplined), min 0 (undisciplined).
int tama_statFatigue = 0;
boolean tama_statTantrum = false;                                 // Is Tama throwing a tantrum (true) or not (false) ?
boolean tama_statIllness = false;                                 // Is Tama ill (true) or not (false)
boolean tama_alarmCall = false;                                   // Is tama calling for attention? (Showing the bottom right corner light)

void setup() {
  // Technical  
  core_millisStart = millis();
  tama = new tama_Char();                                         // execute Tama constructor.
  monitor = new Monitor();

  size(680, 820);                                                 // Set window size
  img_bgr = loadImage("background.png");                          // Load background image file
  ui_pixelMonitor = new Pixel[ui_pixelMonitor_cols][ui_pixelMonitor_rows];

  // Audio
  sfx_minim = new Minim(this);                                    // Prepare 'beep' sound
  sfx_Beep = sfx_minim.loadSample("sound/beep.wav");              // Load beep sound file
  sfx_Hatch = sfx_minim.loadSample("sound/hatch.wav");            // Load hatch sound file
  sfx_Discipline = sfx_minim.loadSample("sound/discipline.wav");  // Load discipline sound file
  sfx_Reset = sfx_minim.loadSample("sound/reset.wav");            // Load reset sound file

  // UI - Menu Icons
  img_menuIcon01 = loadImage("imgMenu/menu01.png");               // 'Light' afbeelding inladen
  img_menuIcon02 = loadImage("imgMenu/menu02.png");               // 'Game' afbeelding inladen
  img_menuIcon03 = loadImage("imgMenu/menu03.png");               // 'Medicine' afbeelding inladen
  img_menuIcon04 = loadImage("imgMenu/menu04.png");               // 'Bathe' afbeelding inladen
  img_menuIcon05 = loadImage("imgMenu/menu05.png");               // 'Stats' afbeelding inladen
  img_menuIcon06 = loadImage("imgMenu/menu05.png");               // 'Discipline' afbeelding inladen
  img_menuIcon07 = loadImage("imgMenu/menu06.png");               // 'Alert' afbeelding inladen
  img_menuIcon08 = loadImage("imgMenu/menu07.png");               // 'Food' afbeelding inladen

  // UI - Pixel Grid: create objects
  for (int i = 0; i < ui_pixelMonitor_cols; i++) {                // The counter variables i and j are also the column and row numbers. In this example, they are used as arguments to the constructor for each object in the grid.
    for (int j = 0; j < ui_pixelMonitor_rows; j++) {
      ui_pixelMonitor[i][j] = new Pixel(i*10, j*10, 10, 10, 0, ui_strokeOpac);// Initialize each object (pixel) in the pixel monitor
    }
  }
}

void draw() {
  background(img_bgr);                                            // draw the background                          
  ui_monitorManager(); // Run the monitor manager
  func_timeEvents();                                              // Keep track of time using millis
  ui_drawAlarm();                                                 // Draw tama's alarm call on screen
  debug_Operations();                                             // Output stuff to console
  func_timeTrackerReset();                                        // reset the time event signals
}

void ui_monitorManager() {                                        // Alle afb. arrays bij elkaar in 1 array (currentFrame) met alle pixels
  for (int i = 0; i < ui_currentFrame.length; i++) {              // monitor leeg maken
    Arrays.fill(ui_currentFrame[i], false);
  }
  monitor.createPixels();                                         // draw the empty pixels on top of the background
  monitor.animator(ui_shBabytchi_idleRight);                      // loop through tama's frames
  //ui_monitorMovementProcessor();                                // calculations relating to movement of tama across the screen
  //ui_monitorAgregator();                                        // bring all to-draw pixels together after they've been calculated. At this point everything is being put into ui_currentFrame[][]
  //ui_testAnim();
  //ui_testDraw();  
  monitor.display(ui_currentFrame);                               //draw everything that was collected into ui_currentFrame[][] by ui_monitorAgregator()
}
