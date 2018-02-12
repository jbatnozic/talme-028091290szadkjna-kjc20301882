///HG_world_enable_lighting(World, AmbientAlpha, AmbientColour, Quality, Blur, Gaussian, Trunc, MSRSteps, MSRRadius, MSRFade, MSRAlphaTreshold)
/*

 See Mercury's Manual, page 15.

*/
var ww,wh,dw,dh,lq,lightmap;

 if argument0=-1
  argument0=global.HG_DEFAULT_WORLD;

//Gather data:
 ww=hg_world_get_attribute(argument0,"width");
 wh=hg_world_get_attribute(argument0,"height");

 dw=hg_world_get_attribute(argument0,"drawWidth");
 dh=hg_world_get_attribute(argument0,"drawHeight");
 lq=argument3;

lightmap=hg_create_surface(dw*lq,dh*lq);

//Set attributes:
hg_world_set_attribute(argument0,"lightMode",1);

hg_world_set_attribute(argument0,"lightMap",lightmap);
hg_world_set_attribute(argument0,"lightQuality",lq);
hg_world_set_attribute(argument0,"lightAmbientAlpha",1-argument1);
hg_world_set_attribute(argument0,"lightAmbientColour",argument2);

hg_world_set_attribute(argument0,"lightListStatic",ds_list_create());
hg_world_set_attribute(argument0,"lightListDynamic",ds_list_create());
hg_world_set_attribute(argument0,"lightListSimple",ds_list_create());
hg_world_set_attribute(argument0,"lightGridQuick",ds_grid_create(7,0));

hg_world_set_attribute(argument0,"lightListDeactStatic",ds_list_create());
hg_world_set_attribute(argument0,"lightListDeactDynamic",ds_list_create());
hg_world_set_attribute(argument0,"lightListDeactSimple",ds_list_create());

hg_world_set_attribute(argument0,"lightBlur",argument4);
hg_world_set_attribute(argument0,"lightGauss",argument5);
hg_world_set_attribute(argument0,"lightTrunc",argument6);
hg_world_set_attribute(argument0,"lightSteps",argument7);
hg_world_set_attribute(argument0,"lightRadius",argument8);
hg_world_set_attribute(argument0,"lightFade",argument9);
hg_world_set_attribute(argument0,"lightAlphaTreshold",argument10);

hg_world_set_attribute(argument0,"shadowCasters",ds_list_create());
hg_world_set_attribute(argument0,"shadowCastersDeact",ds_list_create());






