///HG_lcollision_ray(X, Y, Direction [DEG], Layer, Precision, Max Distance)
/*

 See Mercury's Manual, section "Collisions".

*/
var i,a,mx,my,sx,sy,prec,xx,yy;

prec=argument4;

sx=argument0;
sy=argument1;

mx=+dcos(argument2);
my=-dsin(argument2);

for (i=0; i<=argument5; i+=prec) begin

 xx=sx+i*mx;
 yy=sy+i*my;

 if (tile_layer_find(argument3,xx,yy)<>-1) {
  a[0]=xx;
  a[1]=yy;
  return a;
  }

end;

a[0]=undefined;
a[1]=undefined;
return a;





