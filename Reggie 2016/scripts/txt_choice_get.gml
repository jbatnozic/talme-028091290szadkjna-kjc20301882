///txt_choice_get(Stage, Branch, Index)
/*

*/
var suffix,key;

suffix="_s"+string(argument0)+"b"+string(argument1);

key="choice_"+string(argument2)+suffix;

return txt_map_get(key);
