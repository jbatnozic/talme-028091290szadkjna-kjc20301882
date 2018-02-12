///hg_chunkmap_delete_region(Map, X1, X2, Y1, Y2, X Increment, Y Increment)
/*

 Underlying HG script.

*/
var i,t,key,surf;

for (i=argument1; i<=argument2; i+=argument5) begin
 for (t=argument3; t<=argument4; t+=argument6) begin
     
  key="surf_"+string(i)+"_"+string(t);
       
  if ds_map_exists(argument0,key)=true {
   
   surf=ds_map_find_value(argument0,key);
    
   if surface_exists(surf) 
    surface_free(surf);
    
   ds_map_delete(argument0,key);
    
   }
    
 end;
end;
