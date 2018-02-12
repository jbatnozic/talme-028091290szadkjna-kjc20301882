///hg_clear_ambient(World, Surface)
/*

 Underlying HG script.

*/
var;

draw_clear(c_black);

draw_set_alpha(hg_world_get_attribute(argument0,"lightAmbientAlpha"));

draw_set_colour(hg_world_get_attribute(argument0,"lightAmbientColour"));

 draw_rectangle(0,0,surface_get_width(argument1),surface_get_height(argument1),false);

draw_set_alpha(1);
