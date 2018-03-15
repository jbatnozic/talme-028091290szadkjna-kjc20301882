///_rinv_array_to_string(Array)
/*
Note: Only works if array elements are reals or strings.
*/
var len = array_length_1d(argument0);
var rv  = "";

for (var i = 0; i < len; i += 1) {

  var val = argument0[i];
  
  if (is_real(val)) {
  
    rv += "r";
    rv += chr(31);
    
    rv += string(val);
    rv += chr(31);
  
    }
  else if (is_string(val)) {
  
    rv += "s"; 
    rv += chr(31);
    
    rv += val;
    rv += chr(31);
  
    }
  else {
  
    show_error("rinv_array_to_string - can't convert this type (" + typeof(val) + ")", true);
  
    }

  }
  
return rv;





