///txt_initialize()
/*
Initializes the Textbox system.
*/

enum TXT_STATUS {

  no_change  = 0,
  update_ok  = 1,
  choice_err = 2,
  end_of_dia = 3

  }
  
enum TEXTBOX {

 main     = 0,
 code_p   = 1,
 code_s   = 2,
 choices  = 3,
 branches = 4  
   
 }

global.textbox_map=ds_map_create();
