///shop_write(Index)
/*
THIS SCRIPT SAVES THE INVENTORY OF THE CURRENTLY OPENED SHOP TO A STRING AND STORES IT AS A PART OF
global.barter_string; USE shop_read(...) TO ACCESS THE DATA.

NOTE: Format - %[Index]b%[Item name]|[Amount]\...%[Index]e%

argument0 - (Integer) Index of the shop being saved.

Returns nothing.
*/
var pos1,pos2,current,save_str;

//Remove the old entry in global.barter_string:
pos1=string_pos("%"+string(argument0)+"b%",global.barter_string);                   

pos2=string_pos("%"+string(argument0)+"e%",global.barter_string)+string_length(string(argument0))+1;

global.barter_string=string_delete(global.barter_string,pos1,pos2-pos1+2);

//Generate a new entry:
save_str="";
current=ds_map_find_first(global.barter_map);

while (true) begin

 save_str+="["+current+"]|["+string(ds_map_find_value(global.barter_map,current))+"]\";
 
 if ds_map_find_last(global.barter_map)=current break;
  else current=ds_map_find_next(global.barter_map,current)

end;

global.barter_string+="%"+string(argument0)+"b%"+save_str+"%"+string(argument0)+"e%";
