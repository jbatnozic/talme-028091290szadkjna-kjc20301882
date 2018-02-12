///HG_world_clear_region(World, X1, Y1, X2, Y2, Type, ChangeCval)
/*

 See Mercury's Manual, section "Worlds".

*/
var ww,wh;

 if argument0=-1
  argument0=global.HG_DEFAULT_WORLD;
  
ww=hg_world_get_attribute(argument0,"width");
wh=hg_world_get_attribute(argument0,"height");

for (i=max(argument2,0); i<min(argument4,wh); i+=1) begin
 for (t=max(argument1,0); t<min(argument3,ww); t+=1) begin
 
  HG_cell_set_type(argument0,t,i,argument5,argument6);
 
 end;
end;
