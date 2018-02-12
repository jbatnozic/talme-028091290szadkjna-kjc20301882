///TPP_text_free(Grid ID)
/*

Frees the memory used by a ds_grid used to store
a piece of parsed text. Requires a Grid ID returned by
TPP_text_parse().

Returns: n/a

*/
var g;

g=argument0;

ds_list_destroy(g[#0,0]);
ds_grid_destroy(g);
