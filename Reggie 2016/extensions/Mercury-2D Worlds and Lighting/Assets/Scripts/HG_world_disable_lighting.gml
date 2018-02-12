///HG_world_disable_lighting(World)
/*

 See Mercury's Manual, page 16.

*/
var t;

 if argument0=-1
  argument0=global.HG_DEFAULT_WORLD;
   
//Lightmap:
t=hg_world_get_attribute(argument0,"lightMap");
if surface_exists(t)
 surface_free(t);
  hg_world_del_attribute(argument0,"lightMap");
  
//Shadowcasters:
HG_shadowcaster_destroy_all(argument0);

t=hg_world_get_attribute(argument0,"shadowCasters");
ds_list_destroy(t);
  hg_world_del_attribute(argument0,"shadowCasters");
  
t=hg_world_get_attribute(argument0,"shadowCastersDeact");
ds_list_destroy(t);
  hg_world_del_attribute(argument0,"shadowCastersDeact");

//Lights:
HG_light_destroy_all(argument0,true,true,true,true,true,true);

//Active:
t=hg_world_get_attribute(argument0,"lightListStatic");
ds_list_destroy(t);
  hg_world_del_attribute(argument0,"lightListStatic");
  
t=hg_world_get_attribute(argument0,"lightListDynamic");
ds_list_destroy(t);
  hg_world_del_attribute(argument0,"lightListDynamic");
  
t=hg_world_get_attribute(argument0,"lightListSimple");
ds_list_destroy(t);
  hg_world_del_attribute(argument0,"lightListSimple");
  
t=hg_world_get_attribute(argument0,"lightGridQuick");
ds_grid_destroy(t);
  hg_world_del_attribute(argument0,"lightGridQuick");

//Inactive:
t=hg_world_get_attribute(argument0,"lightListDeactStatic");
ds_list_destroy(t);
  hg_world_del_attribute(argument0,"lightListDeactStatic");

t=hg_world_get_attribute(argument0,"lightListDeactDynamic");
ds_list_destroy(t);
  hg_world_del_attribute(argument0,"lightListDeactDynamic");

t=hg_world_get_attribute(argument0,"lightListDeactSimple");
ds_list_destroy(t);
  hg_world_del_attribute(argument0,"lightListDeactSimple");

//Other attributes:  
hg_world_del_attribute(argument0,"lightQuality");
hg_world_del_attribute(argument0,"lightAmbientAlpha");
hg_world_del_attribute(argument0,"lightAmbientColour");
hg_world_del_attribute(argument0,"lightBlur");
hg_world_del_attribute(argument0,"lightGauss");
hg_world_del_attribute(argument0,"lightTrunc");
hg_world_del_attribute(argument0,"lightSteps");
hg_world_del_attribute(argument0,"lightRadius");
hg_world_del_attribute(argument0,"lightFade");
hg_world_del_attribute(argument0,"lightAlphaTreshold");

//Reset mode:
hg_world_set_attribute(argument0,"lightMode",0);
