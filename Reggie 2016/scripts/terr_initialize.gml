///terr_initialize()
/*
Initializes Mercury and all the Types.
*/
var t, l;

var dpth = -10;

HG_initialize();

global.terr_reverse_map = ds_map_create();

enum TERRAIN { // These IDs must be consistent between game versions!

  //Basics:
  Empty = 0,
  BlackArea,
  DarkRock,
  BrickWall = 3,
  
  //Earth:
  EarthBlock = 5,
  EarthSlabBottom,
  EarthSlabTop,
  EarthSlopeRight,
  EarthSlopeLeft,
  EarthSlopeTopRight,
  EarthSlopeTopLeft,
  EarthSlopeSmRight,
  EarthSlopeSmLeft,
  EarthSlopeSmTopRight,
  EarthSlopeSmTopLeft,
  EarthSlopeSmElevRight,
  EarthSlopeSmElevLeft,
  EarthSlopeSmElevTopRight,
  EarthSlopeSmElevTopLeft = 19,

  //Counter:
  typeCount
  
  }
  
globalvar terrainType;

terrainType[TERRAIN.typeCount] = 0;

//*** BASICS: ***
t=terr_create_type("Empty", TERRAIN.Empty);
  HG_type_set_shape(t,HG_SHAPE.empty);
  HG_type_set_visual(t,-1,0,0,0,0);
  HG_type_set_tile_n(t,bg_tileset_0,34,0,1,1);
  
t=terr_create_type("BlackArea", TERRAIN.BlackArea);
  HG_type_set_shape(t,HG_SHAPE.full);
  HG_type_set_visual(t,-1,1,dpth,1,c_black);
  HG_type_set_tile_n(t,bg_tileset_default,34,0,1,1);
  
t=terr_create_type("DarkRock", TERRAIN.DarkRock);
  HG_type_set_shape(t,HG_SHAPE.full);
  HG_type_set_visual(t,-1,1,dpth,1,c_black);
  HG_type_set_tile_n(t,bg_tileset_default,34,1,1,1);
  
//*** BUILDINGS: ***
t=terr_create_type("BrickWall", TERRAIN.BrickWall);
  HG_type_set_shape(t,HG_SHAPE.full);
  HG_type_set_visual(t,-1,1,dpth,1,c_black);
  HG_type_set_tile_n(t,bg_tileset_0,34,0,1,1);
  
  l=ds_list_create();
  ds_list_add(l,00,01,02,03,04,05,06,07);
  ds_list_add(l,08,09,10,11,12,13,14,15);  
  HG_type_set_autotiling(t,l);
  
//*** EARTH: ***
t=terr_create_type("EarthBlock", TERRAIN.EarthBlock);
  HG_type_set_shape(t,HG_SHAPE.full);
  HG_type_set_visual(t,-1,1,dpth,1,c_black);
  HG_type_set_tile_n(t,bg_tileset_0,34,16,1,1);
  
  l=ds_list_create();
  ds_list_add(l,21,17,18,27,20,21,30,31);
  ds_list_add(l,21,25,26,27,28,29,30,16);  
  HG_type_set_autotiling(t,l);
  
//Earth (slabs):
t=terr_create_type("EarthSlabBottom", TERRAIN.EarthSlabBottom);
  HG_type_set_shape(t,HG_SHAPE.slabBottom);
  HG_type_set_visual(t,-1,1,dpth,1,c_black);
  HG_type_set_tile_n(t,bg_tileset_0,34,44,1,1);
  
t=terr_create_type("EarthSlabTop", TERRAIN.EarthSlabTop);
  HG_type_set_shape(t,HG_SHAPE.slabTop);
  HG_type_set_visual(t,-1,1,dpth,1,c_black);
  HG_type_set_tile_n(t,bg_tileset_0,34,45,1,1);
  
//Earth (regular slopes):  
t=terr_create_type("EarthSlopeRight", TERRAIN.EarthSlopeRight);
  HG_type_set_shape(t,HG_SHAPE.slopeRight);
  HG_type_set_visual(t,-1,1,dpth,1,c_black);
  HG_type_set_tile_n(t,bg_tileset_0,34,32,1,1);
  
