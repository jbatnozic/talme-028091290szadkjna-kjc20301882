///gui_set_mouse_in_hud()
/*
Returns false if the mouse cursor is not in the HUD, otherwise:
 1 - Top left, info window.
 2 - Bottom left, item selection.
 3 - Heart (Pending).
*/
var xx,yy, sc = obj_game_controller.hud_scale;

if (device_mouse_raw_x(0)/gui_get_scale()<180*sc && device_mouse_raw_y(0)/gui_get_scale()<110*sc)
 return 1;
 
if (device_mouse_raw_x(0)/gui_get_scale()<210*sc && device_mouse_raw_y(0)/gui_get_scale()>gui_height()-42*sc)
 return 2;
 
xx=gui_width() / 2;
yy=gui_height()-32*sc;

if point_distance(device_mouse_raw_x(0)/gui_get_scale(),device_mouse_raw_y(0)/gui_get_scale(),xx,yy)<24*sc
 return 3;

return 0;
