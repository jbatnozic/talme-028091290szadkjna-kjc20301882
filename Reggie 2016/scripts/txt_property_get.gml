///txt_property_get(Stage, Branch, Property)
/*

*/
var suffix,key;

suffix="_s"+string(argument0)+"b"+string(argument1);

     if argument2=TEXTBOX.main key= "main"+suffix;

else if argument2=TEXTBOX.code_p key= "code_p"+suffix;

else if argument2=TEXTBOX.code_s key= "code_s"+suffix;

else if argument2=TEXTBOX.choices key= "choices"+suffix;

else if argument2=TEXTBOX.branches key= "branches"+suffix;

else show_error("Unknown property: "+string(argument2),false);

return txt_map_get(key);
