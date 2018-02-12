///hg_cast_shadow_from_sc(LightX, LightY, CastX, CastY, ShadowCaster, Quality, Length, Colour, Alpha);
/*

 Underlying HG script.

*/
var i,q,l,a,c,dir,xx,yy,list;
var vbuff=global.HG_V_BUFF,
    vformat=global.HG_V_FORMAT;
    
list=argument4;
q=argument5;
l=argument6;   
a=argument8;
c=argument7;

//Begin drawing:
vertex_begin(vbuff,vformat);
 
 for (i=7; i<ds_list_size(list); i+=2) begin
 
  if is_string(list[|i]) {
   i-=1;
   
   vertex_end(vbuff); 
   vertex_submit(vbuff,pr_trianglestrip,-1);
   
   vertex_begin(vbuff,vformat);
   
   continue;
   }
 
  xx=argument2+list[|i]*q;
  yy=argument3+list[|i+1]*q;
  
  vertex_position(vbuff,xx,yy);
  vertex_colour(vbuff,c,a); 
  
  dir=point_direction(argument0,argument1,xx,yy);
   
  vertex_position(vbuff,xx+dcos(dir)*l,yy-dsin(dir)*l);
  vertex_colour(vbuff,c,1-a);
  
 end;
 
//Finalize:
vertex_end(vbuff); 
vertex_submit(vbuff,pr_trianglestrip,-1); 





