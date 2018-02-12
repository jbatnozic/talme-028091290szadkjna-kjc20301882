///inv_item_get_static_value(name/index, value)
/*
THIS SCRIPT FETCHES A STATIC VALUE OF A PREDEFINED ITEM:
(The said item does not need to be present in the player's inventory.)

argument0 - (String)  Item name OR [Integer] Item index in the current inventory.
argument1 - (Integer)  Value to get:
             0. Type
             1. Cost
             2. Weight
             3. Max stack
             4. Object when equipped
             5. Object when dropped
             6. Description
             7. Icon sprite_index

Returns - Requested value as a STRING
*/

var temp_code,value;

if is_string(argument0)
 temp_code=ds_map_find_value(global.inventory_map,argument0)
 else temp_code=global.inventory_current[argument0,2];
 
if argument1>0 repeat (argument1) begin
temp_code=string_delete(temp_code,1,string_pos("\",temp_code))
end;

value=string_copy(temp_code,1,string_pos("\",temp_code)-1);

return value;
