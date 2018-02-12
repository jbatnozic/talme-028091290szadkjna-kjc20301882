///sett_set_defaults()
/*
Returns all the settings to their default values.
*/

//Controls:
sett_set_value("MOVEMENT:",-1);
sett_set_value("Walk left",ord("A"));
sett_set_value("Walk right",ord("D"));
sett_set_value("Jump / Climb up",ord("W"));
sett_set_value("Duck / Climb down",ord("S"));
sett_set_value("Sprint",vk_shift);

sett_set_value("WEAPONS:",-1);
sett_set_value("Fire (Attack)","L Mouse");
sett_set_value("Change Ammo","R Mouse");
sett_set_value("Reload",ord("R"));
sett_set_value("Change Mode",ord("M"));

sett_set_value("INTERFACE:",-1);
sett_set_value("Open Inventory",ord("I"));
sett_set_value("Open Journal",ord("J"));
sett_set_value("Open Crafting",ord("C"));
sett_set_value("Open Settings",ord("Y"));

sett_set_value("OTHER:",-1); 
sett_set_value("Interact",ord("E"));
sett_set_value("Defibrillate",vk_space);
sett_set_value("Pause Game",vk_escape);
sett_set_value("Refresh display",ord("V"));

//Gameplay:
sett_set_value("Auto Equip","Weapons");
sett_set_value("Textbox Speed","Regular");

//Graphics:
sett_set_value("GUI Scale","100%");
sett_set_value("Fullscreen","Off");
sett_set_value("Info Box Opacity",20);
sett_set_value("Frame skipping","On");
sett_set_value("V-Sync","Off");
sett_set_value("Anti-Alias","x0");
sett_set_value("Interpolation","Off");
sett_set_value("Smooth lighting","Off");
sett_set_value("Dynamic Bloom","On");
sett_set_value("Dynamic Decals","On");

//Sound:
sett_set_value("Reset to Defaults","0");
sett_set_value("Master volume",100);

//Misc. (Other):
sett_set_value("Tooltip position","Cursor");
