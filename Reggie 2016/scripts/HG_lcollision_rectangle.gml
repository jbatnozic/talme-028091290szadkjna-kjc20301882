///HG_lcollision_rectangle(X1, Y1, X2, Y2, Layer, Precision)
/*

 See Mercury's Manual, section "Collisions".
 
*/
var i,t,p,w,h;

if (argument3<argument1) {

 p=argument1;
 argument1=argument3;
 argument3=p;

 }
 
if (argument4<argument2) {

 p=argument2;
 argument2=argument4;
 argument4=p;

 }
 
w=argument3-argument1;
h=argument4-argument2;
p=argument5;

for (t=0; t<(h+p)/2; t+=p) begin
 for (i=0; i<(w+p)/2; i+=p) begin

  // 1.   
  if (tile_layer_find(argument4,argument0+i,argument1+t)<>-1)
   return true;

  // 2.  
  if (tile_layer_find(argument4,argument0+w-i,argument1+h-t)<>-1)
   return true;
  
  // 3.  
  if (tile_layer_find(argument4,argument0+w-i,argument1+t)<>-1)
   return true;
  
  // 4.  
  if (tile_layer_find(argument4,argument0+i,argument1+h-t)<>-1)
   return true;
  
 end;
end;

return false;
