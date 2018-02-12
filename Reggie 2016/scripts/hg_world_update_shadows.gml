///hg_world_update_shadows(World, Origin X, Origin Y, Grid Coords, AdditionalRange)
/*

 Underlying HG script.

*/
var i,xx,yy,hcs,list,size,light,ar;

hcs=hg_world_get_attribute(argument0,"cellSize")/2;

if argument3=true {
 argument1*=(hcs*2);
 argument2*=(hcs*2);
 }
 
ar=argument4-hg_world_get_attribute(argument0,"lightTrunc")*hcs*2; 

//Dynamic lights:
list=hg_world_get_attribute(argument0,"lightListDynamic");
for (i=0; i<ds_list_size(list); i+=1) begin

 light=list[|i];
 
 size=sprite_get_width(light[|HG_LPROP.sprite])*light[|HG_LPROP.scale]/2+ar;
 xx=light[|HG_LPROP.xPos];
 yy=light[|HG_LPROP.yPos];
  
 if point_in_rectangle(argument1,argument2,xx-size,yy-size,xx+size,yy+size)
  hg_light_update(light);

end;

//Static lights:
list=hg_world_get_attribute(argument0,"lightListStatic");
for (i=0; i<ds_list_size(list); i+=1) begin

 light=list[|i];
 
 size=sprite_get_width(light[|HG_LPROP.sprite])*light[|HG_LPROP.scale]/2+ar;
 xx=light[|HG_LPROP.xPos];
 yy=light[|HG_LPROP.yPos];
  
 if point_in_rectangle(argument1,argument2,xx-size,yy-size,xx+size,yy+size)
  hg_light_update(light);

end;
