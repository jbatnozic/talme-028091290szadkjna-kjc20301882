///inv_item_set(index, name, amount, dynval1, dynval2, dynval3, dynval4, dynval5)
/*
THIS SCRIPT SETS THE SPECIFIED INVENTORY SLOT TO MATCH GIVEN PARAMETERS.

NOTE: This could be used for loading a saved inventory (though inv_str_to_slot(...)
      would probably be better for that). This script is not used for anything at the
      moment.

argument0 - Index of the inventory slot.
argument1 - Item name
argument2 - Amount
argument3 - Dynamic value 1
argument4 - Dynamic value 2
argument5 - Dynamic value 3
argument6 - Dynamic value 4
argument7 - Dynamic value 5

Returns nothing.
*/

//Name & Static values:
global.inventory_current[argument0,1]=argument1;
global.inventory_current[argument0,2]=ds_map_find_value(global.item_map,argument1);

//Amount:
global.inventory_current[argument0,3]=argument2;

//Dynamic values:
global.inventory_current[argument0,4]=argument3;
global.inventory_current[argument0,5]=argument4;
global.inventory_current[argument0,6]=argument5;
global.inventory_current[argument0,7]=argument6;
global.inventory_current[argument0,8]=argument7;
