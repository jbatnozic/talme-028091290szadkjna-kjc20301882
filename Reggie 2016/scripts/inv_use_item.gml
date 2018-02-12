///inv_use_item(slot)
/*
THIS SCRIPT IS EXECUTED WHEN AN ITEM IS USED.

argument0 - (Integer) Index of the item to use.

Returns nothing.
*/
var __remove=false;

if argument0>0 name=global.inventory_current[argument0,1]
 else name=global.inventory_quick[-argument0,1];

//Item actions:
switch (name) begin

 case "Stimpack":
   buf_apply_buff((global.player_obj_id),BUFF_ID.stimpack,10);
   __remove=true;
  break;
  
 case "Relaxer":
   buf_apply_buff((global.player_obj_id),BUFF_ID.relaxer,25);
   __remove=true;
  break;
  
 case "Jitter":
   buf_apply_buff((global.player_obj_id),BUFF_ID.jitter,25);
   __remove=true;
  break;
 
 case "CTW":
   buf_apply_buff((global.player_obj_id),BUFF_ID.ctw,25);
   __remove=true;
  break;

 default:
  break;

end;

//Remove the item used if needed:
if __remove=true {
 inv_item_add_dynamic_value(abs(argument0),(argument0<0),0,-1);
 inv_refresh();
 }
