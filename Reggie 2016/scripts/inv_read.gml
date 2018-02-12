///inv_read(string)
/*
THIS SCRIPT LOADS A SAVED INVENTORY:

NOTE: Use inv_write() to save first.

argument0 - Input string.

Returns nothing.
*/
var list,i;

//Flusing inventory:
inv_flush();

//Loading inventory to ds_list:
list=ds_list_create();
ds_list_read(list,argument0);

//Creating new slots if it's needed:
if ds_list_size(list)-6>global.inventory_slots
 repeat (ds_list_size(list)-6-global.inventory_slots) inv_add_slot();

//Reverting inventory to array:
for (i=1; i<=ds_list_size(list); i+=1) begin
 if i<=5 inv_str_to_slot(ds_list_find_value(list,i-1),i,true)
  else if i=6 inv_str_to_armour(ds_list_find_value(list,i-1))
        else inv_str_to_slot(ds_list_find_value(list,i-1),i-6,false);
end;

//Destroying the ds_list:
ds_list_destroy(list);
