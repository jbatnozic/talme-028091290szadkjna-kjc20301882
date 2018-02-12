///txt_interface_open(Sprite 1, Name 1, Sprite 2, Name 2, Camera X, Camera Y);
/*

*/
var a;

io_clear();
a=instance_create(x,y,obj_textbox);

a.sprite_1=argument[0];
a.sprite_2=argument[2];
a.name_1=argument[1];
a.name_2=argument[3];

a.camera_target_x=argument[4];
a.camera_target_y=argument[5];

with (a) {

  var bbh=obj_game_controller._drawY,
      cov=max(0,sprite_height-bbh)/(4-gui_get_scale());
  game_set_scene_camera(camera_target_x,camera_target_y+cov);
  
  }
