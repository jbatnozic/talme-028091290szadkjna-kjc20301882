///gui_draw_sprite_clickable_rel(spriteindex, subimg, x, y)
/*
THIS SCRIPT DRAWS THE INDICATED SPRITE AT THE INDICATED LOCATION AND RETURNS WHETHER IT WAS CLICKED:

NOTE: In this script releasing the mouse button on the button returns true rather than
      pressing.

argument0 - Sprite index
argument1 - Subimage
argument2 - x coordinate
argument3 - y coordinate

Returns - (Bool) Whether the sprite was clicked or not.
*/
if    device_mouse_raw_x(0)/gui_get_scale()>argument2 and  device_mouse_raw_x(0)/gui_get_scale()<argument2+sprite_get_width(argument0)
 and  device_mouse_raw_y(0)/gui_get_scale()>argument3 and  device_mouse_raw_y(0)/gui_get_scale()<argument3+sprite_get_height(argument0) begin
  //Mouse is over the sprite:
  if mouse_check_button(mb_left)=true {
  //Draw - pressed:
   draw_sprite_ext(argument0,argument1,argument2,argument3,1,1,0,c_gray,1);
   }
   else {
  //Draw - hover:
   draw_sprite(argument0,argument1,argument2,argument3);
   draw_set_color(c_white);
   draw_set_alpha(0.35);
   draw_rectangle(argument2,argument3,argument2+sprite_get_width(argument0)-1,argument3+sprite_get_height(argument0)-1,false);  
   draw_set_alpha(1);
   }
  //Pressed check & Returning:
   if mouse_check_button_released(mb_left)=true return true;
    else return false;
 end
  else begin
  //Mouse isn't over the sprite:
  draw_sprite(argument0,argument1,argument2,argument3);
  return false;
  end;
