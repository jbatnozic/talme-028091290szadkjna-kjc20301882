///HG_world_draw_enable_tiles(World, Padding)
/*

 See Mercury's Manual, section "Worlds".

*/
var dw,dh,tilemap;

 if argument0=-1
  argument0=global.HG_DEFAULT_WORLD;
  
cs=hg_world_get_attribute(argument0,"cellSize");
dw=hg_world_get_attribute(argument0,"drawWidth");
dh=hg_world_get_attribute(argument0,"drawHeight");
  
tilemap=ds_map_create();
hg_world_set_attribute(argument0,"tileMap",tilemap);

var tilesX=ceil(dw/cs)+1,
    tilesY=ceil(dh/cs)+1;

hg_world_set_attribute(argument0,"tilesX",tilesX);
hg_world_set_attribute(argument0,"tilesY",tilesY);

hg_world_set_attribute(argument0,"tilePadding",argument1);

hg_world_set_attribute(argument0,"drawLeft",0);
hg_world_set_attribute(argument0,"drawTop",0);
  
hg_world_set_attribute(argument0,"drawMode",2);

var p=argument1;
hg_tilemap_generate_region(argument0,tilemap,0-p,tilesX-1+p,0-p,tilesY-1+p);
