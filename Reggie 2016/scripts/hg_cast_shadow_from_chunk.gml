///hg_cast_shadow_from_chunk(LightX, LightY, CastX, CastY, ChunkList, Length);
/*

 Underlying HG script.

*/
var i,l,a,dir,xx,yy,list;
var vbuff=global.HG_V_BUFF,
    vformat=global.HG_V_FORMAT;
    
list=argument4;
l=argument5;   
a=1;

//Begin drawing:
vertex_begin(vbuff,vformat);
 
 for (i=0; i<ds_list_size(list); i+=2) begin
 
  if is_string(list[|i]) {
   i-=1;
   
   vertex_end(vbuff); 
   vertex_submit(vbuff,pr_trianglestrip,-1);
   
   vertex_begin(vbuff,vformat);
   
   continue;
   }
 
  xx=argument2+list[|i];
  yy=argument3+list[|i+1];
  
  vertex_position(vbuff,xx,yy);
  vertex_colour(vbuff,c_black,a); 
  
  dir=point_direction(argument0,argument1,xx,yy);
   
  vertex_position(vbuff,xx+dcos(dir)*l,yy-dsin(dir)*l);
  vertex_colour(vbuff,c_black,a);
  
 end;
 
//Finalize:
vertex_end(vbuff); 
vertex_submit(vbuff,pr_trianglestrip,-1); 





