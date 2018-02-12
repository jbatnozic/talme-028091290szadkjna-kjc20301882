///buf_apply_buff(Instance, Buff ID, Duration [sec])
/*
Applies a buff to the specified instance.

Returns nothing.
*/
var add;

add=global.buff_grid[#1,argument1];

with (argument0) {

 var check,c_h,i; 

 check=ds_grid_value_exists(local_buff_grid,0,0,0,ds_grid_height(local_buff_grid)-1,argument1);
 
 if !check {
  //Create new:
  c_h=ds_grid_height(local_buff_grid);
  ds_grid_resize(local_buff_grid,2,c_h+1);

  local_buff_grid[#0,c_h]=argument1;
  local_buff_grid[#1,c_h]=round(argument2*60/global.buff_speed);
  
  }
  else {
  //Update existing:
  for (i=0; i<ds_grid_height(local_buff_grid); i+=1) begin
   if local_buff_grid[#0,i]=argument1 {
    
    local_buff_grid[#1,i]=local_buff_grid[#1,i]*(global.buff_grid[#1,argument1])+round(argument2*60/global.buff_speed);
    break;
   
    }
  end;
  
  }
  
 //If the target is the player, calc Heart stuff:
 if (id=(global.player_obj_id)) {
  
  heart_cause_strain(global.buff_grid[#2,argument1]);
  
  if random(100)<global.buff_grid[#3,argument1] 
   heart_cause_delayed_heart_attack(irandom_range(4,9),15);
 
  }
  
 //Calc mods:
 buf_calculate_modifiers();

 }
