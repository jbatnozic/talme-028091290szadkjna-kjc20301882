///draw_background_parallax_lim(Background, Level, X, Y, Alpha, Scale)
/*

Parallax Levels:   <0 - Foreground parallax.
                    0 - No parallax.
                  0-1 - Background parallax. 
                    1 - Trivial parallax.             
                   >1 - Wrong parallax (don't use this).
                   
*/
var cur_x,cur_y;

//X coordinate:
cur_x=view_xview*(argument1)+argument2;
  
//Y coordinate:
cur_y=view_yview*(argument1)+argument3;

//Drawing:
draw_background_ext(argument0,cur_x,cur_y,argument5,argument5,0,c_white,argument4);
