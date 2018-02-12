///draw_background_parallax(Background, Level, Relative X, Relative Y, AltHeight, Alpha, Scale)
/*

Parallax Levels:   <0 - Foreground parallax.
                    0 - No parallax.
                  0-1 - Background parallax. 
                    1 - Trivial parallax.             
                   >1 - Wrong parallax (don't use this).
                   
*/
var abs_w,abs_h,cur_x,cur_y;

abs_w=max(room_width-view_wview,0);
abs_h=max(argument4-view_hview,0);

//X coordinate:
if argument2=true
 cur_x=view_xview*(argument1)
 else cur_x=view_xview*(1-1/abs_w*( background_get_width(argument0)-view_wview));
  
//Y coordinate:
if argument3=true
 cur_y=min(view_yview,room_height)*argument1
 else
  cur_y=min(view_yview,room_height)*(1-1/abs_h*(background_get_height(argument0)-view_hview));

//Drawing:
draw_background_tiled_ext(argument0,cur_x,cur_y,argument6,argument6,c_white,argument5);
