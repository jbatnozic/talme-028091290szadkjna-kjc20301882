///HG_cell_reset_cval(World, X, Y)
/*

 See Mercury's Manual, section "Worlds".

*/
var maxcustv,type,size;

 if argument0=-1
  argument0=global.HG_DEFAULT_WORLD; 

maxcustv=hg_world_get_attribute(argument0,"maxCustV");
type=ds_grid_get(argument0[?"index"],argument1,argument2);
size=ds_list_size(type);

for (i=0; i<maxcustv; i+=1) begin
 
 HG_cell_delete_cval(argument0,argument1,argument2,i);
  
 if (size>HG_TPROP.custv1+i)
  HG_cell_set_cval(argument0,argument1,argument2,i,type[|HG_TPROP.custv1+i]);
 
end;
