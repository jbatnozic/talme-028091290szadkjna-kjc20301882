///gui_set_mouse_in_hud()
/*
Returns false if the mouse cursor is not in the HUD, otherwise:
 1 - Top left, info window.
 2 - Bottom left, item selection.
 3 - Heart (Pending).
*/
var xx,yy;

if (device_mouse_raw_x(0)/gui_get_scale()<196-32 && device_mouse_raw_y(0)/gui_get_scale()<103-8)
 return 1;
 
if (device_mouse_raw_x(0)/gui_get_scale()<210 && device_mouse_raw_y(0)/gui_get_scale()>gui_height()-42)
 return 2;
 
xx=gui_width() / 2;
yy=gui_height()-32;

if point_distance(device_mouse_raw_x(0)/gui_get_scale(),device_mouse_raw_y(0)/gui_get_scale(),xx,yy)<24
 return 3;

return 0;
