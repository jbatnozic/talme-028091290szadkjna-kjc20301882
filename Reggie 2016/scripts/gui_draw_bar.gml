///gui_draw_bar(Sprite, Subimage, X, Y, Amount [0..1], LeftToRight);
/*

*/
var size,w,h;

size=clamp(argument4,0,1);

switch (argument5) begin

 case 1:
   w=sprite_get_width(argument0);
   h=sprite_get_height(argument0);
   draw_sprite_part(argument0,argument1,0,0,w*size,h,argument2,argument3);
  break;
  
 case 0:
   w=sprite_get_width(argument0);
   h=sprite_get_height(argument0);
   draw_sprite_part(argument0,argument1,w*(1-size),0,w*(size),h,argument2-w*size,argument3);
  break;
  
 default:
  break;
  
end;
