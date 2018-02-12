///hg_world_draw_tiles(World, World X, World Y)
/*

 Underlying HG script.

*/
var sx,sy,cs,dt,dl,tx,ty,pad,tilemap;
  
//GATHER DATA:
cs=hg_world_get_attribute(argument0,"cellSize");
sx=floor(argument1/cs);
sy=floor(argument2/cs);
dl=hg_world_get_attribute(argument0,"drawLeft");
dt=hg_world_get_attribute(argument0,"drawTop");
tx=hg_world_get_attribute(argument0,"tilesX");
ty=hg_world_get_attribute(argument0,"tilesY");
pad=hg_world_get_attribute(argument0,"tilePadding");
tilemap=hg_world_get_attribute(argument0,"tileMap");

//UPDATE & DRAW:
var updateX=false,updateY=false;

if (sx<>dl)
 updateX=true;
 
if (sy<>dt)
 updateY=true;
 
if (sx=dl and sy=dt)
 exit;
 
//X coord changed:
if (updateX=true) {
 
 if abs(sx-dl)>=tx {
  hg_tilemap_flush(argument0);
  hg_tilemap_generate_region(argument0, tilemap, sx-pad, sx+tx-1+pad, dt-pad, dt+ty-1+pad);
  }
  else if (sx>dl) {
   hg_tilemap_delete_region(tilemap, dl-pad, sx-1-pad, dt-pad, dt+ty-1+pad);
   hg_tilemap_generate_region(argument0, tilemap, dl+tx+pad, sx+tx-1+pad, dt-pad, dt+ty-1+pad);
   }
   else if (sx<dl) {
    hg_tilemap_delete_region(tilemap, sx+tx+pad, dl+tx-1+pad, dt-pad, dt+ty-1+pad);
    hg_tilemap_generate_region(argument0, tilemap, sx-pad, dl-1-pad, dt-pad, dt+ty-1+pad);
    }
  
 hg_world_set_attribute(argument0,"drawLeft",sx);
 }
  
//Y coord changed:
if (updateY=true) {
 
  if abs(sy-dt)>=ty {
   hg_tilemap_flush(argument0);
   hg_tilemap_generate_region(argument0, tilemap, sx-pad, sx+tx-1+pad, sy-pad, sy+ty-1+pad);
   }
   else if (sy>dt) {
    hg_tilemap_delete_region(tilemap, sx-pad, sx+tx-1+pad, dt-pad, sy-1-pad);
    hg_tilemap_generate_region(argument0, tilemap, sx-pad, sx+tx-1+pad, dt+ty+pad, sy+ty-1+pad);
    }
    else if (sy<dt) {
     hg_tilemap_delete_region(tilemap, sx-pad, sx+tx-1+pad, sy+ty+pad, dt+ty-1+pad);
     hg_tilemap_generate_region(argument0, tilemap, sx-pad, sx+tx-1+pad, sy-pad, dt-1-pad);
     }
     
 hg_world_set_attribute(argument0,"drawTop",sy);
 }





