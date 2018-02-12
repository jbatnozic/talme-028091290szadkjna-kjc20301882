///inv_add_item_to_quick(index)
/*
THIS SCRIPTS ADDS THE INDICATED ITEM TO QUICK ITEMS IF THERE'S ROOM FOR IT:

Argument0 - (Integer) Item index in the current inventory.

Returns true if successful.
*/
var target_slot,i;

//Find the first clear slot (target_slot):
target_slot=0;
for (i=1; i<=5; i+=1;) begin
  if global.inventory_quick[i,1]="ZZZZZ" {target_slot=i; break;}
 end;

if target_slot=0 return false;
 else begin

  //Name:     
  global.inventory_quick[target_slot,1]=global.inventory_current[argument0,1];
   global.inventory_current[argument0,1]="";

  //Static values:
  global.inventory_quick[target_slot,2]=global.inventory_current[argument0,2];
   global.inventory_current[argument0,2]="";

  //Amount:
  global.inventory_quick[target_slot,3]=global.inventory_current[argument0,3];
   global.inventory_current[argument0,3]=0;
  
  //Dynamic values:
  global.inventory_quick[target_slot,4]=global.inventory_current[argument0,4];
   global.inventory_current[argument0,4]=0;
 
  global.inventory_quick[target_slot,5]=global.inventory_current[argument0,5];
   global.inventory_current[argument0,5]=0;
 
  global.inventory_quick[target_slot,6]=global.inventory_current[argument0,6];
   global.inventory_current[argument0,6]=0;

  global.inventory_quick[target_slot,7]=global.inventory_current[argument0,7];
   global.inventory_current[argument0,7]=0;
 
  global.inventory_quick[target_slot,8]=global.inventory_current[argument0,8];
   global.inventory_current[argument0,8]=0;
 
  //Flushing the old slot:
  inv_flush_slot(argument0);

end;

return true;
