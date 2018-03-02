///HG_world_draw_lighting_mask(World, World X, World Y, Mask)
/*

 See Mercury's Manual, page 18.

*/
var blur,lq,xx,yy,ox,oy,lightmap;

 if argument0=-1
  argument0=global.HG_DEFAULT_WORLD;

lq=hg_world_get_attribute(argument0,"lightQuality");
blur=hg_world_get_attribute(argument0,"lightBlur");
lightmap=hg_world_get_attribute(argument0,"lightMap");

xx=argument1;
yy=argument2;

if (is_undefined(lightmap) or !surface_exists(lightmap))
 exit;

//ACTIVATE BLUR: (if needed)
if (blur>0 && false) {

 var blursize=shader_get_uniform(hg_sha_blur,"size"),
     blurradius=shader_get_uniform(hg_sha_blur,"radius");

 shader_set(hg_sha_blur);
 shader_set_uniform_f(blursize,surface_get_height(lightmap),surface_get_width(lightmap));
 shader_set_uniform_f(blurradius,blur*lq);
 
 }

surface_set_target(lightmap);

  draw_set_blend_mode(bm_add);
  
  var xsc = surface_get_width(lightmap)  / surface_get_width(argument3),
      ysc = surface_get_height(lightmap) / surface_get_height(argument3);
 
 //draw_surface_ext(argument3, 0, 0, xsc, ysc, 0, c_white, 1);
 draw_surface(argument3, 0, 0);

surface_reset_target();
 
draw_set_blend_mode_ext(bm_dest_color,bm_zero);

 draw_surface_ext(lightmap,xx,yy,1/lq,1/lq,0,c_white,1);

draw_set_blend_mode(bm_normal);
 
//DEACTIVATE BLUR: (if needed)
if (blur>0 && false)
 shader_reset();

//Free redundant Vertex chunks:
if hg_world_get_attribute(argument0,"lightMode")=2 {

 var c=hg_world_get_attribute(argument0,"lightChunkCounter")+1;

 if c>global.HG_CHUNK_TIMER {
 
  hg_free_vertex_chunks(argument0,xx,yy,global.HG_CHUNK_TOLERANCE);
  hg_world_set_attribute(argument0,"lightChunkCounter",c);
 
  }
  else
   hg_world_set_attribute(argument0,"lightChunkCounter",c);
 
 }
 
 
 
 
 
  
