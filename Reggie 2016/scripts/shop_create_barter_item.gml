///shop_create_barter_item(Result, Amount, Name 1, Amount 1, ...)
/*
THIS SCRIPT WILL CREATE A BARTER COMBINATION, WHICH WILL LATER BE MADE AVAILABLE IN A SHOP
USING THE shop_add_barter_item(...) script.

argument0 - (String)  Name of the resulting item from the recipe.
argument1 - (Integer) Amount of the resulting item.
argument2 - (String)  Name of the first item.
argument3 - (Integer) Number of the first item required.
argument4 - (.......) Further items...
    
Returns - Handle of the newly created ds_list for barter.
*/
 
var __list=ds_list_create();

if (argument_count<=3)
    show_error("Empty recipe created! You must have at least one item!", true);
if (argument_count mod 2 != 0)
    show_error("Every recipe item must have an amount!",true);
    
for (var i=1; i<=argument_count; ++i)
    ds_list_add(__list,argument[i-1]);

return __list;
