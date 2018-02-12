///hg_autotile_update_region(World, X1, Y1, X2, Y2)
/*

 Underlying HG script.

*/
var i,t,ww,wh,cs;
var indgrid,surgrid,list,type;

ww=hg_world_get_attribute(argument0,"width");
wh=hg_world_get_attribute(argument0,"height");
cs=hg_world_get_attribute(argument0,"cellSize");

indgrid=argument0[?"index"];
surgrid=hg_world_get_attribute(argument0,"surroundGrid");

for (t=max(argument2,0); t<=min(argument4,wh-1); t+=1) begin
 for (i=max(argument1,0); i<=min(argument3,ww-1); i+=1) begin
 
  type=indgrid[#i,t];
  
  list=type[|HG_TPROP.atList];
  
  if ((type[|HG_TPROP.frames]>1 and type[|HG_TPROP.speed]>0) or list=-1) continue;
 
  switch (surgrid[#i,t]) begin
  
   case 0000: n=list[|HG_ATL.at_0000]; break;
   case 0001: n=list[|HG_ATL.at_0001]; break;
   case 0010: n=list[|HG_ATL.at_0010]; break;
   case 0011: n=list[|HG_ATL.at_0011]; break;
   case 0100: n=list[|HG_ATL.at_0100]; break;
   case 0101: n=list[|HG_ATL.at_0101]; break;
   case 0110: n=list[|HG_ATL.at_0110]; break;
   case 0111: n=list[|HG_ATL.at_0111]; break;
   case 1000: n=list[|HG_ATL.at_1000]; break;
   case 1001: n=list[|HG_ATL.at_1001]; break;
   case 1010: n=list[|HG_ATL.at_1010]; break;
   case 1011: n=list[|HG_ATL.at_1011]; break;
   case 1100: n=list[|HG_ATL.at_1100]; break;
   case 1101: n=list[|HG_ATL.at_1101]; break;
   case 1110: n=list[|HG_ATL.at_1110]; break;
   case 1111: n=list[|HG_ATL.at_1111]; break;
   
   default:
    break;
  
  end;
  
  hg_autotile_tile_set_index(argument0,i,t,type,n,cs);
 
 end;
end;
