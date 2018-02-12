///place_meeting_obj(x, y, obj, precise)
/*
    Checks for collision at a certain place.    

    Argument0:  x to check
    Argument1:  y to check
    Argument2:  object to check for
    Argument3:  whether to check precise or not
    
    returns: true/false.
 */
 
var __bbl,__bbr,__bbt,__bbb;

__bbl=sprite_get_bbox_left(mask_index)-sprite_get_xoffset(mask_index);
__bbr=sprite_get_bbox_right(mask_index)-sprite_get_xoffset(mask_index);
__bbt=sprite_get_bbox_top(mask_index)-sprite_get_yoffset(mask_index);
__bbb=sprite_get_bbox_bottom(mask_index)-sprite_get_yoffset(mask_index);

return collision_rectangle( argument0+__bbl,
                            argument1+__bbt,
                            argument0+__bbr,
                            argument1+__bbb,
                            argument2,argument3,true)<>noone;
