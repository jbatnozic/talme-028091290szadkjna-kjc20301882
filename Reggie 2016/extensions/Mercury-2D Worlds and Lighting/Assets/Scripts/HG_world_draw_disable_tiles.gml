///HG_world_draw_disable_tiles(World)
/*

 See Mercury's Manual, section "Worlds".

*/
var t;

 if argument0=-1
  argument0=global.HG_DEFAULT_WORLD;

//Tilemap:
hg_tilemap_flush(argument0);

t=hg_world_get_attribute(argument0,"tileMap");
ds_map_destroy(t);
  hg_world_del_attribute(argument0,"tileMap");

//Other attributes:
hg_world_del_attribute(argument0,"tilesX");
hg_world_del_attribute(argument0,"tilesY");
hg_world_del_attribute(argument0,"drawLeft");
hg_world_del_attribute(argument0,"drawTop");
hg_world_del_attribute(argument0,"tilePadding");
  
//Reset mode:
hg_world_set_attribute(argument0,"drawMode",0);
