///HG_colgroup_destroy(Group)
/*

 See Mercury's Manual, section "Collisions".

*/
var list;

if is_string(argument0)
 list=global.HG_COLGROUP_MAP[?argument0]
 else
  list=argument0;
  
ds_list_destroy(list);

