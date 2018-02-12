///hg_world_draw_animations(World, Speed, WorldX, WorldY)
/*

 Underlying HG script.

*/
var i,t,spd,cs,ww,wh,dm,dw,dh,sx,sy,pc,f,frames;
var type,typegrid,animgrid;
  
typegrid=argument0[?"index"];
animgrid=argument0[?"anims"];
cs=hg_world_get_attribute(argument0,"cellSize");
ww=hg_world_get_attribute(argument0,"width");
wh=hg_world_get_attribute(argument0,"height");
dm=hg_world_get_attribute(argument0,"drawMode");
pc=hg_world_get_attribute(argument0,"drawPhaseCounter");
dw=hg_world_get_attribute(argument0,"drawWidth");
dh=hg_world_get_attribute(argument0,"drawHeight");
spd=argument1;
sx=HG_coord_to_grid(argument2,cs);
sy=HG_coord_to_grid(argument3,cs);

for (t=sy; t<min(sy+ceil(dh/cs)+1,wh); t+=1) begin
 for (i=sx; i<min(sx+ceil(dw/cs)+1,ww); i+=1) begin

  f=animgrid[#i,t];
 
  if (f=-1) continue;
  
  type=typegrid[#i,t];
  frames=type[|HG_TPROP.frames];
 
  if (type[|HG_TPROP.phased]=true)
   animgrid[#i,t]=((pc*type[|HG_TPROP.speed]) mod frames)
   else 
    animgrid[#i,t]=((f+type[|HG_TPROP.speed]*spd) mod frames);
    
  if animgrid[#i,t]<0
   animgrid[#i,t]+=frames;
    
  switch (dm) begin

   //Disabled:
   case 0:
     exit;
    break;
  
   //Chunks:
   case 1:
     //if point_in_rectangle(i*cs,t*cs,argument2-cs,argument3-cs,argument2+dw,argument3+dh)
      draw_sprite_ext(type[|HG_TPROP.sprite],floor(animgrid[#i,t]),(i+0.5)*cs,(t+0.5)*cs,1,1,0,c_white,type[|HG_TPROP.alpha]);
    break;
  
   //Tiles
   case 2:
     if (floor(animgrid[#i,t])<>floor(f)) {
    
      hg_world_tile_set_frame(argument0,i,t,type,floor(animgrid[#i,t]),cs);
     
      }
    break;
  
   default:
    break;
  
  end;

 end;
end;
