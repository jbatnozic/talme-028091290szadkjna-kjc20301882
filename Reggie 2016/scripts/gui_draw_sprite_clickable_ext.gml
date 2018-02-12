///gui_draw_sprite_clickable_ext(spriteindex, subimg, x, y, toggle, xscale, yscale, alpha)
/*
THIS SCRIPT DRAWS THE INDICATED SPRITE AT THE INDICATED LOCATION AND RETURNS WHETHER IT WAS CLICKED:

argument0 - Sprite index.
argument1 - Subimage.
argument2 - X coordinate.
argument3 - Y coordinate.
argument4 - (Bool) Toggle?
argument5 - X scale.
argument6 - Y scale.
argument7 - Alpha.

Returns - (Bool) Whether the sprite was clicked or not.
*/
if    device_mouse_raw_x(0)/gui_get_scale()>argument2 and  device_mouse_raw_x(0)/gui_get_scale()<argument2+sprite_get_width(argument0)*argument5
 and  device_mouse_raw_y(0)/gui_get_scale()>argument3 and  device_mouse_raw_y(0)/gui_get_scale()<argument3+sprite_get_height(argument0)*argument6 begin
  //Mouse is over the sprite:
  if mouse_check_button(mb_left)=true {
  //Draw - pressed:
   draw_sprite_ext(argument0,argument1,argument2,argument3,argument5,argument6,0,c_gray,argument7);
   }
   else {
  //Draw - hover:
   draw_sprite_ext(argument0,argument1,argument2,argument3,argument5,argument6,0,c_white,argument7);
   draw_set_color(c_white);
   draw_set_alpha(0.35*argument7);
   draw_rectangle(argument2,argument3,argument2+sprite_get_width(argument0)*argument5-1,argument3+sprite_get_height(argument0)*argument6-1,false);  
   draw_set_alpha(1);
   }
  //Pressed check & Returning:
  if argument4=true {
   if mouse_check_button_pressed(mb_left)=true return true;
    else return false;
   }
   else {
    if mouse_check_button(mb_left)=true return true
     else return false;
    }
 end
  else begin
  //Mouse isn't over the sprite:
  draw_sprite_ext(argument0,argument1,argument2,argument3,argument5,argument6,0,c_white,argument7);
  return false;
  end;
