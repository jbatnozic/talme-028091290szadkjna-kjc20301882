///terr_write(Stage)
/*

*/
var world,w,h;

world=global.HG_DEFAULT_WORLD;
w=hg_world_get_attribute(world,"width");
h=hg_world_get_attribute(world,"height");

switch (argument0) begin

 case 0:
   
   var i,t,g,s;
   
   g=ds_grid_create(w,h);
 
   for (t=0; t<h; t+=1) {
    for (i=0; i<w; i+=1) {
    
     g[#i,t]=HG_cell_get_type(world,i,t,true);
    
     }
    } 
    
    s=ds_grid_write(g);
    
    ds_grid_destroy(g);
    
    return s;
 
  break;
  
 default:
  break;

end;
