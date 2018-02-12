///game_load_systems(Name)
/*

*/

if !file_exists(argument0+"_save_ini.ini")
 show_error("File missing! "+argument0,true);

ini_open(argument0+"_save_ini.ini");

//Inventory:
var s=ini_read_string("INVENTORY","ITEMS","");
inv_read(s);

//Shops:
global.bater_string=ini_read_string("SHOPS","INV","");

//Journal:
journal_read(0,ini_read_string("JOURNAL","GRID",""));
journal_read(1,ini_read_string("JOURNAL","LIST",""));

//Terrain:
var s=ini_read_string("TERR","TYP","dostaBrusLi");
terr_read(0,s);

//Pathfinding:
pfd_read(ini_read_string("PATHFINDING","GRID",""));

//Special events:
//sev_read(ini_read_string("SEV","MAP",""));

//Heart:
 //STUB

ini_close();
