///inv_slot_to_str(slotindex, quick)
/*
THIS SCRIPT TURNS A COMPLETE ITEM SLOT INTO A STRING.

NOTE: This is used only for sorting the inventory and for saving.
NOTE: Use inv_str_to_slot(...) to decode.

argument0 - (Integer) Slot (item) index.
argument1 - (Boolean) Whether to address quick items instead.

Returns - A complete item slot as a string.
*/
var slot_str;

if argument1=false {

//Name and amount:
slot_str=global.inventory_current[argument0,1]+"\"+
         string(global.inventory_current[argument0,3])+"\";

//Custom value 1:         
if is_string(global.inventory_current[argument0,4])=true
 slot_str+=global.inventory_current[argument0,4]+"\"
 else slot_str+=string(global.inventory_current[argument0,4])+"\";
 
//Custom value 2:         
if is_string(global.inventory_current[argument0,5])=true
 slot_str+=global.inventory_current[argument0,5]+"\"
 else slot_str+=string(global.inventory_current[argument0,5])+"\";
 
//Custom value 3:         
if is_string(global.inventory_current[argument0,6])=true
 slot_str+=global.inventory_current[argument0,6]+"\"
 else slot_str+=string(global.inventory_current[argument0,6])+"\";
 
//Custom value 4:         
if is_string(global.inventory_current[argument0,7])=true
 slot_str+=global.inventory_current[argument0,7]+"\"
 else slot_str+=string(global.inventory_current[argument0,7])+"\";
 
//Custom value 5:         
if is_string(global.inventory_current[argument0,8])=true
 slot_str+=global.inventory_current[argument0,8]+"\"
 else slot_str+=string(global.inventory_current[argument0,8])+"\";
 
} else {

//Name and amount:
slot_str=global.inventory_quick[argument0,1]+"\"+
         string(global.inventory_quick[argument0,3])+"\";

//Custom value 1:         
if is_string(global.inventory_quick[argument0,4])=true
 slot_str+=global.inventory_quick[argument0,4]+"\"
 else slot_str+=string(global.inventory_quick[argument0,4])+"\";
 
//Custom value 2:         
if is_string(global.inventory_quick[argument0,5])=true
 slot_str+=global.inventory_quick[argument0,5]+"\"
 else slot_str+=string(global.inventory_quick[argument0,5])+"\";
 
//Custom value 3:         
if is_string(global.inventory_quick[argument0,6])=true
 slot_str+=global.inventory_quick[argument0,6]+"\"
 else slot_str+=string(global.inventory_quick[argument0,6])+"\";
 
//Custom value 4:         
if is_string(global.inventory_quick[argument0,7])=true
 slot_str+=global.inventory_quick[argument0,7]+"\"
 else slot_str+=string(global.inventory_quick[argument0,7])+"\";
 
//Custom value 5:         
if is_string(global.inventory_quick[argument0,8])=true
 slot_str+=global.inventory_quick[argument0,8]+"\"
 else slot_str+=string(global.inventory_quick[argument0,8])+"\";

}
 
return slot_str;
