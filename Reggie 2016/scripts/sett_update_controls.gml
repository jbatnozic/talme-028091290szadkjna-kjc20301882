///sett_update_controls()
/*

*/

//Movement:
userControls[KEYBOARD.left]=sett_get_value("Walk left");
userControls[KEYBOARD.right]=sett_get_value("Walk right");
userControls[KEYBOARD.jump]=sett_get_value("Jump / Climb up");
userControls[KEYBOARD.crawl]=sett_get_value("Duck / Climb down");
userControls[KEYBOARD.sprint]=sett_get_value("Sprint");

//Weapons:
userControls[KEYBOARD.reload]=sett_get_value("Reload");
userControls[KEYBOARD.change_frm]=sett_get_value("Change Mode");

//Interface:
userControls[KEYBOARD.openInv]=sett_get_value("Open Inventory");
userControls[KEYBOARD.openSet]=sett_get_value("Open Settings");
userControls[KEYBOARD.openCra]=sett_get_value("Open Crafting");
userControls[KEYBOARD.openJou]=sett_get_value("Open Journal");

//Other:
userControls[KEYBOARD.interact]=sett_get_value("Interact");
userControls[KEYBOARD.defibrillate]=sett_get_value("Defibrillate");
userControls[KEYBOARD.refresh]=sett_get_value("Refresh display");
