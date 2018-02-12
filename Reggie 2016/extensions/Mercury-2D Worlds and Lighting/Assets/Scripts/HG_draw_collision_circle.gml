///HG_draw_collision_circle(Sprite, X, Y, Radius, Precision)
/*

 See Mercury's Manual, section "Utility functions".

*/
var i,t,sx,sy,prec,xx,yy;
 
prec=argument4;

sx=argument1;
sy=argument2;

for (t=argument3; t>0; t-=prec) begin

 var tetha=180*prec/(t*pi);

 for (i=0; i<180; i+=tetha) begin
  
  xx=sx+t*dcos(i);
  yy=sy-t*dsin(i);
  
  draw_sprite(argument0,0,xx,yy);
   
  xx=sx-t*dcos(i);
  yy=sy+t*dsin(i);
   
  draw_sprite(argument0,0,xx,yy);

 end;
 
end;

return false;
