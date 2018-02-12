///inv_item_switch(indexone, indextwo, quick)
/*
THIS SCRIPT SWITCHES PLACES OF THE TWO INDICATED ITEMS CURRENTLY PRESENT IN THE INVENTORY.

argument0 - (Integer) Index of the first item.
argument1 - (Integer) Index of the second item.

Returns nothing.
*/
var item1,item2;

if argument2=false {

 item1=inv_slot_to_str(argument0,false);
 item2=inv_slot_to_str(argument1,false);

 inv_str_to_slot(item2,argument0,false);
 inv_str_to_slot(item1,argument1,false);
 
 }
 else {
 
  item1=inv_slot_to_str(argument0,true);
  item2=inv_slot_to_str(argument1,true);

  inv_str_to_slot(item2,argument0,true);
  inv_str_to_slot(item1,argument1,true);
 
  }
