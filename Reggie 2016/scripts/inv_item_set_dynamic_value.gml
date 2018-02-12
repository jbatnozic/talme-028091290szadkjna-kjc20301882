///inv_item_set_dynamic_value(itemindex, quick, valueindex, newvalue)
/*
THIS SCRIPT GRANTS A DYNAMIC VALUE OF AN ITEM CURRENTLY IN THE INVENTORY A NEW VALUE:

argument0 - (Integer) Item index in inventory.
argument1 - (Boolean) Whether to address quick items instead.
argument2 - (Integer) Value to set:
             0. Current stack
             1. Custom value 1
             2. Custom value 2
             3. ...
argument3 - (Integer OR String) New value.
           
Returns nothing.
*/
if argument1=false
  global.inventory_current[argument0,argument2+3]=argument3
 else global.inventory_quick[argument0,argument2+3]=argument3;
