///shop_add_barter_item(Handle)
/*
THIS SCRIPT WILL ADD A BARTER COMBINATION, PREVIOUSLY DEFINED USING THE 
shop_create_barter_item(...) SCRIPT, INTO THE CURRENTLY OPENED SHOP.

argument0 - (Integer) Handle of the ds_list which holds a barter combination (previously
            created using shop_create_barter_item(...).
            
Returns nothing.
*/

ds_list_add(global.barter_list,argument0);
