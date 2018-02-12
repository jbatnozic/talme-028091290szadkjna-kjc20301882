///buf_end_effect(Buff ID)
/*

*/

switch (argument0) begin

  case BUFF_ID.relaxer:
    gui_show_message_ext("Relaxer has worn off.",c_black);
    break;
  
  case BUFF_ID.jitter:
    gui_show_message_ext("Jitter has worn off.",c_black);    
    break;
 
  case BUFF_ID.ctw:
    gui_show_message_ext("CTW has worn off.",c_black);
    break

  default:
    break;
  
end;
