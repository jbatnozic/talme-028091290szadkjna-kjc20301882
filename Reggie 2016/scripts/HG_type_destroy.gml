///HG_type_destroy(Type, DestroyAtList)
/*

 See Mercury's Manual, section "Types".

*/
var list,name;

if is_string(argument0) {

 name=argument0;
 list=global.HG_TYPE_MAP[?name];

 }
 else {
 
  list=argument0;
  name=hg_ds_map_find_key(global.HG_TYPE_MAP,list);
 
  }
  
if (argument1=true) {

 if (list[|HG_TPROP.atList]<>-1 and ds_exists(list[|HG_TPROP.atList],ds_type_list))
  ds_list_destroy(list[|HG_TPROP.atList]);

 }
  
ds_list_destroy(list);
ds_map_delete(global.HG_TYPE_MAP,name);
