///hg_world_chunk_update(World, X, Y)
/*

 Underlying HG script.

*/
var list,key;

list=hg_world_get_attribute(argument0,"chunkUpdate");
key="surf_"+string(argument1)+"_"+string(argument2);

if ds_list_find_index(list,key)=-1
 ds_list_add(list,key);
