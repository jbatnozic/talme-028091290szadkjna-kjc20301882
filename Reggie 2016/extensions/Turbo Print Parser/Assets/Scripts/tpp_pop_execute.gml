///tpp_pop_execute()
/*

Underlying TPP script:
  Pops a command from the underlying stack and executes it.

NOTES:
  --
  
Returns: n/a

*/
var cm,_id;

 cm=ds_stack_pop(global.TPP_STACK_CM);
_id=ds_stack_pop(global.TPP_STACK_ID);

switch (cm) {

  case TPP.c_colour:
    draw_set_colour(_id);
    break;
  
  case TPP.c_font:
    global.TPP_FONT=_id;
    draw_set_font(_id);
    break;
  
  case TPP.c_alpha:
    draw_set_alpha(_id);
    break;
    
  case TPP.c_link:
    global.TPP_LINK_CURRENT=_id;
    break;
  
  default:
    break;
    
  }

