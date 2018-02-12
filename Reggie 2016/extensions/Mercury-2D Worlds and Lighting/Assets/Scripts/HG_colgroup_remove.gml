///HG_colgroup_remove(Group, Type)
/*

 See Mercury's Manual, section "Collisions".

*/
var i,list,type;

if is_string(argument0)
 list=global.HG_COLGROUP_MAP[?argument0]
 else
  list=argument0;
  
if is_string(argument1)
 type=global.HG_TYPE_MAP[?argument1]
 else
  type=argument1;
  
i=ds_list_find_index(list,type);

if i>=0
 ds_list_delete(list,i);
