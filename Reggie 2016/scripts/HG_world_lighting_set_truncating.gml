///HG_world_lighting_set_truncating(World, Trunc)
/*

 See Mercury's Manual, page 17.

*/
var;

 if argument0=-1
  argument0=global.HG_DEFAULT_WORLD;
    
if hg_world_get_attribute(argument0,"lightTrunc")=argument1
 exit;
 
hg_world_set_attribute(argument0,"lightTrunc",argument1);

hg_light_free_all_surfaces(argument0);
