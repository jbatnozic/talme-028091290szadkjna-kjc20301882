///hg_grid_column_has_um(Grid, Column X)
/*

 Underlying HG script.

 Checks if a ds_grid's specified column has an unique minimal value.

*/
var i,m,c;

m=ds_grid_get_max(argument0,argument1,0,argument1,ds_grid_height(argument0)-1);

c=0;
for (i=0; i<ds_grid_height(argument0); i+=1) begin

 if argument0[#argument1,i]=m
  c+=1;

end;

if c=1
 return true;
 
return false;
