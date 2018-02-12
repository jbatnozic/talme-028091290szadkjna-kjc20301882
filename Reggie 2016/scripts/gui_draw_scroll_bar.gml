///gui_draw_scroll_bar(x1,y1,x2,y2,max rows,visible rows,scroll,sprite)
/*

argument0 - X1.
argument1 - Y1.
argument2 - X2.
argument3 - Y2.

argument4 - Maximum number of rows.
argument5 - Number of visible rows.
argument6 - Scroll value.

argument7 - Sprite. <-- Maybe a STUB.

Returns new scroll value (if clicked).
*/
var s_width,s_height,s_y,new_scroll;

s_width=abs(argument0-argument2);
s_height=max(abs(argument1-argument3)*min(argument5/argument4,1),8);

s_y=(abs(argument1-argument3)-s_height);

if argument4>argument5
 s_y*=argument6/(argument4-argument5)
 else s_y*=0;

draw_sprite_stretched_ext(argument7,0,argument0,argument1+s_y,s_width,s_height,c_white,1);

new_scroll=argument6;

if mouse_check_button(mb_left)=true {
 
 if device_mouse_raw_x(0)/gui_get_scale()>argument0 and device_mouse_raw_x(0)/gui_get_scale()<argument2 and
    device_mouse_raw_y(0)/gui_get_scale()>argument1 and device_mouse_raw_y(0)/gui_get_scale()<argument3 {
    
  new_scroll=(device_mouse_raw_y(0)/gui_get_scale()-argument1-s_height/2);
  if new_scroll<0 new_scroll=0;
  
  if (argument3-argument1-s_height)>0 
   new_scroll=new_scroll/(argument3-argument1-s_height)
   else new_scroll=0;
  if new_scroll>1 new_scroll=1;
  
  new_scroll*=(argument4-argument5);
    
  }
 }
 
return round(new_scroll);
