///pspec_rinv_use_item(Inventory ID, Local ID)
/*
THIS SCRIPT IS EXECUTED WHEN AN ITEM IS USED.

Returns nothing.
*/
var doRemove = false;

if (argument0 == -1) argument0 = global.rinv_default_inst;

var static_id = rinv_local_to_static(argument0, argument1);

var iName = rinv_item_get_static_value(static_id, RINV_STATIC.name);

//Item actions:
switch (iName) begin

  case "Stimpack":
    buf_apply_buff((global.player_obj_id), BUFF_ID.stimpack, 10);
    doRemove = true;
    break;
   
  case "Relaxer":
    buf_apply_buff((global.player_obj_id), BUFF_ID.relaxer, 25);
    doRemove = true;
    break;
   
  case "Jitter":
    buf_apply_buff((global.player_obj_id), BUFF_ID.jitter, 25);
    doRemove = true;
    break;
  
  case "CTW":
    buf_apply_buff((global.player_obj_id), BUFF_ID.ctw, 25);
    doRemove = true;
    break;
  
  default:
    break;

end;

//Remove the item used if needed:
if (doRemove) {
  
  var amnt = rinv_item_get_amount(argument0, argument1);
  
  if (amnt > 1) {
  
    rinv_item_set_amount(argument0, argument1, amnt - 1);
  
    }
  else {
  
    _rinv_clear_slot(argument0, argument1);
  
    }

 }
 
 
 
 
 
 
 
