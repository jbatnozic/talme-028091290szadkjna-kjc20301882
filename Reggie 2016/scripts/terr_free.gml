///terr_free()
/*
Frees Mercury with all the Types.
*/

HG_free();

ds_map_destroy(global.terr_reverse_map);

terrainType = 0;
