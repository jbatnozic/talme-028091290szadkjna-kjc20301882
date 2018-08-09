///begin_background_switch(far_matrix, near_matrix)
/*
Returns: (bool) Success
*/

if (!is_array(argument0) &&
    !is_array(argument1) ) show_error("Can't change to empty background!", true);

if (is_array(obj_aux_controller.far_backgrounds_sw) ||
    is_array(obj_aux_controller.near_backgrounds_sw) ) return false;
    
obj_aux_controller.far_backgrounds_sw  = argument0;
obj_aux_controller.near_backgrounds_sw = argument1;;

return true;
