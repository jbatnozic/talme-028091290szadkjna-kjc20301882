///shop_start()
/*
THIS SCRIPT WILL PREPARE THE SYSTEM FOR OPENING A BARTER INTERFACE WINDOW.

NOTE: The opened shop will not offer any deals until they are added using the
      shop_add_barter_item(...) script. After opening the shop you must use
      shop_read(...) to load its preset or previously saved inventory.

No arguments.

Returns nothing.
*/

global.barter_list=ds_list_create();
global.barter_map=ds_map_create();
