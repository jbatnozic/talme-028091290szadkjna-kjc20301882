///inv_armour_to_str()
/*
THIS SCRIPT TURNS THE ARMOUR ITEM SLOT INTO A STRING.

NOTE: This is used only for saving.
NOTE: Use inv_str_to_armour(...) to decode.

No arguments.

Returns - The armour item slot as a string.
*/
var slot_str;

//Name and amount:
slot_str=global.inventory_armour[1]+"\"+
         string(global.inventory_armour[3])+"\";

//Custom value 1:         
if is_string(global.inventory_armour[4])=true
 slot_str+=global.inventory_armour[4]+"\"
 else slot_str+=string(global.inventory_armour[4])+"\";
 
//Custom value 2:         
if is_string(global.inventory_armour[5])=true
 slot_str+=global.inventory_armour[5]+"\"
 else slot_str+=string(global.inventory_armour[5])+"\";
 
//Custom value 3:         
if is_string(global.inventory_armour[6])=true
 slot_str+=global.inventory_armour[6]+"\"
 else slot_str+=string(global.inventory_armour[6])+"\";
 
//Custom value 4:         
if is_string(global.inventory_armour[7])=true
 slot_str+=global.inventory_armour[7]+"\"
 else slot_str+=string(global.inventory_armour[7])+"\";
 
//Custom value 5:         
if is_string(global.inventory_armour[8])=true
 slot_str+=global.inventory_armour[8]+"\"
 else slot_str+=string(global.inventory_armour[8])+"\";
 
return slot_str;
