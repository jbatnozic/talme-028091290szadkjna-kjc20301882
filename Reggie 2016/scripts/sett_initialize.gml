///sett_initialize()
/*
Initializes the Settings system.
*/

enum SETT_TYPE {

 selection,
 percent_scale,
 control_button,
 title,
 fixed,
 toggle

 }
 
enum SETT_GROUP {

 controls=0,
 gameplay=1,
 graphics=3,
 sound=2,
 misc=4,

 }

global.sett_grid=ds_grid_create(18,0);
global.sett_map=ds_map_create();

//DEFINITIONS:

 //Controls:
 global.sett_controls=21;
 sett_define_value("MOVEMENT:",SETT_TYPE.title,SETT_GROUP.controls); 
 sett_define_value("Walk left",SETT_TYPE.control_button,SETT_GROUP.controls);
 sett_define_value("Walk right",SETT_TYPE.control_button,SETT_GROUP.controls);
 sett_define_value("Jump / Climb up",SETT_TYPE.control_button,SETT_GROUP.controls);
 sett_define_value("Duck / Climb down",SETT_TYPE.control_button,SETT_GROUP.controls);
 sett_define_value("Sprint",SETT_TYPE.control_button,SETT_GROUP.controls);
  
 sett_define_value("WEAPONS:",SETT_TYPE.title,SETT_GROUP.controls);
 sett_define_value("Fire (Attack)",SETT_TYPE.fixed,SETT_GROUP.controls);
 sett_define_value("Change Ammo",SETT_TYPE.fixed,SETT_GROUP.controls);
  sett_desc_to_last("Press to change the ammo type used (where it's available).");
 sett_define_value("Change Mode",SETT_TYPE.control_button,SETT_GROUP.controls);
  sett_desc_to_last("Press to change the weapon's firing mode (where it's available).");
 sett_define_value("Reload",SETT_TYPE.control_button,SETT_GROUP.controls);
  sett_desc_to_last("Press to reload currently held weapon. Hold then release to unload ammo from it.");
 
 sett_define_value("INTERFACE:",SETT_TYPE.title,SETT_GROUP.controls);
 sett_define_value("Open Inventory",SETT_TYPE.control_button,SETT_GROUP.controls);
 sett_define_value("Open Journal",SETT_TYPE.control_button,SETT_GROUP.controls);
 sett_define_value("Open Crafting",SETT_TYPE.control_button,SETT_GROUP.controls);
 sett_define_value("Open Settings",SETT_TYPE.control_button,SETT_GROUP.controls);
  
 sett_define_value("OTHER:",SETT_TYPE.title,SETT_GROUP.controls); 
 sett_define_value("Interact",SETT_TYPE.control_button,SETT_GROUP.controls);
 sett_define_value("Defibrillate",SETT_TYPE.control_button,SETT_GROUP.controls);
 sett_define_value("Pause Game",SETT_TYPE.control_button,SETT_GROUP.controls);
  sett_desc_to_last("Setting currently broken.");
 sett_define_value("Refresh display",SETT_TYPE.control_button,SETT_GROUP.controls);
  sett_desc_to_last("Use this when the display doesn't rescale well after resizing the window or toggling fullscreen.");
 
 //Gameplay:
 global.sett_gameplay=2;
 sett_define_value("Auto Equip",SETT_TYPE.selection,SETT_GROUP.gameplay,"Off","Weapons","Most","All");
  sett_desc_to_last("Determines if picked up items will be automatically equipped.#Weapons - only Weapons will be Auto-Equipped.#Most - Everything but Armour will be Auto-Equipped.#All - All items will be Auto-Equipped.");
 sett_define_value("Textbox Speed",SETT_TYPE.selection,SETT_GROUP.gameplay,"Slow","Regular","Fast","Instant");
  sett_desc_to_last("The rate at which the letters appear in the textbox during conversations.");
 
 //Graphics:
 global.sett_graphics=10;
 sett_define_value("GUI Scale",SETT_TYPE.selection,SETT_GROUP.graphics,"100%","125%","150%","175%","200%");
  sett_desc_to_last("Determines size of the GUI elements.");
 sett_define_value("Fullscreen",SETT_TYPE.toggle,SETT_GROUP.graphics,"Off","On");
  sett_desc_to_last("::");
 sett_define_value("Info Box Opacity",SETT_TYPE.percent_scale,SETT_GROUP.graphics,0,100);
  sett_desc_to_last("Minimal opacity of the info box when it fades (when not in use).");
 sett_define_value("Frame skipping",SETT_TYPE.toggle,SETT_GROUP.graphics,"On","Off");
  sett_desc_to_last("Helps improve performance when On.");
 sett_define_value("V-Sync",SETT_TYPE.toggle,SETT_GROUP.graphics,"On","Off");
  sett_desc_to_last("::");
 sett_define_value("Anti-Alias",SETT_TYPE.selection,SETT_GROUP.graphics,"x0","x2","x4","x8");
  sett_desc_to_last("::");
 sett_define_value("Interpolation",SETT_TYPE.toggle,SETT_GROUP.graphics,"On","Off");
  sett_desc_to_last("::");
 sett_define_value("Smooth lighting",SETT_TYPE.toggle,SETT_GROUP.graphics,"On","Off");
  sett_desc_to_last("Creates more gentle gradients with lighting but it can cause a terrible slow-down with bad graphic cards (especially integrated).");
 sett_define_value("Dynamic Bloom",SETT_TYPE.toggle,SETT_GROUP.graphics,"On","Off");
  sett_desc_to_last("::");
 sett_define_value("Dynamic Decals",SETT_TYPE.toggle,SETT_GROUP.graphics,"On","Off");
  sett_desc_to_last("::");
 
 //Sound:
 global.sett_sound=1;
 sett_define_value("Master volume",SETT_TYPE.percent_scale,SETT_GROUP.sound,0,100);
  sett_desc_to_last("Volume for everything.");
 
 //Misc. (Other):
 global.sett_misc=2;
 sett_define_value("Tooltip position",SETT_TYPE.toggle,SETT_GROUP.misc,"Cursor","Fixed");
  sett_desc_to_last("Whether the tooltips will be drawn next to the cursor or in a fixed place.");
 sett_define_value("Reset to Defaults",SETT_TYPE.toggle,SETT_GROUP.misc,"0","1");
  sett_desc_to_last("Revert all settings back to their original values.");
 
//DEFAULTS:
sett_set_defaults();

ini_open("Settings.ini");

if (!ini_section_exists("SETTINGS")) {
  
  ini_write_string("SETTINGS","Settings",sett_write());
  }
  else {
    sett_read(ini_read_string("SETTINGS","Settings",""));
    }
    
ini_close();







