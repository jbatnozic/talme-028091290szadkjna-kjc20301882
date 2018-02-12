///inv_list_type(type, skip)
/*
THIS SCRIPT SETS THE GLOBAL ARRAY global.inventory_list SO THAT IT HOLDS THE INVENTORY
INDEXES OF THE FIRST 15 ITEMS CURRENTLY IN THE INVENTORY OF THE INDICATED TYPE, IGNORING
THE FIRST [argument1] ENTRIES.

NOTE: This is to be used for scrolling through inventory.

argument0 - (Integer) Item type to look for (0 to accept all item types).
argument1 - (Integer) How many entries to skip.

Returns nothing - Use global.inventory_list.
*/
var i,counter;

for (i=1; i<=15; i+=1) begin
global.inventory_list[i]=-1;
end;

counter=1-argument1;

for (i=1; i<=global.inventory_slots; i+=1) begin

 if global.inventory_current[i,1]<>"ZZZZZ" and
    (real(inv_item_get_static_value(global.inventory_current[i,1],0))=argument0 or
     argument0=0) {
  if counter>0 global.inventory_list[counter]=i;
  counter+=1;
  if counter>15 exit;
 
}

end;
