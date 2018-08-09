///begin_background_switch(r, g, b, a)
/*
Returns: (bool) Success
*/

if (obj_aux_controller.amb_switch_flag) return false;
    
obj_aux_controller.amb_color_sw = make_colour_rgb(argument0, argument1, argument2);
obj_aux_controller.amb_alpha_sw = argument3;
obj_aux_controller.amb_switch_amount = 0;
obj_aux_controller.amb_switch_flag = true;

return true;
