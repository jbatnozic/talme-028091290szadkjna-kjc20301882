///buf_calculate_modifiers()
/*
Calculates modifiers (from buffs) for the calling instance.

No arguments.

Returns nothing.
*/
var i,bfid;

mod_speed=1;
mod_jump=1;
mod_acc=1;
mod_sta=0; //+
mod_hp=0;  //+
mod_rel=1;
mod_dr=1;
mod_carryw=1;
mod_kbrs=1;
mod_abs=1;

//Particle effects:
eff_fire=0;
eff_acid=0;
eff_bleed=0;
eff_poison=0;

//Calculate modifiers:
if ds_grid_height(local_buff_grid)=0 exit;

for (i=0; i<ds_grid_height(local_buff_grid); i+=1) begin

 bfid=local_buff_grid[#0,i];
 
 //Modifiers:
 mod_speed=min(mod_speed*global.buff_grid[#4,bfid],2);
 mod_jump=min(mod_jump*global.buff_grid[#5,bfid],2);
 mod_acc=min(mod_acc*global.buff_grid[#6,bfid],1.8);
 mod_sta+=global.buff_grid[#7,bfid]; //+
 mod_hp+=global.buff_grid[#8,bfid];  //+
 mod_rel=min(mod_rel*global.buff_grid[#9,bfid],2);
 mod_dr=max(mod_dr*global.buff_grid[#10,bfid],0.5);
 mod_carryw=min(mod_carryw*global.buff_grid[#11,bfid],2);
 mod_kbrs=max(mod_kbrs*global.buff_grid[#12,bfid],0.5);
 mod_streg=clamp(mod_streg*global.buff_grid[#13,bfid],0.5,2);
 mod_hac=clamp(mod_hac*global.buff_grid[#14,bfid],0.5,2);
 mod_abs=clamp(mod_abs*global.buff_grid[#15,bfid],0,1);
 
 //Particle effects:
 if global.buff_grid[#16,bfid]=PTC_EFF.fire eff_fire=1
  else if global.buff_grid[#16,bfid]=PTC_EFF.acid eff_acid=1
   else if global.buff_grid[#16,bfid]=PTC_EFF.bleed eff_bleed=1
    else if global.buff_grid[#16,bfid]=PTC_EFF.poison eff_poison=1
 
end;
