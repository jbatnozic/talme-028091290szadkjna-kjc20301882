///hg_tilemap_generate_region(World, Tilemap, X1, X2, Y1, Y2)
/*

 Underlying HG script.

*/
var i,t,key,tile,cs,ww,wh,grid,cell,at;

cs=hg_world_get_attribute(argument0,"cellSize");
ww=hg_world_get_attribute(argument0,"width");
wh=hg_world_get_attribute(argument0,"height");
at=hg_world_get_attribute(argument0,"autoTiling");
grid=argument0[?"index"];

for (i=max(argument2,0); i<=min(argument3,ww-1); i+=1) begin
 for (t=max(argument4,0); t<=min(argument5,wh-1); t+=1) begin
     
  key="tile_"+string(i)+"_"+string(t);

  hg_tilemap_delete_tile(argument1,i,t); // (Does nothing if tile does not exist)
 
  cell=grid[#i,t];
       
  var bck=cell[|HG_TPROP.tileBck],
      pad=cell[|HG_TPROP.padding],
      left=cell[|HG_TPROP.tileL]+pad,
      top=cell[|HG_TPROP.tileT]+pad,
      width=cell[|HG_TPROP.tileW]-2*pad,
      height=cell[|HG_TPROP.tileH]-2*pad,
      dpth=cell[|HG_TPROP.depth],
      alp=cell[|HG_TPROP.alpha];
      
  if !(bck=-1 or alp=0) {
  
   tile=tile_add(bck,left,top,width,height,i*cs,t*cs,dpth);
   tile_set_alpha(tile,alp);
  
   argument1[?key]=tile;
    
   if (at=1 and cell[|HG_TPROP.atList]<>-1) 
    hg_autotile_update_cell(argument0,i,t);
    
   }
   else {
   
    argument1[?key]=-1;
   
    }
    
 end;
end;
