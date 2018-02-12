///hg_world_draw_chunks(World, World X, World Y)
/*

 Underlying HG script.

*/
var i,t,ww,wh,cpw,cph,cx,cy,cw,ch,cs,sx,sy,dl,dt,dq;
var map,chunkmap,chunkupd,surf,key,cpw,cph;

 argument1=max(0,argument1);
 argument2=max(0,argument2);

 chunkmap=hg_world_get_attribute(argument0,"chunkMap");
 chunkupd=hg_world_get_attribute(argument0,"chunkUpdate");
 
 cs=hg_world_get_attribute(argument0,"cellSize");

 //Needed number of chunks:
 cx=hg_world_get_attribute(argument0,"chunksX");
 cy=hg_world_get_attribute(argument0,"chunksY");
 
 //Chunk width and height:
 cw=hg_world_get_attribute(argument0,"chunkWidth");
 ch=hg_world_get_attribute(argument0,"chunkHeight");
 
 //Chunk pixel width and height:
 cpw=hg_world_get_attribute(argument0,"chunkWidth") *cs;
 cph=hg_world_get_attribute(argument0,"chunkHeight")*cs;
 
 //Starting chunk X and Y:
 sx=(argument1 div cpw) * cw;
 sy=(argument2 div cph) * ch;

//FREE UNNEEDED SURFACES: ----------------------------------------------------------------------------------%
dl=hg_world_get_attribute(argument0,"drawLeft");
dt=hg_world_get_attribute(argument0,"drawTop");
 
var updateX=false,updateY=false;

if (sx<>dl)
 updateX=true;
 
if (sy<>dt)
 updateY=true;
 
//X coord changed:
if (updateX=true) {
 
 if abs(sx-dl)/cw>=cx {
  hg_chunkmap_flush(argument0);
  }
  else if (sx>dl) {
   hg_chunkmap_delete_region(chunkmap, dl, sx-cw, dt, dt+(cy-1)*ch, cw,ch);
   }
   else if (sx<dl) {
    hg_chunkmap_delete_region(chunkmap, sx+cx*cw, dl+(cx-1)*cw, dt, dt+(cy-1)*ch, cw,ch);
    }
  
 hg_world_set_attribute(argument0,"drawLeft",sx);   
 }
  
//Y coord changed:
if (updateY=true) {
 
  if abs(sy-dt)/ch>=cy {
   hg_chunkmap_flush(argument0);
   }
   else if (sy>dt) {
    hg_chunkmap_delete_region(chunkmap, dl, dl+(cx-1)*cw, dt, sy-ch, cw,ch);
    }
    else if (sy<dt) {
     hg_chunkmap_delete_region(chunkmap, dl, dl+(cx-1)*cw, sy+cy*ch, dt+(cy-1)*ch, cw,ch);
     }
     
 hg_world_set_attribute(argument0,"drawTop",sy);
 }
    
//DRAW: ----------------------------------------------------------------------------------------------------%
ww=hg_world_get_attribute(argument0,"width");
wh=hg_world_get_attribute(argument0,"height");
dq=hg_world_get_attribute(argument0,"drawQuality");

for (i=sy; i<min(sy+cy*ch,wh); i+=ch) begin
 for (t=sx; t<min(sx+cx*cw,ww); t+=cw) begin
  
  key="surf_"+string(t)+"_"+string(i);
  
  if ds_map_exists(chunkmap,key)=true { 
   surf=ds_map_find_value(chunkmap,key);
   }
   else surf=-1;
   
  if !surface_exists(surf) {
   surf=hg_world_chunk_render(argument0,t,i);
   chunkmap[?key]=surf;
   }
   else if ds_list_find_index(chunkupd,key)<>-1 {
    hg_world_chunk_render(argument0,t,i,surf);
    }

  if surface_exists(surf)  
   draw_surface_ext(surf,t*cs,i*cs,1/dq,1/dq,0,c_white,1);  
 
 end;
end;

ds_list_clear(chunkupd);
