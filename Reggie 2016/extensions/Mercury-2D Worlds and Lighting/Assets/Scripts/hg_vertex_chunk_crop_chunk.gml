///hg_vertex_chunk_crop_chunk(Chunk List)
/*

 Underlying HG script.

 Step 5 of vertex chunk building.
 
*/
var i;
var list;

list=argument0;

i=2;

while (i<ds_list_size(list)-2) begin

 if is_string(list[|i]) {
 
  i+=3;
  continue;
 
  }
  else if is_string(list[|i+2]) {
 
   i+=5;
   continue;
  
   }   
  
 if point_direction(list[|i-2],list[|i-1],list[|i],list[|i+1])=
    point_direction(list[|i],list[|i+1],list[|i+2],list[|i+3]) {
   
  repeat (2) ds_list_delete(list,i);
     
  }
  else i+=2;

end;
