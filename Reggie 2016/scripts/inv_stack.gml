///inv_stack()
/*

No arguments.

Returns nothing.
*/
var i,a,name,amount;

for (i=1; i<=global.inventory_slots; i+=1) begin

 if i>array_length_2d(global.inventory_current,1) break
  else {

   if (global.inventory_current[i,1]=="ZZZZZ") continue;
  
   a=real(inv_item_get_static_value(i,0));
 
   if (a<>INV_TYPE.weapon and a<>INV_TYPE.armour) {
 
    name=global.inventory_current[i,1];
    amount=global.inventory_current[i,3];
  
    inv_flush_slot(i);
  
    inv_add_item(name,amount); 
 
    }
    
  }

end;

inv_refresh();
