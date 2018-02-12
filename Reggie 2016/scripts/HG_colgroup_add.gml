///HG_colgroup_add(Group, Type1, [OPT] Further Types...)
/*

 See Mercury's Manual, section "Collisions".

*/
var i,list;

if is_string(argument[0])
 list=global.HG_COLGROUP_MAP[?argument[0]]
 else
  list=argument[0];
  
for (i=1; i<argument_count; i+=1) begin

 if is_string(argument[i])
  ds_list_add(list,global.HG_TYPE_MAP[?argument[i]])
  else
   ds_list_add(list,argument[i]);

end;
