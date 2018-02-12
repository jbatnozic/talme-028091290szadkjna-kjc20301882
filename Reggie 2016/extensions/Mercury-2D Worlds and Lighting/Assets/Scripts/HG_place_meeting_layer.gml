///HG_place_meeting_layer(X, Y, Layer, Precision)
/*

 See Mercury's Manual, section "Collisions".

*/
var spr,x1,y1,x2,y2;

spr=mask_index;

if spr=-1
 spr=sprite_index;
 
if spr=-1 return true;

x1=argument0+(sprite_get_bbox_left(spr)-sprite_get_xoffset(spr))*image_xscale;
x2=argument0+(sprite_get_bbox_right(spr)-sprite_get_xoffset(spr))*image_xscale;

y1=argument1+(sprite_get_bbox_top(spr)-sprite_get_yoffset(spr))*image_yscale;
y2=argument1+(sprite_get_bbox_bottom(spr)-sprite_get_yoffset(spr))*image_yscale;

return HG_lcollision_rectangle(x1,y1,x2,y2,argument2,argument3);
