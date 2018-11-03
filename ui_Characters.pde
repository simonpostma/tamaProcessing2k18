class tama_Char {               // A  Tamagotchi object knows about its location in the grid as well as its size with the variables x, y, w, h.
  int char_meta_Name;           // The name of the current character
  int char_meta_posX;           // The X position of tama on the monitor
  int char_meta_poxY;           // The Y position of tama on the monitor
  int char_meta_offsetY;        // The Y axis offset in pixels for the particular character

  int char_atr_Hunger;          // The "Atributes" are used by the game calculators to determine how and when to progress tama's needs. This allows for unique behaviors for different characters
  int char_atr_Illness;    
  int char_atr_Happiness;
  int char_atr_Discipline;
  int char_atr_Defecating;

  int char_resp_Eat;            // The "factors" are used to determine how tama and his needs respond to specific player actions. This allows for unique behaviors for different characters
  int char_resp_Snack;
  int char_resp_Medicate;
  int char_resp_Discipline;
  int char_resp_Win;
  int char_resp_Lose;
  int char_resp_XpGood;
  int char_resp_XpBad;

  int char_event_Wake;           // The regular waking and sleeping times of this character
  int char_event_Sleep;

  int char_anim_Idle;            // The animations of this character
  int char_anim_Cheer;
  int char_anim_Boo;
  int char_anim_Eat;
  int char_anim_Sleep;
  int char_anim_Poop;
  int char_anim_Illness;
  int char_anim_Play;

  tama_Char() {       // constructor
  }

  void display() {    // with this you can do stuff like "tama.display"
  }
  
  void move() {
  }

}
