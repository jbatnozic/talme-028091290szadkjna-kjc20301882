///HG_world_destroy(World)
/*

 See Mercury's Manual, section "Worlds".

*/
var t;

 if argument0=-1
  argument0=global.HG_DEFAULT_WORLD;
  
//Free lighting:
switch (hg_world_get_attribute(argument0,"lightMode")) begin

 case 1:
   HG_world_disable_lighting(argument0);
  break;
  
 case 2:
   HG_world_lighting_disable_chunks(argument0);
   HG_world_disable_lighting(argument0);
  break;
  
 default:
  break;

end;

//Free other modules:
//[Not needed for now]

//Free draw:
switch (hg_world_get_attribute(argument0,"drawMode")) begin

 case 1:
   HG_world_draw_disable_chunks(argument0);
  break;
  
 case 2:
   HG_world_draw_disable_tiles(argument0);
  break;
  
 default:
  break;

end;

//Surround grid:
t=hg_world_get_attribute(argument0,"surroundGrid");
ds_grid_destroy(t);

t=hg_world_get_attribute(argument0,"colGrid");
ds_grid_destroy(t);

//Core data structures:
ds_map_destroy(  argument0[?"attri"] );
ds_map_destroy(  argument0[?"custv"] );
ds_grid_destroy( argument0[?"index"] );
ds_grid_destroy( argument0[?"anims"] );

//Main list:
ds_list_delete(global.HG_WORLD_LIST, ds_list_find_index(global.HG_WORLD_LIST,argument0) );
ds_map_destroy( argument0 );

