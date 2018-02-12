///buf_remove_buff(Instance, Buff ID)
/*

*/
var i;

with (argument0) {

 for (i=0; i<ds_grid_height(local_buff_grid); i+=1) begin
  if local_buff_grid[#0,i]=argument1 {
   local_buff_grid[#1,i]=0;
   exit;
   }
 end;

 }
