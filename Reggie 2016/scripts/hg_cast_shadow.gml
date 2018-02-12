///hg_cast_shadow(LightX, LightY, CastX, CastY, VertexArrayX, VertexArrayY, Length, Colour, Alpha);
/*

 Underlying HG script.

*/
var i,l,dir,xx,yy;
var vbuff=global.HG_V_BUFF,
    vformat=global.HG_V_FORMAT;
    
//Begin drawing:
vertex_begin(vbuff,vformat);

 l=argument6;
 
 //Regular points:
 for (i=0; i<array_length_1d(argument4); i+=1) begin
 
  xx=argument2+argument4[i];
  yy=argument3+argument5[i];
  
  vertex_position(vbuff,xx,yy);
  vertex_colour(vbuff,argument7,argument8); 
  
  dir=point_direction(argument0,argument1,xx,yy);
   
  vertex_position(vbuff,xx+dcos(dir)*l,yy-dsin(dir)*l);
  vertex_colour(vbuff,argument7,argument8); 
  
 end;
 
 //Final point:
 xx=argument2+argument4[0];
 yy=argument3+argument5[0];

 vertex_position(vbuff,xx,yy);
 vertex_colour(vbuff,argument7,argument8);   
 
 dir=point_direction(argument0,argument1,xx,yy);
   
 vertex_position(vbuff,xx+dcos(dir)*l,yy-dsin(dir)*l);
 vertex_colour(vbuff,argument7,argument8);
 
//Finalize:
vertex_end(vbuff); 
vertex_submit(vbuff,pr_trianglestrip,-1); 