t=terr_create_type("EarthSlopeLeft", TERRAIN.EarthSlopeLeft);
  HG_type_set_shape(t,HG_SHAPE.slopeLeft);
  HG_type_set_visual(t,-1,1,dpth,1,c_black);
  HG_type_set_tile_n(t,bg_tileset_0,34,33,1,1);
  
t=terr_create_type("EarthSlopeTopRight", TERRAIN.EarthSlopeTopRight);
  HG_type_set_shape(t,HG_SHAPE.slopeTopRight);
  HG_type_set_visual(t,-1,1,dpth,1,c_black);
  HG_type_set_tile_n(t,bg_tileset_0,34,34,1,1);
  
t=terr_create_type("EarthSlopeTopLeft", TERRAIN.EarthSlopeTopLeft);
  HG_type_set_shape(t,HG_SHAPE.slopeTopLeft);
  HG_type_set_visual(t,-1,1,dpth,1,c_black);
  HG_type_set_tile_n(t,bg_tileset_0,34,35,1,1);
  
//Earth (small slopes):   
t=terr_create_type("EarthSlopeSmRight", TERRAIN.EarthSlopeSmRight);
  HG_type_set_shape(t,HG_SHAPE.slopeSmRight);
  HG_type_set_visual(t,-1,1,dpth,1,c_black);
  HG_type_set_tile_n(t,bg_tileset_0,34,36,1,1);

t=terr_create_type("EarthSlopeSmLeft", TERRAIN.EarthSlopeSmLeft);
  HG_type_set_shape(t,HG_SHAPE.slopeSmLeft);
  HG_type_set_visual(t,-1,1,dpth,1,c_black);
  HG_type_set_tile_n(t,bg_tileset_0,34,37,1,1);
  
t=terr_create_type("EarthSlopeSmTopRight", TERRAIN.EarthSlopeSmTopRight);
  HG_type_set_shape(t,HG_SHAPE.slopeSmTopRight);
  HG_type_set_visual(t,-1,1,dpth,1,c_black);
  HG_type_set_tile_n(t,bg_tileset_0,34,38,1,1);
  
t=terr_create_type("EarthSlopeSmTopLeft", TERRAIN.EarthSlopeSmTopLeft);
  HG_type_set_shape(t,HG_SHAPE.slopeSmTopLeft);
  HG_type_set_visual(t,-1,1,dpth,1,c_black);
  HG_type_set_tile_n(t,bg_tileset_0,34,39,1,1);
  
//Earth (elevated small slopes):
t=terr_create_type("EarthSlopeSmElevRight", TERRAIN.EarthSlopeSmElevRight);
  HG_type_set_shape(t,HG_SHAPE.slopeSmElevRight);
  HG_type_set_visual(t,-1,1,dpth,1,c_black);
  HG_type_set_tile_n(t,bg_tileset_0,34,40,1,1);
  
t=terr_create_type("EarthSlopeSmElevLeft", TERRAIN.EarthSlopeSmElevLeft);
  HG_type_set_shape(t,HG_SHAPE.slopeSmElevLeft);
  HG_type_set_visual(t,-1,1,dpth,1,c_black);
  HG_type_set_tile_n(t,bg_tileset_0,34,41,1,1);
  
t=terr_create_type("EarthSlopeSmElevTopRight", TERRAIN.EarthSlopeSmElevTopRight);
  HG_type_set_shape(t,HG_SHAPE.slopeSmElevTopRight);
  HG_type_set_visual(t,-1,1,dpth,1,c_black);
  HG_type_set_tile_n(t,bg_tileset_0,34,42,1,1);
  
t=terr_create_type("EarthSlopeSmElevTopLeft", TERRAIN.EarthSlopeSmElevTopLeft);
  HG_type_set_shape(t,HG_SHAPE.slopeSmElevTopLeft);
  HG_type_set_visual(t,-1,1,dpth,1,c_black);
  HG_type_set_tile_n(t,bg_tileset_0,34,43,1,1);
  
  
  
  
  
  
  
  
  
  
