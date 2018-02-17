///fnt_initialize()
/*

*/

enum FONT {
  
  window,
  window_small,
  textbox_regular,
  textbox_bold,
  textbox_italic,
  tooltip

  }
  
global.FONT_ARRAY[FONT.window]          = f_exo2med_16;
global.FONT_ARRAY[FONT.window_small]    = 0; // STUB
global.FONT_ARRAY[FONT.textbox_regular] = f_palatino_26;
global.FONT_ARRAY[FONT.textbox_bold]    = f_palatino_26_bold;
global.FONT_ARRAY[FONT.textbox_italic]  = f_palatino_26_italic;
global.FONT_ARRAY[FONT.tooltip]         = f_exo2med_16;
