///txt_interface_open(Camera X, Camera Y);
/*

*/
var a;

io_clear();

a = instance_create(x, y, obj_textbox);

a.camera_target_x = argument0;
a.camera_target_y = argument1;

with (a) {

  var bbh = obj_game_controller._drawY,
      cov = max(0,sprite_height-bbh)/(4-gui_get_scale());
  game_set_scene_camera(camera_target_x, camera_target_y + cov);
  
  }
