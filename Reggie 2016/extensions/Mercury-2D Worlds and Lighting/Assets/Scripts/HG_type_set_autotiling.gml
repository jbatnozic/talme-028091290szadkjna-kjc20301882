///HG_type_set_autotiling(Type, TileList)
/*

 See Mercury's Manual, section "Types".

*/
var type;

if is_string(argument0)
 type=global.HG_TYPE_MAP[?argument0]
 else
  type=argument0;
  
type[|HG_TPROP.atList]=argument1;
