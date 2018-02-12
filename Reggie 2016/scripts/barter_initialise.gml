///barter_initialise()
/*
INITIALISES THE BARTER SYSTEM AND SHOPS' DEFAULT VALUES.

No arguments.

Returns nothing.
*/

//BASIC SETUP:
enum SHOP_INDEX {
 default_shop,
 }
 
global.barter_map=-1;
global.barter_list=-1;
global.barter_string="";

//HERE WE SET UP SHOPS AS THEY ARE WHEN A NEW GAME STARTS:
shop_initialise(SHOP_INDEX.default_shop);
 //OPTIONAL - shop_add_item(SHOP_INDEX.default_shop,"Dirt",5); etc.
 shop_add_item(SHOP_INDEX.default_shop,"Dirt",100);
 shop_add_item(SHOP_INDEX.default_shop,"Jar",100);
 shop_add_item(SHOP_INDEX.default_shop,"Human heart",100);
 shop_add_item(SHOP_INDEX.default_shop,"Bullets",100);
