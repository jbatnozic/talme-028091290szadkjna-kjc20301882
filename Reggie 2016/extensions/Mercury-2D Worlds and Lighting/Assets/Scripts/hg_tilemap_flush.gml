///hg_tilemap_flush(World)
/*

 Underlying HG script.

*/
var i,t,w,h,map,key,tile;

w=hg_world_get_attribute(argument0,"width");
h=hg_world_get_attribute(argument0,"height");
map=hg_world_get_attribute(argument0,"tileMap");

for (i=0; i<w; i+=1) begin
 for (t=0; t<h; t+=1) begin
     
  key="tile_"+string(i)+"_"+string(t);
       
  if ds_map_exists(map,key)=true {
   
   tile=ds_map_find_value(map,"tile_"+string(i)+"_"+string(t));
    
   if tile_exists(tile)
    tile_delete(tile);
    
   ds_map_delete(map,key);
    
   }
    
 end;
end;
