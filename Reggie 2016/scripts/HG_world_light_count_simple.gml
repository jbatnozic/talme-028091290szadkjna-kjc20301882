///HG_world_light_count_simple(World, CountDeactivated)
/*

 See Mercury's Manual, section "Utility functions".

*/
var c;

 if argument0=-1
  argument0=global.HG_DEFAULT_WORLD;
  
c=ds_list_size( hg_world_get_attribute(argument0,"lightListSimple") );

if (argument1=true)
 c+=ds_list_size( hg_world_get_attribute(argument0,"lightListDeactSimple") );
 
return c;
