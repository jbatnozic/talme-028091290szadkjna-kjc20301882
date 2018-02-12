///HG_type_set_global_cval(Type, Value 1, [OPT] Further values)
/*

 See Mercury's Manual, section "Types".

*/
var i,list,map;

if is_string(argument[0])
 list=global.HG_TYPE_MAP[?argument[0]]
 else
  list=argument[0];
 
map=global.HG_GCVAL_MAP; 
 
for (i=1; i<argument_count; i+=1) begin

 map[?string(list)+"_"+string(i-1)]=argument[i];

end;
