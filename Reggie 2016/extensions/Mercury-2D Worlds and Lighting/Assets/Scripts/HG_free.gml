///HG_free();
/*

 See Mercury's Manual, sections "Initialization" and "Freeing memory".

*/
var i,size,key,next,world,list;

//Lighting data:
vertex_format_delete(global.HG_V_FORMAT);
vertex_delete_buffer(global.HG_V_BUFF);

//Types:
size=ds_map_size(global.HG_TYPE_MAP);
key=ds_map_find_first(global.HG_TYPE_MAP);

for (i=0; i<size; i+=1) {
    
 next=ds_map_find_next(global.HG_TYPE_MAP,key);

 HG_type_destroy( global.HG_TYPE_MAP[?key], true);
    
 key=next;

 }
 
ds_map_destroy(global.HG_TYPE_MAP);

ds_map_destroy(global.HG_GCVAL_MAP);

//Worlds:
while (ds_list_size(global.HG_WORLD_LIST)>0) begin

 world=global.HG_WORLD_LIST[|0];
 
 HG_world_destroy(world);

end;

ds_list_destroy(global.HG_WORLD_LIST);

//Collision groups:
size=ds_map_size(global.HG_COLGROUP_MAP);
key=ds_map_find_first(global.HG_COLGROUP_MAP);

for (i=0; i<size; i+=1) {
    
 HG_colgroup_destroy( global.HG_COLGROUP_MAP[?key] );
    
 key=ds_map_find_next(global.HG_COLGROUP_MAP,key);

 }

ds_map_destroy(global.HG_COLGROUP_MAP);

//Vertex arrays:
hg_del_vertex_arrays();
