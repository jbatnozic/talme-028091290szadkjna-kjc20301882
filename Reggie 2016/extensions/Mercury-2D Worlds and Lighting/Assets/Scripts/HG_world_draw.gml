///HG_world_draw(World, World X, World Y, Animation[Speed])
/*

 See Mercury's Manual, section "Worlds".

*/
var dm,p;

 if argument0=-1
  argument0=global.HG_DEFAULT_WORLD;

dm=hg_world_get_attribute(argument0,"drawMode");

switch (dm) begin

 //Disabled:
 case 0:
   exit;
  break;
  
 //Chunks:
 case 1:
   hg_world_draw_chunks(argument0,argument1,argument2);
  break;
  
 //Tiles
 case 2:
   hg_world_draw_tiles(argument0,argument1,argument2);
  break;
  
 default:
  break;
  
end;

p=hg_world_get_attribute(argument0,"drawPhaseCounter");
  hg_world_set_attribute(argument0,"drawPhaseCounter",p+argument3);

if (argument3<>0)
 hg_world_draw_animations(argument0,argument3,argument1,argument2);
