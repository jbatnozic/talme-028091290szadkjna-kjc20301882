///txt_load_from_file(file name)
/*

argument0 - name of the file to read from (including the .txt suffix)

*/

var file, line, len, mode, pcode, scode, arr, cnt, ordinal;

// Modes: 0 = Add, 1 = Set path

file = file_text_open_read(argument0);

if (file == -1) show_error("Could not open file: " + argument0, true);

ordinal = 0;

while (!file_text_eof(file)) {

  ordinal += 1;

  line = file_text_readln(file);
  
  if (string_copy(line, string_length(line) - 1, 2) == (chr(13) + chr(10))) { // Remove CRLF if needed
  
    line = string_crop(string_delete(line, string_length(line) - 1, 2)); // On Windows, \n is CRLF (2 characters) so
                                                                        // we need to remove 2 from the end
    }
  else
    line = string_crop(line);
  
  //for (var j = 1; j <= string_length(line); j+= 1)
  //  show_message(ord(string_char_at(line, j)));
  //show_message(string(string_pos(chr(10), line)) + " in line " + string(ordinal));
  //if (true) show_message(ord(string_char_at(line, string_length(line))));
  
  len = string_length(line);
  
  if (line == "") continue; // BLANK LINE - OK
  
  if (string_char_at(line, 1) == "{") { // TEXT - OK
  
    var t = string_length(line);
    
    while (string_char_at(line, t) != "}") t -= 1;
    
    arr[cnt] = string_copy(line, 2, t - 2);
    
    if (string_pos("EOP", string_delete(line, 1, t)) != 0) {
      arr[cnt] += "{End}";
      }
      
    cnt += 1;
  
    }
  else if (string_copy(line, 1, 2) == "IF") { // IF ... SHOW - OK
  
    var show_pos = string_pos("SHOW", line);
    
    var cond = string_copy(line, 3, show_pos - 3);
    
    var i, t;
    
    for (i = show_pos + 4; i <= len; i += 1) {
      if (string_char_at(line, i) == "{") break;
      }
      
    for (t = len; t > i; t -= 1) {
      if (string_char_at(line, i) == "{") break;
      }
      
    arr[cnt] = cond + "{Cdt}" + string_copy(line, i + 1, t - (i + 1));
    
    if (string_pos("EOP", string_delete(line, 1, t)) != 0) {
      arr[cnt] += "{End}";
      }
      
    cnt += 1;
  
    }
  else if (string_copy(line, 1, 2) == "//") { // COMMENT - OK
    // Skip
    }
  else if (string_copy(line, 1, 3) == "END") { // END - OK
  
    if (mode == 0) {
    
      txt_add_array(pcode, scode, cnt - 1, arr);
    
      }
  
    }
  else if (string_copy(line, 1, 4) == "PATH") { // PATH - OK
  
    var arrow_pos = string_pos("->", line);
    
    var comma_pos = string_pos(",", line);
  
    var choice = real( string_copy(line, 5, arrow_pos - 5) ),
        stage  = real( string_copy(line, arrow_pos + 2, comma_pos - (arrow_pos + 2)) ),
        branch = real( string_delete(line, 1, comma_pos) );
        
    mode = 1;
    
    //show_message("Added path to last -> " + string(stage) + ", " + string(branch));
    
    txt_path_to_last(choice, stage, branch);
    
    }
  else {
  
    var temp = string_copy(line, 1, 5);
    
    if (temp == "BEGIN") { // BEGIN - OK
    
      mode = 0;
      cnt  = 0;
      
      pcode = "";
      scode = "";
    
      }
    else if (temp == "PCODE") { // PCODE - OK
    
      pcode = string_delete(line, 1, 5);
    
      }
    else if (temp == "SCODE") { // SCODE - OK
    
      scode = string_delete(line, 1, 5);
    
      }
    else if (temp == "JMPIF") { // JMPIF - OK
    
      var arrow_pos = string_pos("->", line);
    
      var cond = string_copy(line, 6, arrow_pos - 6);
      
      if (NSP_evaluate(cond)) {
        
        line = string_delete(line, 1, arrow_pos + 1);
      
        var comma_pos = string_pos(",", line);
        
        var stage  = real( string_copy(line, 1, comma_pos - 1) ),
            branch = real( string_delete(line, 1, comma_pos) );
        
        txt_map_set("begin_stage",  stage);
        txt_map_set("begin_branch", branch);
        
        //show_message("JMPIF set begin stage / branch to [" + string(stage) + ", " + string(branch) + "].");
            
        }
    
      }
    else { // ERROR - OK
    
      file_text_close(file);
      show_error("Dialog code error in line " + string(ordinal) + ": (" + line + ")", true);
    
      }
  
    }

  }
  
file_text_close(file);
