///player_update_hands()
/*

*/
var __newWeapon;

remove(weaponHoldingPar);

if global.inventory_quick[global.inventory_active,1]<>"ZZZZZ"
  __newWeapon=real(inv_item_get_static_value(global.inventory_quick[global.inventory_active,1],4));
 else __newWeapon=-1;
  
if __newWeapon<>-1 {
 instance_create((global.player_obj_id).x,(global.player_obj_id).y-20,__newWeapon);
 }
 else {/*Create default weapon - Here it's not needed.*/ }
