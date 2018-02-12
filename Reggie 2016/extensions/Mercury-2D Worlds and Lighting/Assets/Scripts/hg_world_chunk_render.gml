///hg_world_chunk_render(World, X, Y, [OPT] Target Surface)
/*

 Underlying HG script.

*/
var i,t,dq,ch,cw,cs,ww,wh,grid,surf,list;

 //Needed data:
 cw=hg_world_get_attribute(argument[0],"chunkWidth");
 ch=hg_world_get_attribute(argument[0],"chunkHeight"); 
 cs=hg_world_get_attribute(argument[0],"cellSize");
 dq=hg_world_get_attribute(argument[0],"drawQuality");
 ww=hg_world_get_attribute(argument[0],"width");
 wh=hg_world_get_attribute(argument[0],"height"); 

grid=ds_map_find_value(argument[0],"index");

if argument_count<4
 surf=hg_create_surface(cw*cs*dq,ch*cs*dq)
 else surf=argument[3];
 
if !surface_exists(surf)
 return -1;

surface_set_target(surf);
draw_clear_alpha(0,0);
 
for (i=0; i<ch; i+=1) begin
 for (t=0; t<cw; t+=1) begin
 
  if (argument[1]+t<ww and argument[2]+i<wh) {
   list=grid[#argument[1]+t,argument[2]+i];
   
   if (list[|HG_TPROP.speed]>0 && list[|HG_TPROP.frames]>0) continue;
   
   draw_sprite_ext(list[|HG_TPROP.sprite],0,(t+0.5)*cs*dq,(i+0.5)*cs*dq,dq,dq,0,c_white,sqrt(list[|HG_TPROP.alpha]));
   }
 
 end;
end;

draw_set_alpha(1);
surface_reset_target();

return surf;
