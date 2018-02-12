///inv_write()
/*
THIS SCRIPTS WRITES THE WHOLE INVENTORY TO A SINGLE STRING WHICH CAN THEN BE USED TO SAVE
THE PLAYER'S INVENTORY.

NOTE: Use inv_read(...) to revert.

No arguments.

Returns - Whole inventory in the form of a string.
*/
var list,i,code;

//Creating the ds_list:
list=ds_list_create();

//Writing to ds_list:
i=0
repeat (5) begin //Quick items
i+=1;
ds_list_add(list,inv_slot_to_str(i,true));
end;

//Armour
ds_list_add(list,inv_armour_to_str());

i=0;
repeat (global.inventory_slots) begin //General inventory
i+=1;
ds_list_add(list,inv_slot_to_str(i,false));
end;

code=ds_list_write(list);

//Destroying the ds_list:
ds_list_destroy(list);

//Returning:
return code;
