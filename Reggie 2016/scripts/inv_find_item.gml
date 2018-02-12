///inv_find_item(slot string)
/*
THIS SCRIPT RETURNS THE INDEX OF FIRST ITEM TO EXACTLY MATCH THE SPECIFIED SLOT STRING:

argument0 - (String) Slot string

Returns the index of the item sought for.
*/

var i,slot_str,temp_str,temp_item;

//FIRST AND ITEM FOR REFERENCE IS GENERATED FROM THE STRING (temp_item):

slot_str=argument0;

//Name:
temp_str=string_copy(slot_str,1,string_pos("\",slot_str)-1);
slot_str=string_delete(slot_str,1,string_pos("\",slot_str));
temp_item[1]=temp_str;

//Static values (not checked):
temp_item[2]="";

//Amount:
temp_str=string_copy(slot_str,1,string_pos("\",slot_str)-1);
slot_str=string_delete(slot_str,1,string_pos("\",slot_str));
temp_item[3]=real(temp_str);

//Dynamic value 1:
temp_str=string_copy(slot_str,1,string_pos("\",slot_str)-1);
slot_str=string_delete(slot_str,1,string_pos("\",slot_str));
if string_copy(temp_str,1,1)="%" temp_item[4]=temp_str;
 else temp_item[4]=real(temp_str);

//Dynamic value 2:
temp_str=string_copy(slot_str,1,string_pos("\",slot_str)-1);
slot_str=string_delete(slot_str,1,string_pos("\",slot_str));
if string_copy(temp_str,1,1)="%" temp_item[5]=temp_str;
 else temp_item[5]=real(temp_str);
 
//Dynamic value 3:
temp_str=string_copy(slot_str,1,string_pos("\",slot_str)-1);
slot_str=string_delete(slot_str,1,string_pos("\",slot_str));
if string_copy(temp_str,1,1)="%" temp_item[6]=temp_str;
 else temp_item[6]=real(temp_str);
 
//Dynamic value 4:
temp_str=string_copy(slot_str,1,string_pos("\",slot_str)-1);
slot_str=string_delete(slot_str,1,string_pos("\",slot_str));
if string_copy(temp_str,1,1)="%" temp_item[7]=temp_str;
 else temp_item[7]=real(temp_str);
 
//Dynamic value 5:
temp_str=string_copy(slot_str,1,string_pos("\",slot_str)-1);
slot_str=string_delete(slot_str,1,string_pos("\",slot_str));
if string_copy(temp_str,1,1)="%" temp_item[8]=temp_str;
 else temp_item[8]=real(temp_str);
 
//NOW THE SCRIPT ITERATES THROUGH THE INVENTORY IN ORDER TO FIND THE MATCHING ITEM:
for (i=1; i<=global.inventory_slots; i+=1) begin

 if global.inventory_current[i,1]=temp_item[1] and
    global.inventory_current[i,3]=temp_item[3] and
    global.inventory_current[i,4]=temp_item[4] and
    global.inventory_current[i,5]=temp_item[5] and
    global.inventory_current[i,6]=temp_item[6] and
    global.inventory_current[i,7]=temp_item[7] and
    global.inventory_current[i,8]=temp_item[8] then
    
    return i;

end;
