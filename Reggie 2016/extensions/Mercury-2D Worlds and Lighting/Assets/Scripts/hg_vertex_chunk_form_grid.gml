///hg_vertex_chunk_form_grid(World, Chunk List)
/*

 Underlying HG script.

 Step 3 of vertex chunk building.

*/
var i,t,lq,cw,ch,hcs,sx,sy,xx,yy,dx,dy;
var grid,list;

//GATHER DATA:
 
 lq=hg_world_get_attribute(argument0,"lightQuality");
 hcs=hg_world_get_attribute(argument0,"cellSize")*lq/2;
 cw=hg_world_get_attribute(argument0,"lightChunkWidth");
 ch=hg_world_get_attribute(argument0,"lightChunkHeight");; 

//FORM THE GRID:
grid=ds_grid_create(cw*2+1,ch*2+1);
list=argument1;

ds_grid_clear(grid,"");

sx=cw; //In grid coordinates
sy=ch; //In grid coordinates

for (i=0; i<ds_list_size(list); i+=4) begin

 xx=sx+list[|i+0]/hcs;
 yy=sy+list[|i+1]/hcs;
 
 dx=sx+list[|i+2]/hcs;
 dy=sy+list[|i+3]/hcs;
 
 grid[#xx,yy]+=string(dx)+","+string(dy)+"f";

end;

return grid;





