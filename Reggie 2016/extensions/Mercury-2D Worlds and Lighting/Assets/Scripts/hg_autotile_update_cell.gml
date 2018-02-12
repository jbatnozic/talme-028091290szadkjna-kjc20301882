///hg_autotile_update_cell(World, X, Y)
/*

 Underlying HG script.

*/
var i,t,cs;
var indgrid,surgrid,list,type;

cs=hg_world_get_attribute(argument0,"cellSize");

indgrid=argument0[?"index"];
surgrid=hg_world_get_attribute(argument0,"surroundGrid");

i=argument1;
t=argument2;

begin
 
  type=indgrid[#i,t];
  
  list=type[|HG_TPROP.atList];
  
  if ((type[|HG_TPROP.frames]>1 and type[|HG_TPROP.speed]>0) or list=-1) exit;
 
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





