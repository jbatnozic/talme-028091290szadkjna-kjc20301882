///txt_interface_open_follow_instance(InstanceId);
/*

*/
var a;

io_clear();

a = instance_create(x, y, obj_textbox);

a.camera_target_id = argument0;
a.camera_mode = 1;

with (a) {

  var camX, camY;
  
  camX = camera_target_id.x;
  camY = camera_target_id.y;
     
  var windowPerc = (sprite_height * sprite_scale) / gui_height(); // OK, works with GUI scaling
  var viewPerc;
  
  var ratio = gui_width() / gui_height();
  
  if (ratio >= 16/9) { // Black bars on the side
  
    viewPerc = windowPerc;
    
    }
  else { // Black barn on top & bottom
  
    var actualHeight   = gui_width() * (9/16);
    var blackBarHeight = (gui_height() - actualHeight) / 2;
    
    if (blackBarHeight >= sprite_height * sprite_scale)
      viewPerc = 0;
    else
      viewPerc = (sprite_height * sprite_scale - blackBarHeight) / actualHeight;
      
    }
    
  game_set_scene_camera(camX, camY + (view_hview * viewPerc / 2));
  
  }
