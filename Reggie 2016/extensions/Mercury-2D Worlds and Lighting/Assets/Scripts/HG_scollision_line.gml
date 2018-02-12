///HG_scollision_line(World, X1, Y1, X2, Y2, Precision)
/*

 See Mercury's Manual, section "Collisions".

*/
var i,t,dir,dis,cs,cg,ww,wh,msin,mcos;
var gx,gy,ogx,ogy,xx,yy,shape;

if argument0=-1
 argument0=global.HG_DEFAULT_WORLD;

cs=hg_world_get_attribute(argument0,"cellSize");
ww=hg_world_get_attribute(argument0,"width")*cs;
wh=hg_world_get_attribute(argument0,"height")*cs;
cg=hg_world_get_attribute(argument0,"colGrid");

argument1=clamp(argument1,0,ww-1);
argument2=clamp(argument2,0,wh-1);
argument3=clamp(argument3,0,ww-1);
argument4=clamp(argument4,0,wh-1);

dir=point_direction(argument1,argument2,argument3,argument4);
 msin=dsin(dir);
 mcos=dcos(dir);
dis=point_distance(argument1,argument2,argument3,argument4);

gx=-1;
gy=-1;

for (i=0; i<dis; i+=argument5) begin
                            
 //*** Inline Collision point (modified):
  
  ogx=gx;
  ogy=gy;
  
  gx=((argument1+i*mcos) div cs);
  gy=((argument2-i*msin) div cs);

  if (gx<>ogx or gy<>ogy)
   shape=cg[#gx,gy];
   
  switch (shape) begin
  
   case HG_SHAPE.empty:
    break;
   
   default:
     return true;
    break;
  
  end; 
   
 //*** End inline;
                       
end;

return false;
