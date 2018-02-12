///hg_world_update_surround_in_region(World, X1, Y1, X2, Y2, Local)
/*

 Underlying HG script.

 NOTE: Accepts -1 as arguments 3 & 4 = as far as possible.

*/
var i,t,c,ww,wh,grid;

ww=hg_world_get_attribute(argument0,"width");
wh=hg_world_get_attribute(argument0,"height");

if argument3=-1
 argument3=ww-1;
 
if argument4=-1
 argument4=wh-1;

grid=hg_world_get_attribute(argument0,"surroundGrid");
c=0;

for (t=argument2; t<=argument4; t+=1) begin
 for (i=argument1; i<=argument3; i+=1) begin
 
  if (i<0 or t<0 or i>ww-1 or t>wh-1) {
   c+=1; 
   continue;
   }
 
  if (argument5=true and (c mod 2)=0 and c<>4) {
   c+=1;
   continue;
   }
 
  grid[#i,t]=hg_cell_get_surround(argument0,i,t);
  c+=1;
 
 end;
end;
