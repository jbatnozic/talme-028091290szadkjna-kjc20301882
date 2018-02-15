///gui_draw_sprite_clickable_rel_ext(spriteindex, subimg, x, y, xscale, yscale, alpha)
/*
THIS SCRIPT DRAWS THE INDICATED SPRITE AT THE INDICATED LOCATION AND RETURNS WHETHER IT WAS CLICKED:

NOTE: In this script releasing the mouse button on the button returns true rather than
      pressing.

argument0 - Sprite index
argument1 - Subimage
argument2 - x coordinate
argument3 - y coordinate
argument4 - x scale
argument5 - y scale
argument6 - alpha

Returns - (Bool) Whether the sprite was clicked or not.
*/

if (device_mouse_raw_x(0)/gui_get_scale()>argument2
and device_mouse_raw_x(0)/gui_get_scale()<argument2+sprite_get_width(argument0)*argument4
and device_mouse_raw_y(0)/gui_get_scale()>argument3 
and device_mouse_raw_y(0)/gui_get_scale()<argument3+sprite_get_height(argument0)*argument5) begin

  //Mouse is over the sprite:
  if mouse_check_button(mb_left)=true {
  //Draw - pressed:
   draw_sprite_ext(argument0,argument1,argument2,argument3,argument4,argument5,0,c_gray,argument6);
   }
   else {
  //Draw - hover:
   draw_sprite_ext(argument0,argument1,argument2,argument3,argument4,argument5,0,c_white,argument6);
   draw_set_color(c_white);
   draw_set_alpha(0.35);
   draw_rectangle(argument2,argument3,argument2+sprite_get_width(argument0)*argument4-1,argument3+sprite_get_height(argument0)*argument5-1,false);  
   draw_set_alpha(1);
   }
  //Pressed check & Returning:
   if mouse_check_button_released(mb_left)=true return true;
    else return false;
 end
  else begin
  //Mouse isn't over the sprite:
  draw_sprite_ext(argument0,argument1,argument2,argument3,argument4,argument5,0,c_white,argument6);
  return false;
  end;
