///vprint(...)
/*

*/

var s = "";

for (var i = 0; i < argument_count; i += 1) {

    var val = argument[i];

    if (is_string(val)) {
        s += val;
        }
    else if (is_real(val)) {
        s += string(val);
        }
    else if (is_undefined(val)) {
        s += "undefined";
        }
    else if (is_array(val)) {
        s += array_to_string_1d(val);
        }
    else {
        show_error("vprint() - unsupported type in argument", true);
        }

    }
    
show_message(s);
