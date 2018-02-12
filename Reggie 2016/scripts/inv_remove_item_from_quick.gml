///inv_remove_item_from_quick(index)
/*
THIS SCRIPT REMOVES THE INDICATED ITEM FROM THE QUICK ITEMS:

argument0 - (Integer) A number ranging from 1 to 5 indicating a specific quick item slot.

Returns nothing.
*/
var i;

i=argument0;

inv_add_set_item(global.inventory_quick[i,1],
                 global.inventory_quick[i,3],
                 global.inventory_quick[i,4],
                 global.inventory_quick[i,5],
                 global.inventory_quick[i,6],
                 global.inventory_quick[i,7],
                 global.inventory_quick[i,8]);
                 
inv_flush_quick(i);
