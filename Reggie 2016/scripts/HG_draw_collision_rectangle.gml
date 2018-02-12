///HG_draw_collision_rectangle(Sprite, X1, Y1, X2, Y2, Precision)
/*

 See Mercury's Manual, section "Utility functions".
 
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
  draw_sprite(argument0,0,argument1+i,argument2+t);

  // 2.
  draw_sprite(argument0,0,argument1+w-i,argument2+h-t);
  
  // 3.
  draw_sprite(argument0,0,argument1+w-i,argument2+t);
  
  // 4.
  draw_sprite(argument0,0,argument1+i,argument2+h-t);
  
 end;
end;

return false;
