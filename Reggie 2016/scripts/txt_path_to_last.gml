///txt_path_to_last(Choice, New Stage, New Branch)
/*
Changes the path of one of the choices of the last added entry.
*/
var suffix;

suffix="_s"+string(txt_map_get("stage_prev"))+"b"+string(txt_map_get("branch_prev"));

txt_map_set("path_s_"+string(argument0)+suffix,argument1);
txt_map_set("path_b_"+string(argument0)+suffix,argument2);
