///hg_vertex_chunk_update(World, X, Y)
/*

 Underlying HG script.

*/
var i,list;

list=hg_world_get_attribute(argument0,"lightVertexChunku");

//Check if it already exists:
for (i=0; i<ds_list_size(list)-1; i+=2) begin

 if list[|i]=argument1 and
    list[|i+1]=argument2 {
    
  exit;
     
  }

end;

ds_list_add(list,argument1,argument2);
