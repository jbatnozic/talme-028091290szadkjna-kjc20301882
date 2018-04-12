///game_initialize(no_dynamic, new_game)
/*

*/ 

//*********//
// STATIC: //
//*********//
 
enum GLOBAL {

 precision = 12,
 view_width = 640,
 view_height = 360,
 pfd_size = 8,
 deactivation_cycle = 3, // Length, in steps

 }

enum KEYBOARD {

    left=0,
    right=1,
    crawl=2,
    sprint=3,
    jump=4,
    climbUp=4,
    climbDown=2,
    interact=5,
    scrollUp=6,   //Not used
    scrollDown=7, //Not used
    hotSwap1 = 8,
    hotSwap2 = 9,
    hotSwap3 = 10,
    hotSwap4 = 11,
    hotSwap5 = 12,
    reload = 13,
    change_frm = 14,
    defibrillate = 17,
    refresh = 18,
    openInv = 19,
    openJou = 20,
    openCra = 21,
    openSet = 22,
    pause = 23,
    pickUp = 24
    
};

enum MOUSE {
    
    shoot = 16,    
    change_amt = 15
    
}

enum AI_STATE {

    hunt, // Actively going after the player
    flee, // Running away from the player
    hide, // Hiding behind obstacles
    idle, // Standing / Sitting / etc
    patrol,
    ret,  // ATTEMPTING to return to x/ystart (if can't it gets close and goes idle),
    forcedmove
    
};

enum ABSEND {

 doNothing=0,
 returnToMenu,
 roomGoto,
 endGame,
 saveChkpt,
 loadChkpt

 };

//Cut-Scenes:
global.scene_active=false;
global.scene_camera_on=false;
global.scene_camera_x=0;
global.scene_camera_y=0;

//Game Save/Load state string:
global.svld_string = "";
     
//Misc.
global.abs_end_action=0;
                             
//We setup the user control scheme to WASD.
globalvar userControls;

userControls[KEYBOARD.left]=ord("A");
userControls[KEYBOARD.right]=ord("D");
userControls[KEYBOARD.jump]=ord("W");
userControls[KEYBOARD.crawl]=ord("S");

userControls[KEYBOARD.hotSwap1]=ord("1");
userControls[KEYBOARD.hotSwap2]=ord("2");
userControls[KEYBOARD.hotSwap3]=ord("3");
userControls[KEYBOARD.hotSwap4]=ord("4");
userControls[KEYBOARD.hotSwap5]=ord("5");

userControls[KEYBOARD.sprint]=vk_shift;
userControls[KEYBOARD.interact]=ord("E");
userControls[MOUSE.shoot] = mb_left;

userControls[KEYBOARD.reload]=ord("R");
userControls[KEYBOARD.change_frm]=ord("M");
userControls[MOUSE.change_amt]=mb_right;

userControls[KEYBOARD.defibrillate]=vk_space;

userControls[KEYBOARD.refresh]=ord("V");

userControls[KEYBOARD.openInv]=ord("I");
userControls[KEYBOARD.openSet]=ord("Y");
userControls[KEYBOARD.openCra]=ord("C");
userControls[KEYBOARD.openJou]=ord("J");

userControls[KEYBOARD.pause]=vk_escape;

userControls[KEYBOARD.pickUp] = ord("E");

//Game Properties:
game_set_properties();
fnt_initialize();

//**********//
// DYNAMIC: //
//**********//

if (argument0 == false) {

  pspec_rinv_initialize();

  crafting_initialise();
  journal_initialise();
  repair_initialise();
  sett_initialize();
  terr_initialize();
  buf_initialise();
  //inv_initialise();
  txt_initialize();
  ptc_initialize();
  pnc_initialize();
  
  spl_initialize();
  
  wpn_sys_initialize();
  
  barter_initialise();
  heart_initialise();
  sev_initialise();
  
  if (argument1 == true)
    sev_set_new_game();
  
  NSP_initialize();
  TPP_initialize();
  TPP_define_defaults();
  TPP_define_local();
  
  res_initialize();
  
  //Blur shader setup:
  global.sha_gauss_sigma = shader_get_uniform(sh_gauss,"sigma");
  global.sha_gauss_blurSize = shader_get_uniform(sh_gauss,"blurSize");
  
  //Helper draw surface:
  global.auxilary_surface = -1;
  global.composit_surface = -1;
  
  }
  
//***********//
// FINALIZE: //
//***********//
global.game_init_flag = true;
  
  
