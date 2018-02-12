///repair_initialise()
/*
INITIALISES THE REPAIR SYSTEM.

No arguments.

Returns nothing.
*/

//BASIC SETUP:
global.repair_map=ds_map_create();
global.repair_map_a=ds_map_create();

//REPAIR ITEMS:
repair_define_repair_item("Spare parts",25);

//ARMOUR REPAIR ITEMS:
repair_define_repair_item_a("Spare parts",8);
