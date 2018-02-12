///HG_shadowcaster_set_position(ShadowCaster, X, Y)
/*

 See Mercury's Manual, page 21.

*/
var world,radius;

world=argument0[|0];
radius=argument0[|4];

hg_world_update_shadows(world,argument0[|1],argument0[|2],false,radius);

argument0[|1]=argument1;
argument0[|2]=argument2;

hg_world_update_shadows(world,argument1,argument2,false,radius);
