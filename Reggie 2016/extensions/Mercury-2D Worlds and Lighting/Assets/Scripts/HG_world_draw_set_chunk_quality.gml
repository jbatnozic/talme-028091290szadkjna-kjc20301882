///HG_world_draw_set_chunk_quality(World, ChunkQuality)
/*

 See Mercury's Manual, section "Worlds".

*/
var;

 if argument0=-1
  argument0=global.HG_DEFAULT_WORLD;

hg_world_set_attribute(argument0,"drawQuality",argument1);
hg_chunkmap_flush(argument0);
