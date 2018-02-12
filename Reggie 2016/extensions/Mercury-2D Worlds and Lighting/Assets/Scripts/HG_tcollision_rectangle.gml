///HG_tcollision_rectangle(World, Type, X1, Y1, X2, Y2, Precision)
/*

 See Mercury's Manual, section "Collisions".

*/
var i,t,p,w,h,cs,ww,wh,grid,list;
var gx,gy,ogx,ogy,xx,yy,shape;

if argument0=-1
 argument0=global.HG_DEFAULT_WORLD;
 
if is_string(argument1)
 argument1=global.HG_TYPE_MAP[?argument1];
 
cs=hg_world_get_attribute(argument0,"cellSize");
ww=hg_world_get_attribute(argument0,"width")*cs;
wh=hg_world_get_attribute(argument0,"height")*cs;

grid=ds_map_find_value(argument0,"index");

argument2=clamp(argument2,0,ww-1);
argument3=clamp(argument3,0,wh-1);
argument4=clamp(argument4,0,ww-1);
argument5=clamp(argument5,0,wh-1);
 
if (argument4<argument2) {

 p=argument2;
 argument2=argument4;
 argument4=p;

 }
 
if (argument5<argument3) {

 p=argument3;
 argument3=argument5;
 argument5=p;

 }

w=argument4-argument2;
h=argument5-argument3;
p=argument6;

gx=-1;
gy=-1;

for (t=0; t<(h+p)/2; t+=p) begin
 for (i=0; i<(w+p)/2; i+=p) begin
   
  // 1.   
  //*** Inline Collision point (modified):
  
  ogx=gx;
  ogy=gy;
  
  gx=((argument2+i) div cs);
  gy=((argument3+t) div cs);

  if (gx<>ogx or gy<>ogy) {  
   list=grid[#gx,gy];
   shape=list[|HG_TPROP.shape];   
   }
   
  if (list=argument1) {
  
   switch (shape) begin
  
    case HG_SHAPE.empty:
     break;
   
    case HG_SHAPE.full:
      return true;
     break;
   
    default:
      xx=((argument2+i) mod cs);
      yy=((argument3+t) mod cs);
      if (hg_point_in_shape(xx,yy,shape,cs)=true)
       return true;
     break;
  
   end; 
   
   }
   
  //*** End inline;

  // 2.  
  //*** Inline Collision point (modified):
  
  ogx=gx;
  ogy=gy;
  
  gx=((argument2+w-i) div cs);
  gy=((argument3+h-t) div cs);

  if (gx<>ogx or gy<>ogy) {  
   list=grid[#gx,gy];
   shape=list[|HG_TPROP.shape];   
   }
   
  if (list=argument1) {
   
   switch (shape) begin
  
    case HG_SHAPE.empty:
     break;
   
    case HG_SHAPE.full:
      return true;
     break;
   
    default:
      xx=((argument2+w-i) mod cs);
      yy=((argument3+h-t) mod cs);
      if (hg_point_in_shape(xx,yy,shape,cs)=true)
       return true;
     break;
  
   end; 
  
   }
   
  //*** End inline;
  
  // 3.  
  //*** Inline Collision point (modified):
  
  ogx=gx;
  ogy=gy;
  
  gx=((argument2+w-i) div cs);
  gy=((argument3+t)   div cs);

  if (gx<>ogx or gy<>ogy) {  
   list=grid[#gx,gy];
   shape=list[|HG_TPROP.shape];   
   }
   
  if (list=argument1) {
   
   switch (shape) begin
  
    case HG_SHAPE.empty:
     break;
   
    case HG_SHAPE.full:
      return true;
     break;
   
    default:
      xx=((argument2+w-i) mod cs);
      yy=((argument3+t)   mod cs);
      if (hg_point_in_shape(xx,yy,shape,cs)=true)
       return true;
     break;
  
   end; 
   
   }
   
  //*** End inline;
  
  // 4.  
  //*** Inline Collision point (modified):
  
  ogx=gx;
  ogy=gy;
  
  gx=((argument2+i)   div cs);
  gy=((argument3+h-t) div cs);

  if (gx<>ogx or gy<>ogy) {  
   list=grid[#gx,gy];
   shape=list[|HG_TPROP.shape];   
   }
   
  if (list=argument1) {
   
   switch (shape) begin
  
    case HG_SHAPE.empty:
     break;
   
    case HG_SHAPE.full:
      return true;
     break;
   
    default:
      xx=((argument2+i)   mod cs);
      yy=((argument3+h-t) mod cs);
      if (hg_point_in_shape(xx,yy,shape,cs)=true)
       return true;
     break;
  
   end; 
   
   }
   
  //*** End inline; 
  
 end;
end;

return false;
