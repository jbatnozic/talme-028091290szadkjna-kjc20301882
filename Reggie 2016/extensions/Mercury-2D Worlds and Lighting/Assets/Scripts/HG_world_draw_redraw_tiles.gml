///HG_world_draw_redraw_tiles(World)
/*

 See Mercury's Manual, section "Worlds".

*/
var dt,dl,tx,ty,pad,tilemap;

 if argument0=-1
  argument0=global.HG_DEFAULT_WORLD;
 
//GATHER DATA:
dl=hg_world_get_attribute(argument0,"drawLeft");
dt=hg_world_get_attribute(argument0,"drawTop");
tx=hg_world_get_attribute(argument0,"tilesX");
ty=hg_world_get_attribute(argument0,"tilesY");
pad=hg_world_get_attribute(argument0,"tilePadding");
tilemap=hg_world_get_attribute(argument0,"tileMap");
 
//REDRAW:
hg_tilemap_generate_region(argument0, tilemap, dl-pad, dl+tx-1+pad, dt-pad, dt+ty-1+pad);
