///repair_define_repair_item(Name, Potency)
/*

argument0 - (String)  Item name.
argument1 - (Integer) How much durability this item restores to another item.

Returns nothing.
*/

if repair_item_defined(argument0,argument1)=false {

 ds_map_delete(global.repair_map,argument0);
 ds_map_add(global.repair_map,argument0,argument1);
 
 }
