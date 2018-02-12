///inv_item_define(name, type, cost, weight, maxstack, objequipped, objdropped, desc, icon)
/*
THIS SCRIPT PREDEFINES AN ITEM'S STATIC VALUES FOR LATER USE:

NOTE: Item name and Description must NOT include double quotes and backslash ( " and \ ).

argument0 - (String)  Item name.
argument1 - (Integer) Item type.
argument2 - (Integer) Cost.
argument3 - (Integer) Weight.
argument4 - (Positive integer) Maximum stack (1 or more).
argument5 - (Integer) Object when equipped (-1 if can't equip).
argument6 - (Integer) Object when dropped.
argument7 - (String)  Description.
argument8 - (Integer) Icon.

Returns nothing.
*/
var item_code;

item_code=string(argument1)+"\"+
          string(argument2)+"\"+
          string(argument3)+"\"+
          string(argument4)+"\"+
          string(argument5)+"\"+
          string(argument6)+"\"+
                (argument7)+"\"+
          string(argument8)+"\";

ds_map_add(global.inventory_map,argument0,item_code);
