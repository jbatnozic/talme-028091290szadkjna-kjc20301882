///inv_add_set_item(name,amount,dynamic1,dynamic2,dynamic3,dynamic4,dynamic5)
/*
THIS SCRIPT ADDS AN ALREADY SET ITEM INTO THE INVENTORY (it is immediately provided with specific
dynamic values after being added).

NOTE: This is to be used for picking up weapons and for trasfering items back from quick items.

argument0 - Name
argument1 - Amount
argument2 - Dynamic value 1
argument3 - Dynamic value 2
argument4 - Dynamic value 3
argument5 - Dynamic value 4
argument6 - Dynamic value 5

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
global.inventory_current[fc,3]=argument1;
global.inventory_current[fc,4]=argument2;
global.inventory_current[fc,5]=argument3;
global.inventory_current[fc,6]=argument4;
global.inventory_current[fc,7]=argument5;
global.inventory_current[fc,8]=argument6;

return fc;
