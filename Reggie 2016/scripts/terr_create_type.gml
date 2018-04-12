///terr_create_type(Name, [TERRAIN enum] ID)
/*

*/
var rv;

rv = HG_type_create(argument0);

terrainType[argument1] = rv;

global.terr_reverse_map[?rv] = argument1;

return rv;

