///terr_initialize()
/*
Initializes Mercury and all the Types.
*/
var t,l;

HG_initialize();

//*** DEFAULT: ***
t=HG_type_create("Empty");
  HG_type_set_shape(t,HG_SHAPE.empty);
  HG_type_set_visual(t,-1,0,0,0,0);
  HG_type_set_tile_n(t,bg_tileset_0,34,0,1,1);
  
t=HG_type_create("BlackArea");
  HG_type_set_shape(t,HG_SHAPE.full);
  HG_type_set_visual(t,-1,1,-5,1,c_black);
  HG_type_set_tile_n(t,bg_tileset_default,34,0,1,1);
  
t=HG_type_create("DarkRock");
  HG_type_set_shape(t,HG_SHAPE.full);
  HG_type_set_visual(t,-1,1,-5,1,c_black);
  HG_type_set_tile_n(t,bg_tileset_default,34,1,1,1);
  
//*** BUILDINGS: ***
t=HG_type_create("BrickWall");
  HG_type_set_shape(t,HG_SHAPE.full);
  HG_type_set_visual(t,-1,1,-5,1,c_black);
  HG_type_set_tile_n(t,bg_tileset_0,34,0,1,1);
  
  l=ds_list_create();
  ds_list_add(l,00,01,02,03,04,05,06,07);
  ds_list_add(l,08,09,10,11,12,13,14,15);  
  HG_type_set_autotiling(t,l);
  
//*** EARTH: ***
t=HG_type_create("Earth");
  HG_type_set_shape(t,HG_SHAPE.full);
  HG_type_set_visual(t,-1,1,-5,1,c_black);
  HG_type_set_tile_n(t,bg_tileset_0,34,16,1,1);
  
  l=ds_list_create();
  ds_list_add(l,16,17,18,19,20,21,22,23);
  ds_list_add(l,24,25,26,27,28,29,30,31);  
  HG_type_set_autotiling(t,l);
  
//Earth (slabs):
t=HG_type_create("EarthSlabBottom");
  HG_type_set_shape(t,HG_SHAPE.slabBottom);
  HG_type_set_visual(t,-1,1,-5,1,c_black);
  HG_type_set_tile_n(t,bg_tileset_0,34,44,1,1);
  
t=HG_type_create("EarthSlabTop");
  HG_type_set_shape(t,HG_SHAPE.slabTop);
  HG_type_set_visual(t,-1,1,-5,1,c_black);
  HG_type_set_tile_n(t,bg_tileset_0,34,45,1,1);
  
//Earth (regular slopes):  
t=HG_type_create("EarthSlopeRight");
  HG_type_set_shape(t,HG_SHAPE.slopeRight);
  HG_type_set_visual(t,-1,1,-5,1,c_black);
  HG_type_set_tile_n(t,bg_tileset_0,34,32,1,1);
  
t=HG_type_create("EarthSlopeLeft");
  HG_type_set_shape(t,HG_SHAPE.slopeLeft);
  HG_type_set_visual(t,-1,1,-5,1,c_black);
  HG_type_set_tile_n(t,bg_tileset_0,34,33,1,1);
  
t=HG_type_create("EarthSlopeTopRight");
  HG_type_set_shape(t,HG_SHAPE.slopeTopRight);
  HG_type_set_visual(t,-1,1,-5,1,c_black);
  HG_type_set_tile_n(t,bg_tileset_0,34,34,1,1);
  
t=HG_type_create("EarthSlopeTopLeft");
  HG_type_set_shape(t,HG_SHAPE.slopeTopLeft);
  HG_type_set_visual(t,-1,1,-5,1,c_black);
  HG_type_set_tile_n(t,bg_tileset_0,34,35,1,1);
  
//Earth (small slopes):   
t=HG_type_create("EarthSlopeSmRight");
  HG_type_set_shape(t,HG_SHAPE.slopeSmRight);
  HG_type_set_visual(t,-1,1,-5,1,c_black);
  HG_type_set_tile_n(t,bg_tileset_0,34,36,1,1);

t=HG_type_create("EarthSlopeSmLeft");
  HG_type_set_shape(t,HG_SHAPE.slopeSmLeft);
  HG_type_set_visual(t,-1,1,-5,1,c_black);
  HG_type_set_tile_n(t,bg_tileset_0,34,37,1,1);
  
t=HG_type_create("EarthSlopeSmTopRight");
  HG_type_set_shape(t,HG_SHAPE.slopeSmTopRight);
  HG_type_set_visual(t,-1,1,-5,1,c_black);
  HG_type_set_tile_n(t,bg_tileset_0,34,38,1,1);
  
t=HG_type_create("EarthSlopeSmTopLeft");
  HG_type_set_shape(t,HG_SHAPE.slopeSmTopLeft);
  HG_type_set_visual(t,-1,1,-5,1,c_black);
  HG_type_set_tile_n(t,bg_tileset_0,34,39,1,1);
  
//Earth (elevated small slopes):
t=HG_type_create("EarthSlopeSmElevRight");
  HG_type_set_shape(t,HG_SHAPE.slopeSmElevRight);
  HG_type_set_visual(t,-1,1,-5,1,c_black);
  HG_type_set_tile_n(t,bg_tileset_0,34,40,1,1);
  
t=HG_type_create("EarthSlopeSmElevLeft");
  HG_type_set_shape(t,HG_SHAPE.slopeSmElevLeft);
  HG_type_set_visual(t,-1,1,-5,1,c_black);
  HG_type_set_tile_n(t,bg_tileset_0,34,41,1,1);
  
t=HG_type_create("EarthSlopeSmElevTopRight");
  HG_type_set_shape(t,HG_SHAPE.slopeSmElevTopRight);
  HG_type_set_visual(t,-1,1,-5,1,c_black);
  HG_type_set_tile_n(t,bg_tileset_0,34,42,1,1);
  
t=HG_type_create("EarthSlopeSmElevTopLeft");
  HG_type_set_shape(t,HG_SHAPE.slopeSmElevTopLeft);
  HG_type_set_visual(t,-1,1,-5,1,c_black);
  HG_type_set_tile_n(t,bg_tileset_0,34,43,1,1);
