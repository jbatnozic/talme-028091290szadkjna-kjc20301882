///inv_item_add_dynamic_value(itemindex, quick, valueindex, value)
/*
THIS SCRIPT CHANGES A DYNAMIC VALUE OF AN ITEM CURRENTLY IN THE INVENTORY RELATIVE TO ITS
ALREADY EXISTING VALUE:

NOTE: Some dynamic values are strings and others are integers, so be careful!
NOTE: As in Reuben's code, negative values can be used.

argument0 - (Integer) Item index in inventory.
argument1 - (Boolean) Whether to address quick items instead.
argument2 - (Integer) Value to set:
             0. Current stack
             1. Custom value 1
             2. Custom value 2
             3. ...
argument3 - (Integer OR String) How much to add.
           
Returns nothing.
*/
if argument1=false
  global.inventory_current[argument0,argument2+3]+=argument3
 else global.inventory_quick[argument0,argument2+3]+=argument3;
