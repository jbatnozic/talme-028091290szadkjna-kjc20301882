///HG_world_lighting_set_quality(World, Quality)
/*

 See Mercury's Manual, page 17.

*/
var i,lightmap,map,size,key;

 if argument0=-1
  argument0=global.HG_DEFAULT_WORLD;
  
if hg_world_get_attribute(argument0,"lightQuality")=argument1
 exit;
 
hg_world_set_attribute(argument0,"lightQuality",argument1);

//Lightmap:
lightmap=hg_world_get_attribute(argument0,"lightMap");
if surface_exists(lightmap)
 surface_free(lightmap);
 
//Vertex chunks:
if hg_world_get_attribute(argument0,"lightMode")=2 {

 map=hg_world_get_attribute(argument0,"lightVertexChunks");

 size=ds_map_size(map);
 key=ds_map_find_first(map);

 for (i=0; i<size; i+=1) {
    
  ds_list_destroy( map[?key] );
    
  key=ds_map_find_next(map,key);

  }
  
 ds_map_clear(map);

 }
 
//Light surfaces:
hg_light_free_all_surfaces(argument0);
