///hg_chunkmap_flush(World)
/*

 Underlying HG script.

*/
var i,t,w,h,map,key,surf;

w=hg_world_get_attribute(argument0,"width");
h=hg_world_get_attribute(argument0,"height");
map=hg_world_get_attribute(argument0,"chunkMap");

for (i=0; i<w; i+=1) begin
 for (t=0; t<h; t+=1) begin
     
  key="surf_"+string(i)+"_"+string(t);
       
  if ds_map_exists(map,key)=true {
   
   surf=ds_map_find_value(map,"surf_"+string(i)+"_"+string(t));
    
   if surface_exists(surf) 
    surface_free(surf);
    
   ds_map_delete(map,key);
    
   }
    
 end;
end;
