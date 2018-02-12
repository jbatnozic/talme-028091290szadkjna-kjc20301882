///hg_light_render_dynamic_from_chunks(World, Light, Trunc, MSR Steps, MSR Radius, MSR Fade, MSR Alpha Treshold)
/*

 Underlying HG script.

*/
var i,t,size,lq,cs,xx,yy,radius,scale,ww,wh,blur;
var list,grid,surf1,surf2;

//GATHER DATA:
 
 //World:
 lq=hg_world_get_attribute(argument0,"lightQuality");
 cs=hg_world_get_attribute(argument0,"cellSize");
 ww=hg_world_get_attribute(argument0,"width");
 wh=hg_world_get_attribute(argument0,"height");

 //Light:
 list=argument1;
 
 scale=list[|HG_LPROP.scale]; 
 size=sprite_get_width(list[|HG_LPROP.sprite])*scale/2;
 radius=ceil(size/cs-argument2*scale);
 size*=lq;
 
 xx=list[|HG_LPROP.xPos];
 yy=list[|HG_LPROP.yPos];
 
 surf1=list[|HG_LPROP.surf1];
 surf2=list[|HG_LPROP.surf2];
 
 //Check if surfaces exist:
 if !surface_exists(surf1) { 
  surf1=hg_create_surface(size*2,size*2);
  list[|HG_LPROP.surf1]=surf1;
  }
 if !surface_exists(surf2) {
  surf2=hg_create_surface(size*2,size*2);
  list[|HG_LPROP.surf2]=surf2;
  }
  
 if (!surface_exists(surf1) or !surface_exists(surf2))
  exit;
 
//RENDER SHADOWS to surf1:
surface_set_target(surf1);

 draw_clear_alpha(c_white,0);

 //This blend mode will keep the strongest shadows on top:
 draw_set_blend_mode_ext(bm_src_alpha_sat,bm_src_color);
 
 //FROM CELLS:
 var cw=hg_world_get_attribute(argument0,"lightChunkWidth"),
     ch=hg_world_get_attribute(argument0,"lightChunkHeight"),
     sx=hg_chunk_pos(HG_coord_to_grid(xx,cs)-radius,cw),
     sy=hg_chunk_pos(HG_coord_to_grid(yy,cs)-radius,ch),
     ex=hg_chunk_pos(HG_coord_to_grid(xx,cs)+radius,cw),
     ey=hg_chunk_pos(HG_coord_to_grid(yy,cs)+radius,ch),
     grid=argument0[?"index"],
     chunk_x,chunk_y,
     chunkmap,chunk,key;
      
 chunkmap=hg_world_get_attribute(argument0,"lightVertexChunks");

 for (t=max(sy,0); t<=min(ey,wh); t+=ch) begin
  for (i=max(sx,0); i<=min(ex,ww); i+=cw) begin
     
   chunk_x=i;
   chunk_y=t;
   key="chnk_"+string(chunk_x)+"_"+string(chunk_y);
   
   if ds_map_exists(chunkmap,key) {
    chunk=chunkmap[?key];
    }
    else {
     chunk=ds_list_create();
     hg_set_vertex_chunk(argument0,chunk,chunk_x,chunk_y);
     chunkmap[?key]=chunk;
     }
   
   //Check chunk properties:
   if ds_list_size(chunk)=0
    continue;
   
   //Cast shadow:
   hg_cast_shadow_from_chunk(size, size, size+((chunk_x+cw*0.5)*cs-xx)*lq, size+((chunk_y+ch*0.5)*cs-yy)*lq,chunk,10000);
  
  end;
 end;

 //FROM SHADOW CASTERS:
 var sclist,sc,mult;
 
 sclist=hg_world_get_attribute(argument0,"shadowCasters");
 mult=sqrt(2)/lq;
 
 for (i=0; i<ds_list_size(sclist); i+=1) begin

  sc=sclist[|i];
  
  if point_distance(sc[|1],sc[|2],xx,yy)>=(size*mult+sc[|4]) continue;
 
  hg_cast_shadow_from_sc(size, size, size+(sc[|1]-xx)*lq, size+(sc[|2]-yy)*lq, sclist[|i],lq,10000,sc[|5],sc[|6]);
 
 end;
 
