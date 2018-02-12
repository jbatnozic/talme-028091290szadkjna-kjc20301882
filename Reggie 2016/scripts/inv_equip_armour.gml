///inv_equip_armour(item index)
/*

*/

//See if an armour is already equipped:
if global.inventory_armour[1]<>"ZZZZZ" {
 return false;
 }
 else begin
 
  //Apply armour:
  (global.player_obj_id)._armour=global.inventory_current[argument0,4]*armour_get_ratio(global.inventory_current[argument0,1]);

  //Name:     
  global.inventory_armour[1]=global.inventory_current[argument0,1];

  //Static values:
  global.inventory_armour[2]=global.inventory_current[argument0,2];

  //Amount:
  global.inventory_armour[3]=global.inventory_current[argument0,3];
  
  //Dynamic values:
  global.inventory_armour[4]=global.inventory_current[argument0,4]; 
  global.inventory_armour[5]=global.inventory_current[argument0,5]; 
  global.inventory_armour[6]=global.inventory_current[argument0,6];
  global.inventory_armour[7]=global.inventory_current[argument0,7]; 
  global.inventory_armour[8]=global.inventory_current[argument0,8];
 
  //Flushing the old slot:
  inv_flush_slot(argument0);

end;

return true;
