///HG_world_set_viewport(World, ViewPortW, ViewPortH)
/*

 See Mercury's Manual, section "Worlds".

*/
var dm,dw,dh,lm;

 if argument0=-1
  argument0=global.HG_DEFAULT_WORLD;

dw=argument1;
dh=argument2;
  
hg_world_set_attribute(argument0,"drawWidth",dw);
hg_world_set_attribute(argument0,"drawHeight",dh);

//Reset drawing:
cs=hg_world_get_attribute(argument0,"cellSize");
dm=hg_world_get_attribute(argument0,"drawMode");

switch (dm) begin

 case 1:
   var cw=hg_world_get_attribute(argument0,"chunkWidth"),
       ch=hg_world_get_attribute(argument0,"chunkHeight"),
       chunksX = ceil(dw/(cw*cs)) + 1,
       chunksY = ceil(dh/(ch*cs)) + 1;
     
   hg_world_set_attribute(argument0,"chunksX",chunksX);
   hg_world_set_attribute(argument0,"chunksY",chunksY);
   
   hg_chunkmap_flush(argument0);
  break;
  
 case 2:
   var tilemap=hg_world_get_attribute(argument0,"tileMap"),
       //dl=hg_world_set_attribute(argument0,"drawLeft",0),
       //dt=hg_world_set_attribute(argument0,"drawTop",0),
       tilesX=ceil(dw/cs)+1,
       tilesY=ceil(dh/cs)+1;

       hg_world_set_attribute(argument0,"tilesX",tilesX);
       hg_world_set_attribute(argument0,"tilesY",tilesY);
   
   hg_tilemap_flush(argument0);
   
   //hg_tilemap_generate_region(argument0,tilemap,dl,dl+tilesX-1,dt,dt+tilesY-1);
   HG_world_draw_redraw_tiles(argument0);
  break;
  
 default:
  break;

end;

//Reset lighting:
lm=hg_world_get_attribute(argument0,"lightMode");

if (lm>0) {

 var lightmap=hg_world_get_attribute(argument0,"lightMap");
 
 if surface_exists(lightmap)
  surface_free(lightmap);

 }
