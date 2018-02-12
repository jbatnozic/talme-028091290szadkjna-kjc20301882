///hg_tilemap_delete_tile(Map, X, Y)
/*

 Underlying HG script.

*/
var i,t,key,tile;

i=argument1;
t=argument2;

key="tile_"+string(i)+"_"+string(t);
       
if (ds_map_exists(argument0,key)=true) {
   
 tile=ds_map_find_value(argument0,key);
    
 if tile_exists(tile) 
  tile_delete(tile);
    
 ds_map_delete(argument0,key);
 
 }
