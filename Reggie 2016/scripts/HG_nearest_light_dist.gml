///HG_nearest_light_dist(pos_x,pos_y)
/*

*/
var i,d,world,ls,ld,li,gq,min_dist;

world=global.HG_DEFAULT_WORLD;

ls=hg_world_get_attribute(world,"lightListStatic");
ld=hg_world_get_attribute(world,"lightListDynamic");
li=hg_world_get_attribute(world,"lightListSimple");
gq=hg_world_get_attribute(world,"lightGridQuick");

min_dist=10000;

for (i=0; i<ds_list_size(ls); i+=1) {

 d=point_distance(argument0,
                  argument1,
                  ds_list_find_value(ls[|i],HG_LPROP.xPos),
                  ds_list_find_value(ls[|i],HG_LPROP.yPos));
                  
 if (d<min_dist) min_dist=d;

 }
 
for (i=0; i<ds_list_size(ld); i+=1) {

 d=point_distance(argument0,
                  argument1,
                  ds_list_find_value(ld[|i],HG_LPROP.xPos),
                  ds_list_find_value(ld[|i],HG_LPROP.yPos));
                  
 if (d<min_dist) min_dist=d;
 
 }
 
for (i=0; i<ds_list_size(li); i+=1) {

 d=point_distance(argument0,
                  argument1,
                  ds_list_find_value(li[|i],HG_LPROP.xPos),
                  ds_list_find_value(li[|i],HG_LPROP.yPos));
                  
 if (d<min_dist) min_dist=d;

 }
 
for (i=0; i<ds_grid_height(gq); i+=1) {

 d=point_distance(argument0,
                  argument1,
                  gq[#0,i],
                  gq[#1,i]);
                  
 if (d<min_dist) min_dist=d;

 }
 
return min_dist;
