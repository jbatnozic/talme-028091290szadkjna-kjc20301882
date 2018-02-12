///HG_shadowcaster_set_colour(ShadowCaster, Colour, Alpha)
/*

 See Mercury's Manual, page 22.

*/
var world,radius;

world=argument0[|0];
radius=argument0[|4];

if argument1<>-1
 argument0[|5]=argument1;
 
if argument2<>-1
 argument0[|6]=argument2;

hg_world_update_shadows(world,argument0[|1],argument0[|2],false,radius);
