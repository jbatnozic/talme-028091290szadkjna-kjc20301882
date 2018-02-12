///HG_world_draw_enable_chunks(World, ChunkWidth, ChunkHeight, Quality);
/*

 See Mercury's Manual, section "Worlds".

*/
var dw,dh,dq,cw,ch,cs;

 if argument0=-1
  argument0=global.HG_DEFAULT_WORLD;
  
cs=hg_world_get_attribute(argument0,"cellSize");
dw=hg_world_get_attribute(argument0,"drawWidth");
dh=hg_world_get_attribute(argument0,"drawHeight"); 
cw=argument1;
ch=argument2;
dq=argument3;

hg_world_set_attribute(argument0,"chunkMap",ds_map_create());
hg_world_set_attribute(argument0,"chunkUpdate",ds_list_create());

hg_world_set_attribute(argument0,"drawQuality",dq);   // 1, 1/2, 1/4 etc.
hg_world_set_attribute(argument0,"chunkWidth",cw);    // Cells
hg_world_set_attribute(argument0,"chunkHeight",ch);   // Cells

var chunksX = ceil(dw/(cw*cs)) + 1,
    chunksY = ceil(dh/(ch*cs)) + 1;
     
hg_world_set_attribute(argument0,"chunksX",chunksX);
hg_world_set_attribute(argument0,"chunksY",chunksY);
 
hg_world_set_attribute(argument0,"drawLeft",0);
hg_world_set_attribute(argument0,"drawTop",0);

hg_world_set_attribute(argument0,"drawMode",1);
