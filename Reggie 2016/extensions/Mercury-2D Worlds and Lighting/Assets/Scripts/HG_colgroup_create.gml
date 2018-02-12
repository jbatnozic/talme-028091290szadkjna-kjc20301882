///HG_colgroup_create(Name, [OPT] Type1, [OPT] Further types...)
/*

 See Mercury's Manual, section "Collisions".

*/
var i,list;

list=ds_list_create();

for (i=1; i<argument_count; i+=1) begin

 HG_colgroup_add(list,argument[i]);

end;

global.HG_COLGROUP_MAP[?argument[0]]=list;

return list;
