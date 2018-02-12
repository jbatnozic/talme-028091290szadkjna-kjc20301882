///HG_type_set_cval_from_list(Type, List)
/*

 See Mercury's Manual, section "Types".

*/
var i,list;

if is_string(argument0)
 list=global.HG_TYPE_MAP[?argument0]
 else
  list=argument0;
  
for (i=0; i<ds_list_size(argument1); i+=1) begin

 list[|HG_TPROP.custv1+i]=argument1[|i];

end;
