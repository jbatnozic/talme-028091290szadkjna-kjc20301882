///sett_ini_write()
/*
Writes the settings info to the currently opened INI file.
*/
var map  = global.sett_map,
    grid = global.sett_grid;

var totl, sect, cnt = 0;

totl[0] = global.sett_controls;
totl[1] = global.sett_gameplay;
totl[2] = global.sett_graphics;
totl[3] = global.sett_sound;
totl[4] = global.sett_misc;

sect[0] = "CONTROLS";
sect[1] = "GAMEPLAY";
sect[2] = "GRAPHICS";
sect[3] = "SOUND";
sect[4] = "MISC";

for (var i = 0; i < array_length_1d(totl); i += 1) {

  ini_section_delete(sect[i]);

  repeat (totl[i]) {
   
    var type = grid[#1, cnt];
    
    if (type != SETT_TYPE.title &&
        type != SETT_TYPE.fixed &&
        type != SETT_TYPE.execute_string) {
    
      var key = grid[#0, cnt];

      var val = map[?key];
        
      if (is_real(val)) {
      
        ini_write_real(sect[i], key, val);
      
        }
      else if (is_string(val)) {
      
        ini_write_string(sect[i], key, val);
      
        }
      else {
      
        show_error("sett_ini_write - undefined value for setting: " + key, true);
      
        }
      
      }
      
    cnt += 1;
  
    }

  }
  
  
  
  
  
  
  
