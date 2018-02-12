///inv_add_weapon(Name, AmmoAmount, AmmoType, Durability)
/*
THIS SCRIPT ADDS A WEAPON WITH SPECIFIC PROPERTIES INTO THE INVENTORY.

argument0 - Name of the weapon
argument1 - Amount of Ammo
argument2 - Type of Ammo
argument3 - Durability

Returns - Index of the newly added item.
*/
var i,fc;

//First it checks whether there's an existing empty slot:
fc=0;
for (i=1; i<=global.inventory_slots; i+=1;) begin
  if global.inventory_current[i,1]="ZZZZZ" {
   fc=i;
   break;
   }
 end;

//If not, a new slot is created: 
if fc=0 {
 inv_add_slot();
 fc=global.inventory_slots; }
 
//Then it writes to the slot:
global.inventory_current[fc,1]=argument0;
global.inventory_current[fc,2]=ds_map_find_value(global.inventory_map,argument0);
global.inventory_current[fc,3]=1;
global.inventory_current[fc,4]=argument1;
global.inventory_current[fc,5]=argument2;
global.inventory_current[fc,6]=argument3;
global.inventory_current[fc,7]=0;
global.inventory_current[fc,8]=0;

return fc;
