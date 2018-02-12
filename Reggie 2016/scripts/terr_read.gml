///terr_read(Stage, String)
/*

*/
var world,w,h;

world=global.HG_DEFAULT_WORLD;
w=hg_world_get_attribute(world,"width");
h=hg_world_get_attribute(world,"height");

switch (argument0) begin

 case 0:
   
   var i,t,g;
   
   g=ds_grid_create(w,h);
   
   ds_grid_read(g,argument1);
 
   for (t=0; t<h; t+=1) {
    for (i=0; i<w; i+=1) {
    
     HG_cell_set_type(world,i,t,g[#i,t],true);
    
     }
    }
    
   ds_grid_destroy(g);
    
   exit;
 
  break;
  
 default:
  break;

end;
