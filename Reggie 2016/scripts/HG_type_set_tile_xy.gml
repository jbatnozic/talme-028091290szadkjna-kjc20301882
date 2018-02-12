///HG_type_set_tile_xy(Type, Background, Size, X, Y, Separation, Padding)
/*

 See Mercury's Manual, section "Types".

*/
var list;

if is_string(argument0)
 list=global.HG_TYPE_MAP[?argument0]
 else
  list=argument0;

list[|HG_TPROP.tileBck]=argument1;

var size=argument2,
    sep=argument5,
    xx=argument3,
    yy=argument4,
    left=xx*(size+sep),
    top=yy*(size+sep);

list[|HG_TPROP.tileL]=left;
list[|HG_TPROP.tileT]=top;
list[|HG_TPROP.tileW]=size;
list[|HG_TPROP.tileH]=size;
list[|HG_TPROP.padding]=argument6;
list[|HG_TPROP.sep]=sep;
