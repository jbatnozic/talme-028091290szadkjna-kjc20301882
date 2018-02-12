///sett_update_settings()
/*

*/

//Gameplay:
 
//Graphics:
gui_set_scale( real(string_digits(sett_get_value("GUI Scale")))/100 );
 
texture_set_interpolation(sett_get_value("Interpolation")="On");
display_reset(real(string_digits(sett_get_value("Anti-Alias"))),
              sett_get_value("V-Sync")=="On");
              
HG_world_lighting_set_blur(-1, ite(sett_get_value("Smooth lighting"),"On",8,0), 1);
 
window_set_fullscreen(sett_get_value("Fullscreen")=="On");

spl_toggle(sett_get_value("Dynamic Decals")=="On");

execute_string_delayed("gui_refresh();",1);
//Sound:
 
//Misc. (Other):

