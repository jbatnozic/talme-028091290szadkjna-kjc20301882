///HG_type_alter_global_cval(Type, ValueIndex, Value)
/*

 See Mercury's Manual, section "Types".

*/
var list,map;

if is_string(argument0)
 list=global.HG_TYPE_MAP[?argument0]
 else
  list=argument0;
  

map=global.HG_GCVAL_MAP; 
 
map[?string(list)+"_"+string(argument1)]=argument2;
