///sett_update_settings()
/*

*/

//Gameplay:
 
//Graphics:
gui_set_scale( real(string_digits(sett_get_value("GUI Scale")))/100 );
 
texture_set_interpolation(sett_get_value("Interpolation")="On");

//sett_reset_display();
              
HG_world_lighting_set_blur(-1, tern(sett_get_value("Smooth lighting"), "On", 8, 0), 1);
 
window_set_fullscreen(sett_get_value("Fullscreen") == "On");

spl_toggle(sett_get_value("Dynamic Decals") == "On");

execute_string_delayed("refresh_draw_surfaces();", 1, false);

//Sound:
 
//Misc. (Other):

