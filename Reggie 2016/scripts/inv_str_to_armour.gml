///inv_str_to_armour(string)
/*

argument0 - (String)  Input string.

Returns nohting.
*/
var slot_str,temp_str;

slot_str=argument0;

//Name & Static values:
temp_str=string_copy(slot_str,1,string_pos("\",slot_str)-1);
slot_str=string_delete(slot_str,1,string_pos("\",slot_str));
global.inventory_armour[1]=temp_str;
global.inventory_armour[2]=ds_map_find_value(global.inventory_map,temp_str)

//Amount:
temp_str=string_copy(slot_str,1,string_pos("\",slot_str)-1);
slot_str=string_delete(slot_str,1,string_pos("\",slot_str));
global.inventory_armour[3]=real(temp_str);

//Dynamic value 1:
temp_str=string_copy(slot_str,1,string_pos("\",slot_str)-1);
slot_str=string_delete(slot_str,1,string_pos("\",slot_str));
if string_copy(temp_str,1,1)="%" global.inventory_armour[4]=temp_str;
 else global.inventory_armour[4]=real(temp_str);

//Dynamic value 2:
temp_str=string_copy(slot_str,1,string_pos("\",slot_str)-1);
slot_str=string_delete(slot_str,1,string_pos("\",slot_str));
if string_copy(temp_str,1,1)="%" global.inventory_armour[5]=temp_str;
 else global.inventory_armour[5]=real(temp_str);
 
//Dynamic value 3:
temp_str=string_copy(slot_str,1,string_pos("\",slot_str)-1);
slot_str=string_delete(slot_str,1,string_pos("\",slot_str));
if string_copy(temp_str,1,1)="%" global.inventory_armour[6]=temp_str;
 else global.inventory_armour[6]=real(temp_str);
 
//Dynamic value 4:
temp_str=string_copy(slot_str,1,string_pos("\",slot_str)-1);
slot_str=string_delete(slot_str,1,string_pos("\",slot_str));
if string_copy(temp_str,1,1)="%" global.inventory_armour[7]=temp_str;
 else global.inventory_armour[7]=real(temp_str);
 
//Dynamic value 5:
temp_str=string_copy(slot_str,1,string_pos("\",slot_str)-1);
slot_str=string_delete(slot_str,1,string_pos("\",slot_str));
if string_copy(temp_str,1,1)="%" global.inventory_armour[8]=temp_str;
 else global.inventory_armour[8]=real(temp_str);
