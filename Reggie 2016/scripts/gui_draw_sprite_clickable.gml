///gui_draw_sprite_clickable(spriteindex, subimg, x, y, toggle, [opt] tooltip)
/*
THIS SCRIPT DRAWS THE INDICATED SPRITE AT THE INDICATED LOCATION AND RETURNS WHETHER IT WAS CLICKED:

argument0 - Sprite index
argument1 - Subimage
argument2 - x coordinate
argument3 - y coordinate
argument4 - (Bool) Toggle?

Returns - (Bool) Whether the sprite was clicked or not.
*/
if   device_mouse_raw_x(0)/gui_get_scale()>argument[2] and device_mouse_raw_x(0)/gui_get_scale()<argument[2]+sprite_get_width(argument[0])
 and device_mouse_raw_y(0)/gui_get_scale()>argument[3] and device_mouse_raw_y(0)/gui_get_scale()<argument[3]+sprite_get_height(argument[0]) begin
  //Mouse is over the sprite:
  if mouse_check_button(mb_left)=true {
  //Draw - pressed:
   draw_sprite_ext(argument[0],argument[1],argument[2],argument[3],1,1,0,c_gray,1);
   }
   else {
  //Draw - hover:
   draw_sprite(argument[0],argument[1],argument[2],argument[3]);
   draw_set_color(c_white);
   draw_set_alpha(0.35);
   draw_rectangle(argument[2],argument[3],argument[2]+sprite_get_width(argument[0])-1,argument[3]+sprite_get_height(argument[0])-1,false);  
   draw_set_alpha(1);
   }
  //Draw tooltip:
  if (argument_count>5)
    pnc_set_tooltip(PNC.no_interact,argument[5]);   
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
  draw_sprite(argument[0],argument[1],argument[2],argument[3]);
  //Return:
  return false;
  end;
