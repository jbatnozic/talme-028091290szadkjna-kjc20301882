///txt_local_init()
/*
Initializes the textbox object.
*/

_txt_local_stage   = txt_map_get("begin_stage");
_txt_local_branch  = txt_map_get("begin_branch");
_txt_local_scode   = "";
_txt_local_choices = txt_property_get( _txt_local_stage
                                     , _txt_local_branch
                                     , TEXTBOX.choices);
                                     
// Update local array (copied from update script):
var cnt = _txt_local_choices,
    st  = _txt_local_stage,
    br  = _txt_local_branch;

_txt_local_array[0, 0] = txt_property_get(st, br, TEXTBOX.main);
_txt_local_array[1, 0] = true;
                          
for (var i = 1; i <= cnt; i += 1) {

  var pt = string_replace(txt_choice_get(st, br, i), "{End}", "");
  
  //Check for condition:
  var do_show = false;
  var pos = string_pos("{Cdt}", pt);
  
  if (pos > 0) {
  
   var cond = string_copy(pt, 1, pos - 1);
       pt   = string_delete(pt, 1, pos + 4);
  
   if (NSP_evaluate(cond)) do_show = true;
   
   }
  else 
    do_show = true;

  _txt_local_array[0, i] = pt;
  _txt_local_array[1, i] = do_show;
   
  }
  
// PCODE / SCODE:
var pcode = txt_property_get(st, br, TEXTBOX.code_p);

NSP_execute_string(pcode);

var scode = txt_property_get(st, br, TEXTBOX.code_s);

_txt_local_scode = scode;





