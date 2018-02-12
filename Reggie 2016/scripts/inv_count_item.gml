///inv_count_item(itemname)
/*
THIS SCRIPT COUNTS HOW MANY COPIES OF A SPECIFIC ITEM ARE THERE IN THE PLAYER'S INVENTORY:

NOTE: Quick items are NOT taken into account!

argument0 - (String) Name of the itme to count.

Returns - (Integer) Quantity of the item.
*/
var counter;

counter=0;

for (i=1; i<=global.inventory_slots; i+=1;) begin

if global.inventory_current[i,1]=argument0 counter+=global.inventory_current[i,3];

end;

return counter;
