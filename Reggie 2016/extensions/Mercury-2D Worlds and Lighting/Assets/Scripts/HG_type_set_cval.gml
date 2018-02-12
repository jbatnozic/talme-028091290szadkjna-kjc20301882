///HG_type_set_cval(Type, Value 1, [OPT] Further values)
/*

 See Mercury's Manual, section "Types".

*/
var i,list;

if is_string(argument[0])
 list=global.HG_TYPE_MAP[?argument[0]]
 else
  list=argument[0];
  
for (i=1; i<argument_count; i+=1) begin

 list[|HG_TPROP.custv1+i-1]=argument[i];

end;
