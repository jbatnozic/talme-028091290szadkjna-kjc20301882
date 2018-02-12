///gui_refresh()
/*

*/

with (obj_game_controller) {

 var dW,dH;

 dW=min(window_get_width(),window_get_height()*16/9);
 dH=dW*9/16;

 _drawX=(window_get_width()-dW)/2;
 
 _drawY=(window_get_height()-dH)/2;

 display_set_gui_maximise(gui_get_scale(),gui_get_scale(),0,0);
 surface_resize(application_surface,dW,dH);
 
 if (surface_exists(auxSurf))
  surface_resize(auxSurf,dW,dH);

 //window_set_size(dW,dH); <-- To settings STUB
 
}
