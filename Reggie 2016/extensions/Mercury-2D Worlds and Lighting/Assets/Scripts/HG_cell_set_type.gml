///HG_cell_set_type(World, X, Y, Type, ChangeCval)
/*

 See Mercury's Manual, section "Worlds".

*/
var i,cw,ch,grid,list,oldtype;

 if argument0=-1
  argument0=global.HG_DEFAULT_WORLD;

list=global.HG_TYPE_MAP[?argument3];

//INDEX:
grid=argument0[?"index"];

oldtype=grid[#argument1,argument2];
grid[#argument1,argument2]=list;

//COLLISION GRID:
var colgrid;

colgrid=hg_world_get_attribute(argument0,"colGrid");

colgrid[#argument1,argument2]=list[|HG_TPROP.shape];

//CUSTOM VALUES:
if argument4=true {
 
 var maxcustv,size;
 
 maxcustv=hg_world_get_attribute(argument0,"maxCustV");
 size=ds_list_size(list);

 for (i=0; i<maxcustv; i+=1) begin
 
  HG_cell_delete_cval(argument0,argument1,argument2,i);
  
  if (size>HG_TPROP.custv1+i)
   HG_cell_set_cval(argument0,argument1,argument2,i,list[|HG_TPROP.custv1+i]);
 
 end;

 }

//DRAWING DATA:
//Update chunk:
if hg_world_get_attribute(argument0,"drawMode")=1 {

 if list[|HG_TPROP.sprite]<>oldtype[|HG_TPROP.sprite] {

  cw=hg_world_get_attribute(argument0,"chunkWidth");
  ch=hg_world_get_attribute(argument0,"chunkHeight");

  hg_world_chunk_update(argument0, hg_chunk_pos(argument1,cw), hg_chunk_pos(argument2,ch));
 
  }
  
 }
 //Update tile:
 else if hg_world_get_attribute(argument0,"drawMode")=2 {
 
  var tilemap=hg_world_get_attribute(argument0,"tileMap"),
      key="tile_"+string(argument1)+"_"+string(argument2),
      tile;
       
  if (ds_map_exists(tilemap,key)=true) {
  
   tile=ds_map_find_value(tilemap,key);
    
   if tile_exists(tile) 
    tile_delete(tile);
    
   ds_map_delete(tilemap,key);
   
   hg_tilemap_generate_region(argument0,tilemap,argument1,argument1,argument2,argument2);
   
   }
 
  }
  
//Animation:
var animgrid;

animgrid=argument0[?"anims"];

if (list[|HG_TPROP.speed]>0 and list[|HG_TPROP.frames]>1) {
  
  if list[|HG_TPROP.phased]=true
   animgrid[#argument1,argument2]=
   ((hg_world_get_attribute(argument0,"drawPhaseCounter")*list[|HG_TPROP.speed]) mod list[|HG_TPROP.frames])
   else    
    animgrid[#argument1,argument2]=0;
  
 }
 else
  animgrid[#argument1,argument2]=-1;
 
//SURROUNDINGS:
hg_world_update_surround_in_region(argument0,argument1-1,argument2-1,argument1+1,argument2+1,true);

//LIGHTING & AUTOTILING DATA:
var lm,at;

lm=hg_world_get_attribute(argument0,"lightMode");
at=hg_world_get_attribute(argument0,"autoTiling");
 
//Autotiling:
if (at=1) {

 if (list[|HG_TPROP.shape]<>oldtype[|HG_TPROP.shape])
  hg_autotile_update_region(argument0,argument1-1,argument2-1,argument1+1,argument2+1)
  else
   hg_autotile_update_cell(argument0,argument1,argument2);

 }
 
//Lighting:
if (lm>0) {
 
    //Completely same:
 if (list[|HG_TPROP.shape]=oldtype[|HG_TPROP.shape] and
     list[|HG_TPROP.shadowStr]=oldtype[|HG_TPROP.shadowStr]) or
    //Both empty: 
    (list[|HG_TPROP.shape]=HG_SHAPE.empty and 
     oldtype[|HG_TPROP.shape]=HG_SHAPE.empty) or
    //Both cast no shadow: 
    (list[|HG_TPROP.shadowStr]=0 and
     oldtype[|HG_TPROP.shadowStr]=0)
  exit;
  
 //Update vertex chunks:
 if hg_world_get_attribute(argument0,"lightMode")=2 {
   
  cw=hg_world_get_attribute(argument0,"lightChunkWidth");
  ch=hg_world_get_attribute(argument0,"lightChunkHeight");
  
  var xx,yy;
  
  xx=hg_chunk_pos(argument1,cw);
  yy=hg_chunk_pos(argument2,ch);
    
  hg_vertex_chunk_update(argument0,xx,yy);
 
  }
  
 //Update nearby shadows:
 hg_world_update_shadows(argument0,argument1,argument2,true,0);

 }
 
 
 
 
 
