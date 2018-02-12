///HG_collision_rectangle(World, X1, Y1, X2, Y2, Precision)
/*

 See Mercury's Manual, section "Collisions".
 
*/
var i,t,p,w,h,cs,cg,ww,wh;
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

gx=-1;
gy=-1;
for (t=0; t<(h+p)/2; t+=p) begin
 for (i=0; i<(w+p)/2; i+=p) begin

  // 1.   
  //*** Inline Collision point (modified):
  
  ogx=gx;
  ogy=gy;
  
  gx=((argument1+i) div cs);
  gy=((argument2+t) div cs);

  if (gx<>ogx or gy<>ogy)
   shape=cg[#gx,gy];
   
  switch (shape) begin
  
   case HG_SHAPE.empty:
    break;
   
   case HG_SHAPE.full:
     return true;
    break;
   
   default:
     xx=((argument1+i) mod cs);
     yy=((argument2+t) mod cs);
     if (hg_point_in_shape(xx,yy,shape,cs)=true)
      return true;
    break;
  
  end; 
   
  //*** End inline;

  // 2.  
  //*** Inline Collision point (modified):
  
  ogx=gx;
  ogy=gy;
  
  gx=((argument1+w-i) div cs);
  gy=((argument2+h-t) div cs);

  if (gx<>ogx or gy<>ogy)
   shape=cg[#gx,gy];
   
  switch (shape) begin
  
   case HG_SHAPE.empty:
    break;
   
   case HG_SHAPE.full:
     return true;
    break;
   
   default:
     xx=((argument1+w-i) mod cs);
     yy=((argument2+h-t) mod cs);
     if (hg_point_in_shape(xx,yy,shape,cs)=true)
      return true;
    break;
  
  end; 
   
  //*** End inline;
  
  // 3.  
  //*** Inline Collision point (modified):
  
  ogx=gx;
  ogy=gy;
  
  gx=((argument1+w-i) div cs);
  gy=((argument2+t)   div cs);

  if (gx<>ogx or gy<>ogy)
   shape=cg[#gx,gy];
   
  switch (shape) begin
  
   case HG_SHAPE.empty:
    break;
   
   case HG_SHAPE.full:
     return true;
    break;
   
   default:
     xx=((argument1+w-i) mod cs);
     yy=((argument2+t)   mod cs);
     if (hg_point_in_shape(xx,yy,shape,cs)=true)
      return true;
    break;
  
  end; 
   
  //*** End inline;
  
  // 4.  
  //*** Inline Collision point (modified):
  
  ogx=gx;
  ogy=gy;
  
  gx=((argument1+i)   div cs);
  gy=((argument2+h-t) div cs);

  if (gx<>ogx or gy<>ogy)
   shape=cg[#gx,gy];
   
  switch (shape) begin
  
   case HG_SHAPE.empty:
    break;
   
   case HG_SHAPE.full:
     return true;
    break;
   
   default:
     xx=((argument1+i)   mod cs);
     yy=((argument2+h-t) mod cs);
     if (hg_point_in_shape(xx,yy,shape,cs)=true)
      return true;
    break;
  
  end; 
   
  //*** End inline;
  
 end;
end;

return false;
