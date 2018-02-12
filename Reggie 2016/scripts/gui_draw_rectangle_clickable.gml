///gui_draw_rectangle_clickable(x, y, w, h, toggle)
/*
THIS SCRIPT DRAWS THE INDICATED SPRITE AT THE INDICATED LOCATION AND RETURNS WHETHER IT WAS CLICKED:

argument0 - X coordinate
argument1 - Y coordinate
argument2 - Width
argument3 - Height
argument4 - (Bool) Toggle?

Returns - (Bool) Whether the sprite was clicked or not.
*/
if   device_mouse_raw_x(0)/gui_get_scale()>argument0 and device_mouse_raw_x(0)/gui_get_scale()<argument0+argument2
 and device_mouse_raw_y(0)/gui_get_scale()>argument1 and device_mouse_raw_y(0)/gui_get_scale()<argument1+argument3 begin
  //Mouse is over the rectangle:
  if mouse_check_button(mb_left)=true {
  //Draw - pressed:
   draw_set_color(c_dkgray);
   draw_set_alpha(0.35);
   draw_rectangle(argument0,argument1,argument0+argument2,argument1+argument3,false);
   draw_set_color(c_white);
   draw_set_alpha(1);
   }
   else {
  //Draw - hover:
   draw_set_color(c_ltgray);
   draw_set_alpha(0.35);
   draw_rectangle(argument0,argument1,argument0+argument2,argument1+argument3,false);
   draw_set_color(c_white);
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
  else
   //Mouse isn't over the rectangle:
   return false;
