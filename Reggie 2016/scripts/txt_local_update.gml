///txt_local_update(Choice)
/*
Note: Choice indexing starts from 1!

Returns status:
0 - No change (choice 0)
1 - Update successful
2 - Choice not provided (error)
3 - End of dialogue
*/

if (argument0 == 0) return TXT_STATUS.no_change;

if (argument0 < 0 || argument0 > _txt_local_choices) return TXT_STATUS.choice_err;

var a = txt_path_get(_txt_local_stage, _txt_local_branch, argument0);

var st = a[0], br = a[1];

_txt_local_stage = st;
_txt_local_branch = br;

// Secondary code:
NSP_execute_string(_txt_local_scode);

// Check for end of dialogue:
if (is_undefined(txt_property_get(st, br, TEXTBOX.main))) {
                                 
  return TXT_STATUS.end_of_dia;

  }
  
// Update local array:
var cnt = txt_property_get(st, br, TEXTBOX.choices);
  
_txt_local_choices = cnt;

_txt_local_array[0, 0] = txt_property_get(st, br, TEXTBOX.main);
_txt_local_array[1, 0] = true;
    
var do_show;
                      
for (var i = 1; i <= cnt; i += 1) {

  var pt = string_replace(txt_choice_get(st, br, i), "{End}", "");
  
  //Check for condition:
  var pos = string_pos("{Cdt}", pt);
  
  do_show = false;
  
  if (pos > 0) {
  
   var cond = string_copy(pt, 1, pos - 1);
       pt   = string_delete(pt, 1, pos + 4);
  
   if (NSP_evaluate(cond)) do_show = true;
   
   }
  else 
    do_show = true;

  //show_message("choice[" + string(i) + "] = " + pt + " / " + string(do_show));
    
  _txt_local_array[0, i] = pt;
  _txt_local_array[1, i] = do_show;
   
  }
  
// PCODE / SCODE:
var pcode = txt_property_get(st, br, TEXTBOX.code_p);

NSP_execute_string(pcode);

var scode = txt_property_get(st, br, TEXTBOX.code_s);

_txt_local_scode = scode;

// Return OK:
return TXT_STATUS.update_ok;





