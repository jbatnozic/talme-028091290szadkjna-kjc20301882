///HG_world_draw_disable_chunks(World)
/*

 See Mercury's Manual, section "Worlds".

*/
var t;

 if argument0=-1
  argument0=global.HG_DEFAULT_WORLD;
  
//Chunkmap:
hg_chunkmap_flush(argument0);

t=hg_world_get_attribute(argument0,"chunkMap");
ds_map_destroy(t);
  hg_world_del_attribute(argument0,"chunkMap");

//Chunk update list:
t=hg_world_get_attribute(argument0,"chunkUpdate");
ds_list_destroy(t);
  hg_world_del_attribute(argument0,"chunkUpdate");

//Other attributes:
hg_world_del_attribute(argument0,"drawQuality");
hg_world_del_attribute(argument0,"chunkWidth");
hg_world_del_attribute(argument0,"chunkHeight");    
hg_world_del_attribute(argument0,"chunksX");
hg_world_del_attribute(argument0,"chunksY");
hg_world_del_attribute(argument0,"drawLeft");
hg_world_del_attribute(argument0,"drawTop");

//Reset mode:
hg_world_set_attribute(argument0,"drawMode",0);
