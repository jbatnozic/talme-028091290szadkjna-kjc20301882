///HG_world_lighting_disable_chunks(World)
/*

 See Mercury's Manual, page 17.

*/
var i,map,list,size,key;

 if argument0=-1
  argument0=global.HG_DEFAULT_WORLD;

//Chunk map:
map=hg_world_get_attribute(argument0,"lightVertexChunks");

size=ds_map_size(map);
key=ds_map_find_first(map);

for (i=0; i<size; i+=1) {
    
 ds_list_destroy( map[?key] );
    
 key=ds_map_find_next(map,key);

 }

ds_map_destroy(map);

//Update list:
list=hg_world_get_attribute(argument0,"lightVertexChunku");
ds_list_destroy(list);

//Delete attributes:
hg_world_del_attribute(argument0,"lightChunkCounter");
hg_world_del_attribute(argument0,"lightVertexChunks");
hg_world_del_attribute(argument0,"lightVertexChunku");
hg_world_del_attribute(argument0,"lightChunkWidth");
hg_world_del_attribute(argument0,"lightChunkHeight");

//Reset mode:
hg_world_set_attribute(argument0,"lightMode",1);
