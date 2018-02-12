///HG_type_create(Name)
/*

 See Mercury's Manual, section "Types".

*/
var i,list;

list=ds_list_create();

list[|HG_TPROP.shape]=HG_SHAPE.empty;;
list[|HG_TPROP.shadowStr]=0;
list[|HG_TPROP.shadowCol]=c_black;
list[|HG_TPROP.sprite]=-1;
list[|HG_TPROP.tileBck]=-1;
list[|HG_TPROP.tileL]=0;
list[|HG_TPROP.tileT]=0;
list[|HG_TPROP.tileW]=0;
list[|HG_TPROP.tileH]=0;
list[|HG_TPROP.padding]=0;
list[|HG_TPROP.frames]=1;
list[|HG_TPROP.speed]=0;
list[|HG_TPROP.depth]=0;
list[|HG_TPROP.atList]=-1;

global.HG_TYPE_MAP[?argument0]=list;

return list;
