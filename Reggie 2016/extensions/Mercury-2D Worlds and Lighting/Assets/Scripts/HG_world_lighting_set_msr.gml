///HG_world_lighting_set_msr(World, MSRSteps, MSRRadius, MSRFade, MSRAlphaTreshold)
/*

 See Mercury's Manual, page 17.

*/
var;

 if argument0=-1
  argument0=global.HG_DEFAULT_WORLD;
  
hg_world_set_attribute(argument0,"lightSteps",argument1);
hg_world_set_attribute(argument0,"lightRadius",argument2);
hg_world_set_attribute(argument0,"lightFade",argument3);
hg_world_set_attribute(argument0,"lightAlphaTreshold",argument4);

hg_light_free_all_surfaces(argument0);
