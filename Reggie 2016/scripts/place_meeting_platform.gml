///place_meeting_platform(x,y)
/*
Returns whether the calling instance would collide with any platforms at the
specified position.

Argument0:  x to check
Argument1:  y to check
    
Returns true/false.
*/
 
var __bbl,__bbr,__bbt,__bbb;

__bbl=sprite_get_bbox_left(mask_index)-sprite_get_xoffset(mask_index);
__bbr=sprite_get_bbox_right(mask_index)-sprite_get_xoffset(mask_index);
__bbb=sprite_get_bbox_bottom(mask_index)-sprite_get_yoffset(mask_index);
                            
return collision_line(argument0+__bbl,argument1+__bbb,argument0+__bbr,argument1+__bbb,platformParObj,false,true)<>noone;
