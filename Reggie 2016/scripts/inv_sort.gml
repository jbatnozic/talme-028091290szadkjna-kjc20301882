///inv_sort()
/*
THIS SCRIPT SORTS THE INVENTORY ARRAY ACCORDING TO ALPHABETICAL ORDER.
(This is done via writing the entire inventory to the ds_list, sorting it,
then reverting the process.)

No arguments.

Returns nothing.
*/
var list,i;

//Creating the ds_list:
list=ds_list_create();

//Writing to ds_list and sorting it:
i=0;
repeat (global.inventory_slots) begin
i+=1;
ds_list_add(list,inv_slot_to_str(i,false));
end;

ds_list_sort(list,true);

//Flusing inventory:
inv_flush();

//Reverting inventory to array:
for (i=1; i<=global.inventory_slots; i+=1) begin
inv_str_to_slot(ds_list_find_value(list,i-1),i,false);
end;

//Destroying the ds_list:
ds_list_destroy(list);
