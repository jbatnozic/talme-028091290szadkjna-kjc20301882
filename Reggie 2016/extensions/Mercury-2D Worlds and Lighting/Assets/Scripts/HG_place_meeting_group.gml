///HG_place_meeting_group(World, Group, X, Y, Precision)
/*

 See Mercury's Manual, section "Collisions".

*/
var spr,x1,y1,x2,y2;

spr=mask_index;

if spr=-1
 spr=sprite_index;
 
if spr=-1 return false;

x1=argument1+(sprite_get_bbox_left(spr)-sprite_get_xoffset(spr))*image_xscale;
x2=argument1+(sprite_get_bbox_right(spr)-sprite_get_xoffset(spr))*image_xscale;

y1=argument2+(sprite_get_bbox_top(spr)-sprite_get_yoffset(spr))*image_yscale;
y2=argument2+(sprite_get_bbox_bottom(spr)-sprite_get_yoffset(spr))*image_yscale;

return HG_gcollision_rectangle(argument0,argument1,x1,y1,x2,y2,argument4);
