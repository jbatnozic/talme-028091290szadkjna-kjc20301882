///inv_compress()
/*
THIS SCRIPT DELETES ALL EMPTY SLOTS IN THE INVENTORY.

NOTE: This script is automatically called by in_refresh(...) when it's executed so there's no
      need to call it manually.

No arguments.

Returns nothing.
*/
var list,i,counter;

//Creating the ds_list:
list=ds_list_create();

//Writing items to ds_list:
counter=0;
for (i=1; i<=global.inventory_slots; i+=1) begin
 if global.inventory_current[i,1]<>"ZZZZZ" {
  ds_list_add(list,inv_slot_to_str(i,false));
  counter+=1
  }
end;

//Adding empty slots at the end:
global.inventory_slots=clamp(counter,10,999999);

global.inventory_current=0;

//Flusing inventory:
inv_flush();

//Reverting inventory to array:
for (i=1; i<=counter; i+=1) begin
 inv_str_to_slot(ds_list_find_value(list,i-1),i,false);
end;

//Destroying the ds_list:
ds_list_destroy(list);
