///repair_define_repair_item_a(Name, Potency)
/*
NOTE: For armour.

argument0 - (String)  Item name.
argument1 - (Integer) How much durability this item restores to another item.

Returns nothing.
*/

if repair_item_defined_a(argument0,argument1)=false {

 ds_map_delete(global.repair_map_a,argument0);
 ds_map_add(global.repair_map_a,argument0,argument1);
 
 }
