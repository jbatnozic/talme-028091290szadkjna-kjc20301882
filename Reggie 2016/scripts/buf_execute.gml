///buf_execute()
/*
Deals with buffs of the calling instance (should be called every step).

No arguments.

Returns nothing;
*/
var i,a;

if local_buff_counter=0 {

 if ds_grid_height(local_buff_grid)=0 exit;

 //Countdown buffs:
 ds_grid_add_region(local_buff_grid,1,0,1,ds_grid_height(local_buff_grid)-1,-1);

 //Remove any if necessary and deal with expirations, then recalculate:
 if ds_grid_get_min(local_buff_grid,1,0,1,ds_grid_height(local_buff_grid)-1)<1 {

  ds_grid_sort(local_buff_grid,1,false);
 
  a=0;
  for (i=0; i<ds_grid_height(local_buff_grid); i+=1) begin
   if (local_buff_grid[#1,i]<1) {
    buf_end_effect(local_buff_grid[#0,i]);    
    }
    else
     a+=1;
     
  end;
   
  if (a==0) {
    ds_grid_destroy(local_buff_grid);
    local_buff_grid=ds_grid_create(2,0);  
    }
    else {
      ds_grid_resize(local_buff_grid,2,a);
      }

  buf_calculate_modifiers();
 
  }
  
 local_buff_counter=global.buff_speed-1;
  
 }
 
 else {
 
  local_buff_counter-=1;
 
  }
