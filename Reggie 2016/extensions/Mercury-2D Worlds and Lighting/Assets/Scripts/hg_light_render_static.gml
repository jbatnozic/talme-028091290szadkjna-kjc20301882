///hg_light_render_static(World, Light, Trunc, MSR Steps, MSR Radius, MSR Fade, MSR Alpha Treshold)
/*

 Underlying HG script.

 Static lights are rendered in exactly the same way as dynamic lights, except
 for the fact that they don't keep surf2 after being rendered (conserves vram).

*/
var;

hg_light_render_dynamic(argument0,argument1,argument2,argument3,argument4,argument5,argument6);

surface_free(argument1[|HG_LPROP.surf2]);
argument1[|HG_LPROP.surf2]=-1;
