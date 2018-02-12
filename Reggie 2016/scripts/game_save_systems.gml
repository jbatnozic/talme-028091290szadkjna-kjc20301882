///game_save_systems(Name)
/*

*/

ini_open(argument0+"_save_ini.ini");

//Inventory:
ini_write_string("INVENTORY","ITEMS",inv_write());

//Shops:
ini_write_string("SHOPS","INV",global.barter_string);

//Journal:
ini_write_string("JOURNAL","GRID",journal_write(0));
ini_write_string("JOURNAL","LIST",journal_write(1));

//Terrain:
ini_write_string("TERR","TYP",terr_write(0));

//Pathfinding grid:
ini_write_string("PATHFINDING","GRID",pfd_write());

//Special events:
//ini_write_string("SEV","MAP",sev_write());

//Heart:
 //STUB

ini_close();
