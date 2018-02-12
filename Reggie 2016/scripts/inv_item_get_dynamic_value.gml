///inv_item_get_dynamic_value(itemindex, quick, valueindex)
/*
THIS SCRIPT FETCHES A DYNAMIC VALUE OF AN ITEM CURRENTLY IN THE INVENTORY:

argument0 - (Integer) Item index in inventory.
argument1 - (Boolean) Whether to address quick items instead.
argument2 - (Integer) Value to get:
             0. Current stack
             1. Custom value 1
             2. Custom value 2
             3. ...
           
Returns - Requested value.
*/

var value;

if argument1=false
  value=global.inventory_current[argument0,argument2+3]
 else value=global.inventory_quick[argument0,argument2+3];

return value;
