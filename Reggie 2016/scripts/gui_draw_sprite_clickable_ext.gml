///gui_draw_sprite_clickable_ext(spriteindex, subimg, x, y, toggle, xscale, yscale, alpha, [OPT] tooltip)
/*
THIS SCRIPT DRAWS THE INDICATED SPRITE AT THE INDICATED LOCATION AND RETURNS WHETHER IT WAS CLICKED:

argument[0] - Sprite index.
argument[1] - Subimage.
argument[2] - X coordinate.
argument[3] - Y coordinate.
argument[4] - (Bool) Toggle?
argument[5] - X scale.
argument[6] - Y scale.
argument[7] - Alpha.
argument8 - (Optional) Tooltip.

Returns - (Bool) Whether the sprite was clicked or not.
*/
if    device_mouse_raw_x(0)/gui_get_scale()>argument[2] and  device_mouse_raw_x(0)/gui_get_scale()<argument[2]+sprite_get_width(argument[0])*argument[5]
 and  device_mouse_raw_y(0)/gui_get_scale()>argument[3] and  device_mouse_raw_y(0)/gui_get_scale()<argument[3]+sprite_get_height(argument[0])*argument[6] begin
  //Mouse is over the sprite:
  if mouse_check_button(mb_left)=true {
  //Draw - pressed:
   draw_sprite_ext(argument[0],argument[1],argument[2],argument[3],argument[5],argument[6],0,c_gray,argument[7]);
   }
   else {
  //Draw - hover:
   draw_sprite_ext(argument[0],argument[1],argument[2],argument[3],argument[5],argument[6],0,c_white,argument[7]);
   draw_set_color(c_white);
   draw_set_alpha(0.35*argument[7]);
   draw_rectangle(argument[2],argument[3],argument[2]+sprite_get_width(argument[0])*argument[5]-1,argument[3]+sprite_get_height(argument[0])*argument[6]-1,false);  
   draw_set_alpha(1);
   }
  //Draw tooltip:
  if (argument_count>8)
    pnc_set_tooltip(PNC.no_interact,argument[8]);    
  //Pressed check & Returning:
  if argument[4]=true {
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
  draw_sprite_ext(argument[0],argument[1],argument[2],argument[3],argument[5],argument[6],0,c_white,argument[7]);
  return false;
  end;
