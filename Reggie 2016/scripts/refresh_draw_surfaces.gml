///refresh_draw_surfaces()
/*

*/
var dW, dH;

dW = min(window_get_width(), window_get_height() * 16 / 9);
dH = dW * 9 / 16;

if (dW <= 0) exit;

with (obj_game_controller) {

  _drawX = (window_get_width() - dW) / 2;
  
  _drawY = (window_get_height() - dH) / 2;

  _drawW = dW;
  
  _drawH = dH;
  
  }

display_set_gui_maximise(gui_get_scale(), gui_get_scale(), 0, 0);

surface_resize(application_surface, GLOBAL.view_width, GLOBAL.view_height);

/*if (surface_exists(global.auxilary_surface))
  surface_resize(global.auxilary_surface, dW, dH);
else
  global.auxilary_surface = surface_create(dW, dH);*/

//window_set_size(dW,dH); <-- To settings STUB
