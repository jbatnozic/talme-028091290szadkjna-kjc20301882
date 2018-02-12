///HG_world_disable_autotiling(World)
/*

 See Mercury's Manual, section "Worlds".

*/
var;

 if argument0=-1
  argument0=global.HG_DEFAULT_WORLD;
  
hg_world_set_attribute(argument0,"autoTiling",0);

hg_tilemap_flush(argument0);
