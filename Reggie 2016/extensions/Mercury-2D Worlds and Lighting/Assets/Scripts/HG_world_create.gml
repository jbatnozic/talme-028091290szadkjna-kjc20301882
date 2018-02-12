///HG_world_create(Width, Height, CellSize, MaxCval, ViewPortW, ViewPortH, ClearWithType, ChangeCval)
/*

 See Mercury's Manual, section "Worlds".

*/
var w,h,map;

w=argument0;
h=argument1;

map=ds_map_create();

//CREATE DATA STRUCTURES:

 //World - Attributes:
 map[?"attri"]=ds_map_create();
 
 //Cell - Type indexes:
 map[?"index"]=ds_grid_create(w,h);
 //Cell - Custom values:
 map[?"custv"]=ds_map_create(); 
 
 //Cell - Animated ones:
 map[?"anims"]=ds_grid_create(w,h); //Frame

//SET ATTRIBUTES:

 hg_world_set_attribute(map,"width",w);            // In Cells
 hg_world_set_attribute(map,"height",h);           // In Cells 
 hg_world_set_attribute(map,"cellSize",argument2); // In Pixels
 
 hg_world_set_attribute(map,"drawMode",0);
 
 hg_world_set_attribute(map,"drawWidth",argument4);  // In Pixels
 hg_world_set_attribute(map,"drawHeight",argument5); // In Pixels
 hg_world_set_attribute(map,"drawPhaseCounter",0);   // In Steps
 
 hg_world_set_attribute(map,"lightMode",0);
 
 hg_world_set_attribute(map,"autoTiling",0);
 
 hg_world_set_attribute(map,"maxCustV",argument3);
 
 hg_world_set_attribute(map,"colGrid",ds_grid_create(w,h));
 
 hg_world_set_attribute(map,"surroundGrid",ds_grid_create(w,h));
 hg_world_update_surround_in_region(map,0,0,-1,-1,false);
 
//FINISH:
HG_world_clear(map,argument6,argument7);

ds_list_add(global.HG_WORLD_LIST,map);

return map;
