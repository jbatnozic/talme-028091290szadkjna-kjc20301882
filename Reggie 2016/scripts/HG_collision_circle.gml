///HG_collision_circle(World, X, Y, Radius, Precision)
/*

 See Mercury's Manual, section "Collisions".

*/
var i,t,sx,sy,prec,cs,cg,ww,wh,xx,yy;
var gx,gy,ogx,ogy,tx,ty,shape;

if argument0=-1
 argument0=global.HG_DEFAULT_WORLD;
 
prec=argument4;

sx=argument1;
sy=argument2;

cs=hg_world_get_attribute(argument0,"cellSize");
ww=hg_world_get_attribute(argument0,"width")*cs-1;
wh=hg_world_get_attribute(argument0,"height")*cs-1;
cg=hg_world_get_attribute(argument0,"colGrid");

gx=-1;
gy=-1;
for (t=argument3; t>0; t-=prec) begin

 var tetha=180*prec/(t*pi);

 for (i=0; i<180; i+=tetha) begin
  
  xx=sx+t*dcos(i);
  yy=sy-t*dsin(i);
  
  if point_in_rectangle(xx,yy,0,0,ww,wh) {
   
   //*** Inline Collision point (modified):
  
   ogx=gx;
   ogy=gy;
  
   gx=(xx div cs);
   gy=(yy div cs);

   if (gx<>ogx or gy<>ogy)
    shape=cg[#gx,gy];
   
   switch (shape) begin
  
    case HG_SHAPE.empty:
     break;
   
    case HG_SHAPE.full:
      return true;
     break;
   
    default:
      tx=(xx mod cs);
      ty=(yy mod cs);
      if (hg_point_in_shape(tx,ty,shape,cs)=true)
       return true;
     break;
  
   end; 
   
   //*** End Inline;
   
   }
   
  xx=-xx+2*sx;
  yy=-yy+2*sy;
   
  if point_in_rectangle(xx,yy,0,0,ww,wh) {
  
   //*** Inline Collision point (modified):
  
   ogx=gx;
   ogy=gy;
  
   gx=(xx div cs);
   gy=(yy div cs);

   if (gx<>ogx or gy<>ogy)
    shape=cg[#gx,gy];
   
   switch (shape) begin
  
    case HG_SHAPE.empty:
     break;
   
    case HG_SHAPE.full:
      return true;
     break;
   
    default:
      tx=(xx mod cs);
      ty=(yy mod cs);
      if (hg_point_in_shape(tx,ty,shape,cs)=true)
       return true;
     break;
  
   end; 
   
   //*** End Inline;
   
   }

 end;
 
end;

return false;
