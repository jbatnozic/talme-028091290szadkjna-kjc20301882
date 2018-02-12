///hg_vertex_chunk_load_vertices(World, ChunkList, X1, Y1)
/*

 Underlying HG script.

 Step 1 of vertex chunk building.

*/
var i,t,u,j,ww,whsx,sy,cs,lq,cw,ex,ey,ch,a,point_x,point_y,hcpw,hcph,al;
var world_grid,cell,list;
  
//GATHER DATA:

 list=argument1;
 sx=argument2;
 sy=argument3;
 ww=hg_world_get_attribute(argument0,"width");
 wh=hg_world_get_attribute(argument0,"height");
 lq=hg_world_get_attribute(argument0,"lightQuality");
 cs=hg_world_get_attribute(argument0,"cellSize")*lq;
 cw=hg_world_get_attribute(argument0,"lightChunkWidth");
 ch=hg_world_get_attribute(argument0,"lightChunkHeight");
 hcpw=cs*cw/2;
 hcph=cs*ch/2; 

//ADD VERTICES:

ds_list_clear(list);

world_grid=argument0[?"index"];

ex=min(sx+cw,ww)-1;
ey=min(sy+ch,wh)-1;

for (t=sy; t<=ey; t+=1) begin
 for (i=sx; i<=ex; i+=1) begin
 
  //Check cell properties:
  cell=world_grid[#i,t];
   
  if cell[|HG_TPROP.shape]=HG_SHAPE.empty or
     cell[|HG_TPROP.shadowStr]=0
   continue;
   
  //Fetch vertices:
  a=hg_fetch_vertex_array(cell[|HG_TPROP.shape]);
 
  point_x=a[0];
  point_y=a[1];
 
  //Add vertices:
  al=array_length_1d(point_x);
  for (u=0; u<al; u+=1) begin
  
   j=(u+1) mod al;
  
   ds_list_add(list,(i-sx+0.5)*cs+point_x[u]-hcpw,(t-sy+0.5)*cs+point_y[u]-hcph);
   ds_list_add(list,(i-sx+0.5)*cs+point_x[j]-hcpw,(t-sy+0.5)*cs+point_y[j]-hcph);
  
  end;

  
 end;
end;





