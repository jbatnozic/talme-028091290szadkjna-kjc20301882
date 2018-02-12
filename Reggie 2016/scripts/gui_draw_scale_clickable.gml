///gui_draw_scale_clickable(X1, Y1, X2, Y2, Sprite, CurrentValue, MaxValue, Snap)
/*

*/
var a,xscale,yscale,width;

xscale=(argument2-argument0)/sprite_get_width(argument4);
yscale=(argument3-argument1)/sprite_get_height(argument4);
width=sprite_get_width(argument4)*(argument5/argument6);

draw_sprite_ext(argument4,1,argument0,argument1,xscale,yscale,0,c_white,1);
draw_sprite_part_ext(argument4,0,0,0,width,sprite_get_height(argument4),argument0,argument1,xscale,yscale,c_white,1);

if   device_mouse_raw_x(0)/gui_get_scale()>argument0 and device_mouse_raw_x(0)/gui_get_scale()<argument2
 and device_mouse_raw_y(0)/gui_get_scale()>argument1 and device_mouse_raw_y(0)/gui_get_scale()<argument3 {
 
 draw_set_alpha(0.35);
 draw_set_colour(c_white);
 draw_rectangle(argument0,argument1,argument2,argument3,false);
 
 if mouse_check_button(mb_left)=true {
 
  a=round( (device_mouse_raw_x(0)/gui_get_scale()-argument0)/(argument2-argument0)*argument6/argument7 )*argument7;
  return a;
 
  }
 
 }
 
return argument5;
