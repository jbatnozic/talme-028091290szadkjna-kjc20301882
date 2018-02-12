///HG_lcollision_line(X1, Y1, X2, Y2, Layer, Precision)
/*

 See Mercury's Manual, section "Collisions".

*/
var i,dir,dis,msin,mcos;

dir=point_direction(argument0,argument1,argument2,argument3);
 msin=dsin(dir);
 mcos=dcos(dir);
dis=point_distance(argument0,argument1,argument2,argument3);

for (i=0; i<dis; i+=argument5) begin
                            
 if (tile_layer_find(argument4,
                     argument0+i*mcos,
                     argument1-i*msin)<>-1)
  return true;
                       
end;

if (tile_layer_find(argument4,argument2,argument3)<>-1)
 return true;

return false;
