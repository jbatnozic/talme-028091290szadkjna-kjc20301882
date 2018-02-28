///rinv_lowest_null_slot(Start At, End At)
/*
Returns the slot number (Local ID) of the first NULL item encountered
within the given range, or -1 if none was found.
*/

for (var i = argument0; i <= argument1; i += 1) {

  if (rinv_item_is_null(-1, i)) return i;

  }
  
return -1;
