///HG_type_get_global_cval(Type, ValueIndex)
/*

 See Mercury's Manual, section "Types".

*/
var i,list,map;

if is_string(argument0)
 list=global.HG_TYPE_MAP[?argument0]
 else
  list=argument0;
 
map=global.HG_GCVAL_MAP;

return map[?string(list)+"_"+string(argument1)];
