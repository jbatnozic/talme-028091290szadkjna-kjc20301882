///array_to_string_1d(array)
/*

*/

var s = "";

var arr = argument0;

var len = array_length_1d(arr);

for (var i = 0; i < len; i += 1) {

    var val = arr[i];

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
        show_error("array_to_string_1d() - unsupported type in array", true);
        }
        
    if (i < (len - 1)) s += ", ";

    }
    
return ("[" + s + "]");
