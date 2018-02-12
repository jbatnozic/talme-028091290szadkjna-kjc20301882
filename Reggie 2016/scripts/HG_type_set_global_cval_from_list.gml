///HG_type_set_global_cval_from_list(Type, List)
/*

 See Mercury's Manual, section "Types".

*/
var i,list,map;

if is_string(argument0)
 list=global.HG_TYPE_MAP[?argument0]
 else
  list=argument0;

map=global.HG_GCVAL_MAP;
    
for (i=0; i<ds_list_size(argument1); i+=1) begin

 map[?string(list)+"_"+string(i)]=argument1[|i];

end;
