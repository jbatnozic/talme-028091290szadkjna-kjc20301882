///HG_world_vertex_chunk_count(World)
/*

 See Mercury's Manual, section "Utility functions".

*/
var map;

 if argument0=-1
  argument0=global.HG_DEFAULT_WORLD;

map=hg_world_get_attribute(argument0,"lightVertexChunks");

return ds_map_size(map);
