///sett_list_group(Group, Skip)
/*

*/
var i,array,found;

for (i=0; i<10; i+=1) begin
 array[i]=-1;
end;

found=-argument1;

for (i=0; i<ds_grid_height(global.sett_grid) i+=1) begin

 if global.sett_grid[#2,i]=argument0 {
 
  if found>=0
   array[found]=i;
   
  found+=1;
  
  if found>9 break;
 
  }

end;

return array;
