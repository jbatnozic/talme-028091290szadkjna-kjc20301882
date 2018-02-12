///HG_world_lighting_enable_chunks(World, Chunk Width, Chunk Height)
/*

 See Mercury's Manual, page 16.

*/
var ww,wh,dw,dh,lq,lightmap;

 if argument0=-1
  argument0=global.HG_DEFAULT_WORLD;

 cs=hg_world_get_attribute(argument0,"cellSize");
 dw=hg_world_get_attribute(argument0,"drawWidth");
 dh=hg_world_get_attribute(argument0,"drawHeight");
 cw=argument1;
 ch=argument2;
 
//Set attributes:
hg_world_set_attribute(argument0,"lightMode",2);
hg_world_set_attribute(argument0,"lightChunkCounter",0);
hg_world_set_attribute(argument0,"lightVertexChunks",ds_map_create());
hg_world_set_attribute(argument0,"lightVertexChunku",ds_list_create());
hg_world_set_attribute(argument0,"lightChunkWidth",cw);
hg_world_set_attribute(argument0,"lightChunkHeight",ch);
