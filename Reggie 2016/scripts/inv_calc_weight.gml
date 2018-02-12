///inv_calc_weight()
/*
THIS SCRIPT CALCULATES THE TOTAL WEIGHT OF ALL ITEMS CURRENTLY IN THE INVENTORY:

NOTE: Quick items are taken into account.

No arguments.

Returns - Total weight.
*/
var counter;

counter=0;

for (i=1; i<=global.inventory_slots; i+=1;) begin

 if global.inventory_current[i,1]<>"ZZZZZ"
  counter+=(global.inventory_current[i,3]*real(inv_item_get_static_value(global.inventory_current[i,1],2)));

end;

for (i=1; i<=5; i+=1;) begin

 if global.inventory_quick[i,1]<>"ZZZZZ"
  counter+=(global.inventory_quick[i,3]*real(inv_item_get_static_value(global.inventory_quick[i,1],2)));
 
end;

if global.inventory_armour[1]<>"ZZZZZ"
 counter+=real(inv_item_get_static_value(global.inventory_armour[1],2));

return counter;


