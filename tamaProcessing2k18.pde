import ddf.minim.*;                   // Load audio library

// Prepare images
PImage img_bgr;                    // Prepare background image
PImage img_menuIcon01, img_menuIcon02, img_menuIcon03, img_menuIcon04, // The menu icons
       img_menuIcon05, img_menuIcon06, img_menuIcon07, img_menuIcon08;  

// Audio
Minim sfx_minim;                      // Load audio library
AudioSample sfx_Beep;                 // Prepare 'beep' sound
AudioSample sfx_Hatch;                // Prepare 'hatch' sound
AudioSample sfx_Discipline;           // Prepare 'discipline' sound
AudioSample sfx_Reset;                // Prepare 'discipline' sound

// Pixel Monitor array
Pixel[][] ui_pixelMonitor;            // 2D Array of objects
int ui_pixelMonitor_cols = 32;        // Amount of columns (Width)
int ui_pixelMonitor_rows = 16;        // Amount of rows (Height)

// Game core variables
int core_gameState = 0;               // The current game state
int core_hungerCounter = 0;           // Used for keeping track of when to hunger increase
int core_defecatingCounter = 0;       // Used for keeping track of when to trigger defecating
int core_illnessCounter = 0;          // Used for keeping track of when to trigger illness
int core_tantrumCounter = 0;          // Used for keeping track of when to trigger tantrum
int ui_menuIndex = 0;                 // Which menu option is currently selected?
int ui_pixelOpac = 215;               // Variable used for setting pixel 

boolean env_lightSwitch = true;       // Is the light on (true) or off (false) ?
int env_Turds = 0;                    // How many turds are there around Tama right now?

int tama_statXpGood = 0;              // Tama's xp for good choices and care
int tama_statXpBad = 0;               // Tama's xp for bad choices and neglect

int tama_statHunger = 0;              // Max 4 (satiated), min 0 (hungry)
int tama_statHappy = 0;               // Max 4 (happy), min 0 (unhappy)
int tama_statDiscipline = 0;          // Max 4 (disciplined), min 0 (undisciplined).
boolean tama_statTantrum = false;     // Is Tama throwing a tantrum (true) or not (false) ?
boolean tama_statIllness = false;     // Is Tama ill (true) or not (false)
boolean tama_alarmCall = false;       // Is tama calling for attention? (Showing the bottom right corner light)

// Game config variables
boolean conf_debugOutput = false;     // Is debug mode enabled or disabled

void setup() {
  // Technical  
  size(680, 820);                              // Set window size
  img_bgr = loadImage("background.png");   // Load background image file
  ui_pixelMonitor = new Pixel[ui_pixelMonitor_cols][ui_pixelMonitor_rows];

  // Audio
  sfx_minim = new Minim(this);                                 // Prepare 'beep' sound
  sfx_Beep = sfx_minim.loadSample("sound/beep.wav");               // Load beep sound file
  sfx_Hatch = sfx_minim.loadSample("sound/hatch.wav");             // Load hatch sound file
  sfx_Discipline = sfx_minim.loadSample("sound/discipline.wav");   // Load discipline sound file
  sfx_Reset = sfx_minim.loadSample("sound/reset.wav");             // Load reset sound file

  // UI - Menu Icons
  img_menuIcon01 = loadImage("imgMenu/menu01.png");             // 'Light' afbeelding inladen
  img_menuIcon02 = loadImage("imgMenu/menu02.png");             // 'Game' afbeelding inladen
  img_menuIcon03 = loadImage("imgMenu/menu03.png");             // 'Medicine' afbeelding inladen
  img_menuIcon04 = loadImage("imgMenu/menu04.png");             // 'Bathe' afbeelding inladen
  img_menuIcon05 = loadImage("imgMenu/menu05.png");             // 'Stats' afbeelding inladen
  img_menuIcon06 = loadImage("imgMenu/menu05.png");             // 'Discipline' afbeelding inladen
  img_menuIcon07 = loadImage("imgMenu/menu06.png");             // 'Alert' afbeelding inladen
  img_menuIcon08 = loadImage("imgMenu/menu07.png");             // 'Food' afbeelding inladen

  // UI - Pixel Grid
  for (int i = 0; i < ui_pixelMonitor_cols; i++) {                 // The counter variables i and j are also the column and row numbers. In this example, they are used as arguments to the constructor for each object in the grid.
    for (int j = 0; j < ui_pixelMonitor_rows; j++) {
      ui_pixelMonitor[i][j] = new Pixel(i*10, j*10, 10, 10);       // Initialize each object
    }
  }
}

void draw() {
  // UI
  background(img_bgr);
  
  // UI - Pixel Grid
  int visible;
  for (int i = 0; i < ui_pixelMonitor_cols; i++) {
    for (int j = 0; j < ui_pixelMonitor_rows; j++) {
      if (currentFrame[j][i] == 1) {
        visible = ui_pixelOpac;
      } else {
        visible = 0;
      }
      ui_pixelMonitor[i][j].drawPixel(visible);
    }
  }
  ui_drawAlarm();
  printDebug();
}
