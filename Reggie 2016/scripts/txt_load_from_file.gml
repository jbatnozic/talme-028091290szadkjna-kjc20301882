///txt_load_from_file(file name)
/*

argument0 - name of the file to read from (including the .txt suffix)

*/

var file, line, len, mode, pcode, scode, arr, cnt, ordinal;

var newline = chr(13) + chr(10); // CRLF on Windows
var nl_len  = string_length(newline);
var disable_jmpif = false;

// Modes: 0 = Add, 1 = Set path

file = file_text_open_read(argument0);

if (file == -1) show_error("Could not open file: " + argument0, true);

ordinal = 0;

while (!file_text_eof(file)) {

  ordinal += 1;

  line = file_text_readln(file);
  
  if (string_copy(line, string_length(line) - 1, 2) == newline) { // Remove newline if needed
    line = string_crop(string_delete(line, string_length(line) - (nl_len - 1), nl_len));
    }
  else
    line = string_crop(line);
  
  len = string_length(line);
  
  if (line == "") continue; // BLANK LINE - OK
  
  if (string_char_at(line, 1) == "{") { // TEXT - OK
  
    var t;
    
    while (true) {
    
      t = string_length(line);
    
      while (t >= 1 && string_char_at(line, t) != "}") t -= 1;
      
      if (t < 1) { // Read and append another line
      
        if (!file_text_eof(file))
          line += file_text_readln(file);
        else {
          file_text_close(file);
          show_error("txt_load_from_file - Unclosed { found, end of file reached.", true);
          }
      
        // Remove newline if needed:
        if (string_copy(line, string_length(line) - 1, 2) == newline) { 
          line = string_crop(string_delete(line, string_length(line) - (nl_len - 1), nl_len));
          }
        else
          line = string_crop(line);
          
        }
      else break;
      
      }
      
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
      
    while (true) {
    
      t = string_length(line);
    
      while (t >= 1 && string_char_at(line, t) != "}") t -= 1;
      
      if (t < 1) { // Read and append another line
      
        if (!file_text_eof(file))
          line += file_text_readln(file);
        else {
          file_text_close(file);
          show_error("txt_load_from_file - Unclosed { found, end of file reached.", true);
          }
      
        // Remove newline if needed:
        if (string_copy(line, string_length(line) - 1, 2) == newline) { 
          line = string_crop(string_delete(line, string_length(line) - (nl_len - 1), nl_len));
          }
        else
          line = string_crop(line);
          
        }
      else break;
      
      }
      
    arr[cnt] = cond + "{Cdt}" + string_copy(line, i + 1, t - (i + 1));
    
    if (string_pos("EOP", string_delete(line, 1, t)) != 0) {
      arr[cnt] += "{End}";
      }
      
    cnt += 1;
  
    }
  else if (string_copy(line, 1, 2) == "//") { // COMMENT - OK
    // Ignore
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
    
      pcode += string_delete(line, 1, 5);
    
      }
    else if (temp == "SCODE") { // SCODE - OK
    
      scode += string_delete(line, 1, 5);
    
      }
    else if (temp == "JMPIF") { // JMPIF - OK
    
      if (disable_jmpif) continue;
    
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
        
        disable_jmpif = true;
            
        }
    
      }
    else { // ERROR - OK
    
      file_text_close(file);
      show_error("Dialog code error in line " + string(ordinal) + ": (" + line + ")", true);
    
      }
  
    }

  }
  
file_text_close(file);
