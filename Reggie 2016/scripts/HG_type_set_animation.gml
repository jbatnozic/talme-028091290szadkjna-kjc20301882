///HG_type_set_animation(Type, Frames, Speed, Phased)
/*

 See Mercury's Manual, section "Types".

*/
var list;

if is_string(argument0)
 list=global.HG_TYPE_MAP[?argument0]
 else
  list=argument0;

list[|HG_TPROP.frames]=argument1;
list[|HG_TPROP.speed]=argument2;
list[|HG_TPROP.phased]=argument3;
