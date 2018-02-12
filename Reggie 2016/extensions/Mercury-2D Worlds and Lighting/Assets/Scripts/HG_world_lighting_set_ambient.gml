///HG_world_lighting_set_ambient(World, Alpha, Colour)
/*

 See Mercury's Manual, page 17.

*/
var;

 if argument0=-1
  argument0=global.HG_DEFAULT_WORLD;

hg_world_set_attribute(argument0,"lightAmbientAlpha",1-argument1);
hg_world_set_attribute(argument0,"lightAmbientColour",argument2);
