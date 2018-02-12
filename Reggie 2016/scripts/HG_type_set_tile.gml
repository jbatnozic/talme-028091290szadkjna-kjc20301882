///HG_type_set_tile(Type, Background, Size, Left, Top, Separation, Padding)
/*

 See Mercury's Manual, section "Types".

*/
var list;

if is_string(argument0)
 list=global.HG_TYPE_MAP[?argument0]
 else
  list=argument0;

list[|HG_TPROP.tileBck]=argument1;
list[|HG_TPROP.tileW]=argument2;
list[|HG_TPROP.tileH]=argument2;
list[|HG_TPROP.tileL]=argument3;
list[|HG_TPROP.tileT]=argument4;
list[|HG_TPROP.sep]=argument5;
list[|HG_TPROP.padding]=argument6;
