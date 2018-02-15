///gui_draw_sprite_hover_scale(spriteindex, subimg, x, y, xscale, yscale)
/*

argument0 - Sprite index
argument1 - Subimage
argument2 - x coordinate
argument3 - y coordinate
argument4 - x scale
argument5 - y scale

Returns - (Bool) Whether the sprite is hovered over or not.
*/
if (device_mouse_raw_x(0)/gui_get_scale()>argument2
and device_mouse_raw_x(0)/gui_get_scale()<argument2+sprite_get_width(argument0)*argument4
and device_mouse_raw_y(0)/gui_get_scale()>argument3
and device_mouse_raw_y(0)/gui_get_scale()<argument3+sprite_get_height(argument0)*argument5) begin
 
  //Mouse is over the sprite:
   draw_sprite_ext(argument0,argument1,argument2,argument3,argument4,argument5,0,c_white,1);
   draw_set_color(c_white);
   draw_set_alpha(0.35);
   draw_rectangle(argument2,argument3,argument2+sprite_get_width(argument0)*argument4-1,argument3+sprite_get_height(argument0)*argument5-1,false);  
   draw_set_alpha(1);
   return true;
   
 end
  else begin
  
  //Mouse isn't over the sprite:
  draw_sprite_ext(argument0,argument1,argument2,argument3,argument4,argument5,0,c_white,1);
  return false;
  
  end;
