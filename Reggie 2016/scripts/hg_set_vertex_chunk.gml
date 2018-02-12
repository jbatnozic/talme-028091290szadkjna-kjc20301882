///hg_set_vertex_chunk(World, ChunkList, X1, Y1)
/*

 Underlying HG script.

*/
var list,grid;

list=argument1;

hg_vertex_chunk_load_vertices(argument0,list,argument2,argument3);
hg_vertex_chunk_crop_vertices(list);

grid=hg_vertex_chunk_form_grid(argument0,list);

hg_vertex_chunk_finalize(argument0,list,grid);
hg_vertex_chunk_crop_chunk(list);

ds_grid_destroy(grid);
