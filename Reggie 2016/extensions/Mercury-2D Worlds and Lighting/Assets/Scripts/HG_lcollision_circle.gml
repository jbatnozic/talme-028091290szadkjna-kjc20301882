///HG_lcollision_circle(X, Y, Radius, Layer, Precision)
/*

 See Mercury's Manual, section "Collisions".

*/
var i,t,sx,sy,prec,xx,yy;
 
prec=argument4;

sx=argument0;
sy=argument1;

for (t=argument3; t>0; t-=prec) begin

 var tetha=180*prec/(t*pi);

 for (i=0; i<180; i+=tetha) begin
  
  xx=sx+t*dcos(i);
  yy=sy-t*dsin(i);
  
  if (tile_layer_find(argument3,xx,yy)<>-1)
   return true;
   
  xx=-xx+2*sx;
  yy=-yy+2*sy;
   
  if (tile_layer_find(argument3,xx,yy)<>-1)
   return true;

 end;
 
end;

return false;
