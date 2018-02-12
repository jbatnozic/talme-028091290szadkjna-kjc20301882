///crafting_initialise()
/*
INITIALISES THE CRAFTING SYSTEM AND BASIC CRAFTING RECIPES.

No arguments.

Returns nothing.
*/

//BASIC SETUP:
global.crafting_recipes=ds_list_create();

//HERE WE DEFINE THE CRAFTING RECIPES THE PLAYER CAN USE:
//NOTE: These recipes will always be available. The ones which need to be learned in 
//order to be used will have to be defined elsewhere.

crafting_create_recipe("Jar",1,"Dirt",5,"Human heart",1);
