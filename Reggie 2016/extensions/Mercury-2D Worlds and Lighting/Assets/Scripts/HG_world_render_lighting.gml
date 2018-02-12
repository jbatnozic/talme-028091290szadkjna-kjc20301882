///HG_world_render_lighting(World, World X, World Y)
/*

 See Mercury's Manual, page 17.

*/
var i,lq,cs,dw,dh,xx,yy,size,mode,x1,y1,x2,y2;

 if argument0=-1
  argument0=global.HG_DEFAULT_WORLD;

xx=argument1;
yy=argument2;
  
  cs=hg_world_get_attribute(argument0,"cellSize");
  lq=hg_world_get_attribute(argument0,"lightQuality");
mode=hg_world_get_attribute(argument0,"lightMode");

if mode=0 exit;

dw=hg_world_get_attribute(argument0,"drawWidth");
dh=hg_world_get_attribute(argument0,"drawHeight");

x1=xx;
y1=yy;
x2=x1+dw;
y2=y1+dh;

if (global.HG_VERTEX_SCALE<>lq*cs)
or (global.HG_VERTEX_TYPE<>mode-1) {

 if mode=1
  hg_set_vertex_arrays(lq*cs)
  else
   hg_set_vertex_arrays_ext(lq*cs);
   
 }
 
//UPDATE VERTEX CHUNKS (if needed): ------------------------------------------------------------------------%
if mode=2 {

 var chunkmap=hg_world_get_attribute(argument0,"lightVertexChunks"),
     ulist=hg_world_get_attribute(argument0,"lightVertexChunku"),
     list,key;
 
 for (i=0; i<ds_list_size(ulist); i+=1) begin
 
  key="chnk_"+string(ulist[|i])+"_"+string(ulist[|i+1]);
 
  if !ds_map_exists(chunkmap,key) continue;
  
  list=chunkmap[?key];
 
  hg_set_vertex_chunk(argument0,list,ulist[|i],ulist[|i+1]);
 
 end;
 
 ds_list_clear(ulist);

 }
 
//ACTIVATE / DEACTIVATE LIGHTS: ----------------------------------------------------------------------------%
var list,world_list,sec_list,trunc;

trunc=hg_world_get_attribute(argument0,"lightTrunc");

//[A] Dynamic lights:
world_list=hg_world_get_attribute(argument0,"lightListDeactDynamic");
sec_list=hg_world_get_attribute(argument0,"lightListDynamic");
for (i=0; i<ds_list_size(world_list); i+=1) begin

 list=world_list[|i];
 
 if list[|HG_LPROP.turnedoff]=true continue;
 
 var s=sprite_get_width(list[|HG_LPROP.sprite])*list[|HG_LPROP.scale]/2;
 
 if point_in_rectangle(list[|HG_LPROP.xPos],list[|HG_LPROP.yPos],x1-s,y1-s,x2+s,y2+s) {
 
  hg_light_auto_activate(list,sec_list,world_list,lq,i);
  i-=1;
  
  }

end;

//[A] Static lights:
world_list=hg_world_get_attribute(argument0,"lightListDeactStatic");
sec_list=hg_world_get_attribute(argument0,"lightListStatic");
for (i=0; i<ds_list_size(world_list); i+=1) begin

 list=world_list[|i];
 
 if list[|HG_LPROP.turnedoff]=true continue;
 
 var s=sprite_get_width(list[|HG_LPROP.sprite])*list[|HG_LPROP.scale]/2;
 
 if point_in_rectangle(list[|HG_LPROP.xPos],list[|HG_LPROP.yPos],x1-s,y1-s,x2+s,y2+s) {
 
  hg_light_auto_activate(list,sec_list,world_list,lq,i);
  i-=1;
  
  }

end;
  
//[A] Simple lights:
world_list=hg_world_get_attribute(argument0,"lightListDeactSimple");
sec_list=hg_world_get_attribute(argument0,"lightListSimple");
for (i=0; i<ds_list_size(world_list); i+=1) begin

 list=world_list[|i];
 
 if list[|HG_LPROP.turnedoff]=true continue;
 
 var s=sprite_get_width(list[|HG_LPROP.sprite])*list[|HG_LPROP.scale]/2;
 
 if point_in_rectangle(list[|HG_LPROP.xPos],list[|HG_LPROP.yPos],x1-s,y1-s,x2+s,y2+s) {
 
  hg_light_auto_activate_simple(list,sec_list,world_list,i);
  i-=1;
  
  }

