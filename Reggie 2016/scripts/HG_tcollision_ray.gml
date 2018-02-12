///HG_tcollision_ray(World, Type, X, Y, Direction [DEG], Precision, Max Distance)
/*

 See Mercury's Manual, section "Collisions".

*/
var i,a,mx,my,sx,sy,prec,cs,ww,wh,xx,yy,grid,list;
var gx,gy,ogx,ogy,tx,ty,shape;

if argument0=-1
 argument0=global.HG_DEFAULT_WORLD;
 
if is_string(argument1)
 argument1=global.HG_TYPE_MAP[?argument1];
 
prec=argument5;

sx=argument2;
sy=argument3;

cs=hg_world_get_attribute(argument0,"cellSize");
ww=hg_world_get_attribute(argument0,"width")*cs-1;
wh=hg_world_get_attribute(argument0,"height")*cs-1;

grid=ds_map_find_value(argument0,"index");

mx=+dcos(argument4);
my=-dsin(argument4);

gx=-1;
gy=-1;

for (i=0; i<=argument6; i+=prec) begin

 xx=sx+i*mx;
 yy=sy+i*my;

 if point_in_rectangle(xx,yy,0,0,ww,wh) {
  
  //*** Inline Collision point (modified):
  
  ogx=gx;
  ogy=gy;
  
  gx=(xx div cs);
  gy=(yy div cs);

  if (gx<>ogx or gy<>ogy) {
   list=grid[#gx,gy];
   shape=list[|HG_TPROP.shape];
   }
   
  if (list<>argument1) continue;
   
  switch (shape) begin
  
   case HG_SHAPE.empty:
    break;
   
   case HG_SHAPE.full:
     a[0]=xx;
     a[1]=yy;
     return a;
    break;
   
   default:
     tx=(xx mod cs);
     ty=(yy mod cs);
     if (hg_point_in_shape(tx,ty,shape,cs)=true) {
      a[0]=xx;
      a[1]=yy;
      return a;
      }
    break;
  
  end; 
   
  //*** End inline;
  
  }

end;

a[0]=undefined;
a[1]=undefined;
return a;
