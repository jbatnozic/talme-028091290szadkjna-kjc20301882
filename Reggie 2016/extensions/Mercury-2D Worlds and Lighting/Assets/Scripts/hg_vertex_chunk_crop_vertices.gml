///hg_vertex_chunk_crop_vertices(Chunk List)
/*

 Underlying HG script.

 Step 2 of vertex chunk building.

*/
var i,p,x1,y1,x2,y2,cut;
var list;

list=argument0;

p=0; //Pointer

while (p<ds_list_size(list)) begin

 x1=list[|p+2];
 y1=list[|p+3];
 x2=list[|p+0];
 y2=list[|p+1];
 
 cut=false;
 for (i=p+4; i<ds_list_size(list); i+=4) begin
 
  if list[|i+0]=x1 and
     list[|i+1]=y1 and
     list[|i+2]=x2 and
     list[|i+3]=y2 {     
   cut=true;
   break;     
   }
 
 end;
 
 if (cut=true) {
 
  repeat (4) ds_list_delete(list,i);
  repeat (4) ds_list_delete(list,p);
 
  }
  else {
  
   p+=4;
   
   }

end;





