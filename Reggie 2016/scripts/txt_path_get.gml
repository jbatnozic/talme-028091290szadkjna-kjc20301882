///txt_path_get(Stage, Branch, Choice)
/*

*/
var a,suffix;

suffix="_s"+string(argument0)+"b"+string(argument1);

a[0]=txt_map_get("path_s_"+string(argument2)+suffix);
a[1]=txt_map_get("path_b_"+string(argument2)+suffix);

return a;
