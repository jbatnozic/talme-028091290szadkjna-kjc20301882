///HG_type_set_shape(Type, Shape)
/*

 See Mercury's Manual, section "Types".

*/
var list;

if is_string(argument0)
 list=global.HG_TYPE_MAP[?argument0]
 else
  list=argument0;

list[|HG_TPROP.shape]=argument1;
