///inv_remove_item(itemname, amount)
/*
THIS SCRIPT REMOVES THE INDICATED QUANTITY OF THE INDICATED ITEM:

NOTE: If argument0 exceeds the number of the indicated item in the inventory, the script will
      simply remove as much as possible. So use inv_count_item(...) before using this script.
NOTE: Quick items are NOT taken into account!

argument0 - (String)  Name of the item to remove.
argument1 - (Integer) Amount to remove.

Returns nothing.
*/
var remaining,i;

remaining=argument1;

for (i=1; i<=global.inventory_slots; i+=1) begin

 if global.inventory_current[i,1]=argument0 {
  if global.inventory_current[i,3]>=remaining {inv_item_add_dynamic_value(i,false,0,-remaining); remaining=0;}
   else {remaining-=global.inventory_current[i,3]; global.inventory_current[counter,3]=0;}
 }
 
 if remaining<1 break;

end;
