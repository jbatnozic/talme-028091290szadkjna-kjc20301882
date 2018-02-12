///HG_world_clear(World, Type, ChangeCval)
/*

 See Mercury's Manual, section "Worlds".

*/
var i,t,ww,wh;

 if argument0=-1
  argument0=global.HG_DEFAULT_WORLD;

ww=hg_world_get_attribute(argument0,"width");
wh=hg_world_get_attribute(argument0,"height");

for (i=0; i<wh; i+=1) begin
 for (t=0; t<ww; t+=1) begin
 
  HG_cell_set_type(argument0,t,i,argument1,argument2);
 
 end;
end;
