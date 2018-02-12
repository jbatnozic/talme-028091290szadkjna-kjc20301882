///HG_type_set_tile_n(Type, Background, Size, N, Separation, Padding)
/*

 See Mercury's Manual, section "Types".

*/
var list;

if is_string(argument0)
 list=global.HG_TYPE_MAP[?argument0]
 else
  list=argument0;

list[|HG_TPROP.tileBck]=argument1;

var n=argument3,
    size=argument2,
    sep=argument4,
    tx=floor((background_get_width(argument1)+sep)/(size+sep)),
    xx=n mod tx,
    yy=n div tx,
    left=xx*(size+sep),
    top=yy*(size+sep);

list[|HG_TPROP.tileL]=left;
list[|HG_TPROP.tileT]=top;
list[|HG_TPROP.tileW]=size;
list[|HG_TPROP.tileH]=size;
list[|HG_TPROP.padding]=argument5;
list[|HG_TPROP.sep]=sep;
