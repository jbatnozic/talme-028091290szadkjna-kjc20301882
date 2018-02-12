///HG_world_lighting_set_blur(World, RegularBlur, GaussianBlur)
/*

 See Mercury's Manual, page 17.

*/
var;

 if argument0=-1
  argument0=global.HG_DEFAULT_WORLD;
  
hg_world_set_attribute(argument0,"lightBlur",argument1);
hg_world_set_attribute(argument0,"lightGauss",argument2);

hg_light_free_all_surfaces(argument0);