draw_set_blend_mode(bm_normal);

surface_reset_target();

//GET BLUR:
blur=hg_world_get_attribute(argument0,"lightGauss")*lq;

//DRAW WITH MSR to surf2:
surface_set_target(surf2);
 
 draw_clear_alpha(c_black,0);

 var a,r,m=argument3;
 
 argument4/=(1+sign(blur));
 
 for (i=0; i<m; i+=1) begin
 
  a=power(argument5,m-1-i);
  
  if a<argument6 continue;
  
  r=argument4*i;
  draw_surface_ext(surf1,-size*r,-size*r,1+r,1+r,0,c_white,a);
 
 end;
  
surface_reset_target();

//PREPARE surf1:
if (blur>0) {
 
 //Horizontal blur:
 var res_h=shader_get_uniform(hg_sha_blur_hor,"resolution"),
     res_v=shader_get_uniform(hg_sha_blur_ver,"resolution"),
     int_h=shader_get_uniform(hg_sha_blur_hor,"intensity"),
     int_v=shader_get_uniform(hg_sha_blur_ver,"intensity");
 
 surface_set_target(surf1);

  draw_clear_alpha(c_black,0);
 
  shader_set(hg_sha_blur_hor);
  shader_set_uniform_f(res_h,surface_get_width(surf2),surface_get_height(surf2));
  shader_set_uniform_f(int_h,blur);
 
   draw_surface(surf2,0,0);
  
  shader_reset();

 surface_reset_target();   
    
 }
 else {
 
  surface_set_target(surf1);
 
   //Light sprite:
   draw_sprite_ext(list[|HG_LPROP.sprite],0,size,size,scale*lq,scale*lq,list[|HG_LPROP.angle],list[|HG_LPROP.colour],1);
     //Apply alpha: 
     draw_set_colour(c_black);
     draw_set_alpha(1-list[|HG_LPROP.alpha]);
     draw_rectangle(0,0,size*2,size*2,false);
     draw_set_alpha(1);
   
   //This blend mode will blend light and shadows nicely:
   draw_set_blend_mode_ext(bm_dest_color,bm_inv_src_alpha);
   
    draw_surface(surf2,0,0);
   
   draw_set_blend_mode(bm_normal);
  
  surface_reset_target();
  
  exit;
  
  }

//******************************************//
// If blur is off, nothing further happens. //
//******************************************//
    
//FINALIZE:
surface_set_target(surf2); 

 //Light sprite:
 draw_sprite_ext(list[|HG_LPROP.sprite],0,size,size,scale*lq,scale*lq,list[|HG_LPROP.angle],list[|HG_LPROP.colour],1);
   //Apply alpha: 
   draw_set_colour(c_black);
   draw_set_alpha(1-list[|HG_LPROP.alpha]);
   draw_rectangle(0,0,size*2,size*2,false);
   draw_set_alpha(1);
 
 shader_set(hg_sha_blur_ver);
 shader_set_uniform_f(res_v,surface_get_width(surf1),surface_get_height(surf1));
 shader_set_uniform_f(int_v,blur);
 
  //This blend mode will blend light and shadows nicely:
  draw_set_blend_mode_ext(bm_dest_color,bm_inv_src_alpha);
 
   draw_surface_ext(surf1,-size*r,-size*r,1+r,1+r,0,c_white,a);

  draw_set_blend_mode(bm_normal);
  
 shader_reset();
 
surface_reset_target();

//Swap surfaces:
list[|HG_LPROP.surf1]=surf2;
list[|HG_LPROP.surf2]=surf1;





