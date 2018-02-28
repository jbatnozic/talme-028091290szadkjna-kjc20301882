///_rinv_string_to_array(String)
/*

*/
var work_str = argument0;

var arr_cnt = 0;

var array;

while (string_length(work_str) > 0) {

  var rs_pos, rs_cnt = 0, len = string_length(work_str);

  rs_pos[1] = -1;
  
  // Find two Record Separators:
  for (var i = 1; i <= len; i += 1) {
  
    if (string_char_at(work_str, i) == chr(31)) {
    
      rs_pos[rs_cnt] = i;
      
      rs_cnt += 1;
      
      if (rs_cnt == 2) break;
    
      }
  
    }
    
  if (rs_cnt != 2) show_error("rinv_string_to_array - corrupted string", true);
    
  // Extract the values:
  var type = string_char_at(work_str, rs_pos[0] - 1);
      
  var val  = string_copy(work_str, rs_pos[0] + 1, rs_pos[1] - (rs_pos[0] + 1));
  
  if (type == "s")
    array[arr_cnt] = val;
  else
    array[arr_cnt] = real(val);
    
  arr_cnt += 1;
  
  // Adjust work_str:
  work_str = string_delete(work_str, 1, rs_pos[1]);

  }
  
return array;
