///pspec_pickup_init(ItemName, Amount, [OPT] DynVal 1, ...)
/*

*/

var static_id = rinv_item_get_static_id(argument[0]);

var iComplex  = rinv_item_get_static_value(static_id, RINV_STATIC.complex);

_mode = iComplex; // 0 = simple, 1 = complex

_itemName = argument[0];
_amount   = argument[1];

if (!iComplex) {

  _customValue = undefined;

  }
else {

  if (argument_count > 2) {
  
    for (var i = 2; i < argument_count; i += 1) {
    
      _customValue[i - 2] = argument[i];
    
      }
      
    }
  else {
  
    _customValue = undefined;
  
    }

  }

// Sprite stuff:
sprite_index = rinv_item_get_static_value(static_id, RINV_STATIC.objwd);

mask_index = sprite_index;

_width  = sprite_get_bbox_right(mask_index) -
          sprite_get_bbox_left(mask_index);
          
_height = sprite_get_bbox_bottom(mask_index) -
          sprite_get_bbox_top(mask_index);

colrec_w = _width;
