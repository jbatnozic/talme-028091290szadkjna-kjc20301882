///HG_world_get_colgrid(World)
/*

 See Mercury's Manual, section "Worlds".

*/
var;

 if argument0=-1
  argument0=global.HG_DEFAULT_WORLD;
  
return hg_world_get_attribute(argument0,"colGrid");
