///hg_tilemap_delete_region(Map, X1, X2, Y1, Y2)
/*

 Underlying HG script.

*/
var i,t,key,tile;

for (i=argument1; i<=argument2; i+=1) begin
 for (t=argument3; t<=argument4; t+=1) begin
     
  key="tile_"+string(i)+"_"+string(t);
       
  if ds_map_exists(argument0,key)=true {
   
   tile=ds_map_find_value(argument0,key);
    
   if tile_exists(tile) 
    tile_delete(tile);
    
   ds_map_delete(argument0,key);
    
   }
    
 end;
end;