end;
  
//[D] Dynamic lights:
world_list=hg_world_get_attribute(argument0,"lightListDynamic");
sec_list=hg_world_get_attribute(argument0,"lightListDeactDynamic");
for (i=0; i<ds_list_size(world_list); i+=1) begin

 list=world_list[|i];
 
 var s=sprite_get_width(list[|HG_LPROP.sprite])*list[|HG_LPROP.scale]/2;
 
 if !point_in_rectangle(list[|HG_LPROP.xPos],list[|HG_LPROP.yPos],x1-s,y1-s,x2+s,y2+s) {
 
  hg_light_auto_deactivate(list,world_list,sec_list,i);
  i-=1;
  
  }

end;

//[D] Static lights:
world_list=hg_world_get_attribute(argument0,"lightListStatic");
sec_list=hg_world_get_attribute(argument0,"lightListDeactStatic");
for (i=0; i<ds_list_size(world_list); i+=1) begin

 list=world_list[|i];
 
 var s=sprite_get_width(list[|HG_LPROP.sprite])*list[|HG_LPROP.scale]/2;
 
 if !point_in_rectangle(list[|HG_LPROP.xPos],list[|HG_LPROP.yPos],x1-s,y1-s,x2+s,y2+s) {
 
  hg_light_auto_deactivate(list,world_list,sec_list,i);
  i-=1;
  
  }

end;

//[D] Simple lights:
world_list=hg_world_get_attribute(argument0,"lightListSimple");
sec_list=hg_world_get_attribute(argument0,"lightListDeactSimple");
for (i=0; i<ds_list_size(world_list); i+=1) begin

 list=world_list[|i];
 
 var s=sprite_get_width(list[|HG_LPROP.sprite])*list[|HG_LPROP.scale]/2;
 
 if !point_in_rectangle(list[|HG_LPROP.xPos],list[|HG_LPROP.yPos],x1-s,y1-s,x2+s,y2+s) {
 
  hg_light_auto_deactivate_simple(list,world_list,sec_list,i);
  i-=1;
  
  }

end;

//RENDER LIGHTS: -------------------------------------------------------------------------------------------%
var steps,radius,fade,alphatresh;

      steps=hg_world_get_attribute(argument0,"lightSteps");
     radius=hg_world_get_attribute(argument0,"lightRadius");
       fade=hg_world_get_attribute(argument0,"lightFade");
 alphatresh=hg_world_get_attribute(argument0,"lightAlphaTreshold");

//Dynamic lights:
world_list=hg_world_get_attribute(argument0,"lightListDynamic");
for (i=0; i<ds_list_size(world_list); i+=1) begin

 list=world_list[|i];
 
 if !surface_exists(list[|HG_LPROP.surf1])
  list[|HG_LPROP.update]=true;
 
 if list[|HG_LPROP.update]=true {
 
  if mode=1
   hg_light_render_dynamic(argument0,list,trunc,steps,radius,fade,alphatresh)
   else if mode=2
    hg_light_render_dynamic_from_chunks(argument0,list,trunc,steps,radius,fade,alphatresh);
 
  list[|HG_LPROP.update]=false;
  }

end;

//Static lights:
world_list=hg_world_get_attribute(argument0,"lightListStatic");
for (i=0; i<ds_list_size(world_list); i+=1) begin

 list=world_list[|i];
 
 if !surface_exists(list[|HG_LPROP.surf1])
  list[|HG_LPROP.update]=true;
 
 if list[|HG_LPROP.update]=true {
 
  if mode=1
   hg_light_render_static(argument0,list,trunc,steps,radius,fade,alphatresh)
   else if mode=2
    hg_light_render_static_from_chunks(argument0,list,trunc,steps,radius,fade,alphatresh);
 
  list[|HG_LPROP.update]=false;
  }

end;

//Simple & Quick lights:
//Simple and Quick lights don't need rendering.

//TRANSFER TO LIGHTMAP: ------------------------------------------------------------------------------------%
var lightmap=hg_world_get_attribute(argument0,"lightMap"),
    blur=hg_world_get_attribute(argument0,"lightBlur"),
    blursize = shader_get_uniform(hg_sha_blur,"size"),
    blurradius = shader_get_uniform(hg_sha_blur,"radius");

if !surface_exists(lightmap) {
 lightmap=hg_create_surface(dw*lq,dh*lq);
 hg_world_set_attribute(argument0,"lightMap",lightmap);
 }
 
if !surface_exists(lightmap)
 exit;
    
surface_set_target(lightmap);

 draw_set_blend_mode(bm_add);
 
 //Clear Ambient:
 hg_clear_ambient(argument0,lightmap);
 
 //ACTIVATE BLUR: (if needed)
 if (blur>0) {
  shader_set(hg_sha_blur);
  shader_set_uniform_f(blurradius,blur*lq);
  }

 //Dynamic lights:
 world_list=hg_world_get_attribute(argument0,"lightListDynamic");
 for (i=0; i<ds_list_size(world_list); i+=1) begin

  list=world_list[|i]; 
  
  if !surface_exists(list[|HG_LPROP.surf1])
   continue;
  
  if (blur>0)
   shader_set_uniform_f(blursize,surface_get_height(list[|HG_LPROP.surf1]),surface_get_width(list[|HG_LPROP.surf1]));   
   
  size=surface_get_width(list[|HG_LPROP.surf1])/2;
  
  draw_surface(list[|HG_LPROP.surf1],(list[|HG_LPROP.xPos]-xx)*lq-size,(list[|HG_LPROP.yPos]-yy)*lq-size);

 end;

 //Static lights:
 world_list=hg_world_get_attribute(argument0,"lightListStatic");
 for (i=0; i<ds_list_size(world_list); i+=1) begin

  list=world_list[|i]; 
  
  if !surface_exists(list[|HG_LPROP.surf1])
   continue;
  
  if (blur>0)
   shader_set_uniform_f(blursize,surface_get_height(list[|HG_LPROP.surf1]),surface_get_width(list[|HG_LPROP.surf1]));   
   
  size=surface_get_width(list[|HG_LPROP.surf1])/2;
  
  draw_surface(list[|HG_LPROP.surf1],(list[|HG_LPROP.xPos]-xx)*lq-size,(list[|HG_LPROP.yPos]-yy)*lq-size);

 end;
   
 //DEACTIVATE BLUR: (if needed)
 if (blur>0)
  shader_reset();
   
 //Simple lights:
 world_list=hg_world_get_attribute(argument0,"lightListSimple");
 for (i=0; i<ds_list_size(world_list); i+=1) begin

  list=world_list[|i];
 
  if (blur>0)
   shader_set_uniform_f(blursize,sprite_get_height(list[|HG_LPROP.sprite]),sprite_get_width(list[|HG_LPROP.sprite]));   
    
  size=sprite_get_width(list[|HG_LPROP.sprite])/2;
  
  draw_sprite_ext(list[|HG_LPROP.sprite], 0, (list[|HG_LPROP.xPos]-xx)*lq, 
                 (list[|HG_LPROP.yPos]-yy)*lq, list[|HG_LPROP.scale]*lq,
                  list[|HG_LPROP.scale]*lq, list[|HG_LPROP.angle], list[|HG_LPROP.colour],
                  list[|HG_LPROP.alpha]);

 end;
   
 //Quick lights:
 var world_grid=hg_world_get_attribute(argument0,"lightGridQuick"),
     g=world_grid;
 
 for (i=0; i<ds_grid_height(world_grid); i+=1) begin
 
  var s=sprite_get_width(g[#2,i])/2;
  
  if !point_in_rectangle(g[#0,i],g[#1,i],x1-s,y1-s,x2+s,y2+s) continue;
  
  draw_sprite_ext(g[#2,i], 0, (g[#0,i]-x1)*lq, (g[#1,i]-y1)*lq, g[#4,i]*lq, g[#4,i]*lq, g[#5,i], g[#3,i], g[#6,i]);
     
 end;
     
 hg_world_set_attribute(argument0,"lightGridQuick",ds_grid_create(ds_grid_width(world_grid),0));
 ds_grid_destroy(world_grid);
 
 draw_set_blend_mode(bm_normal);
 
surface_reset_target();
