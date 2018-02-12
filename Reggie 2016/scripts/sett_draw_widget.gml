///sett_draw_widget(Name, Type, GridPos, X, Y)
var a,i,v,pos,pc;

switch (argument1) begin

 case SETT_TYPE.selection:
   draw_sprite(spr_window_settings_selection,0,argument3,argument4);
   
   if gui_draw_rectangle_clickable(argument3,argument4,55,13,true)=true {
   
    //***
    v=sett_get_value(argument0);
    pc=global.sett_grid[#4,argument2];
    
    for (i=5; i<=5+pc; i+=1) begin
   
     if global.sett_grid[#i,argument2]=v {
      pos=i;
      break;
      }
    
    end;
    
    pos=max(pos-1,5);
    sett_set_value(argument0,global.sett_grid[#pos,argument2]);    
    //***
   
    }
    
   if gui_draw_rectangle_clickable(argument3+71,argument4,55,13,true)=true {
    
    //***
    v=sett_get_value(argument0);
    pc=global.sett_grid[#4,argument2];
    
    for (i=5; i<=5+pc; i+=1) begin
   
     //show_message(string(i)+" / "+string(argument2)+" / "+force_string(global.sett_grid[#i,argument2]));
    
     if global.sett_grid[#i,argument2]=v {
      pos=i;
      break;
      }
    
    end;
    
    pos=min(pos+1,4+pc);
    sett_set_value(argument0,global.sett_grid[#pos,argument2]);    
    //***
   
    }
  break;
  
 case SETT_TYPE.fixed:
   draw_set_colour(c_black);
   draw_text(argument3+1,argument4-3,"Fixed setting.");
  break;
  
 case SETT_TYPE.toggle:
   if gui_draw_sprite_clickable(spr_window_settings_toggle,0,argument3,argument4,true)=true {
    v=sett_get_value(argument0);
    if global.sett_grid[#5,argument2]=v
     sett_set_value(argument0,global.sett_grid[#6,argument2])
     else 
      sett_set_value(argument0,global.sett_grid[#5,argument2]);   
    }
  break;
  
 case SETT_TYPE.percent_scale:
   
   a=sett_get_value(argument0);
   a=gui_draw_scale_clickable(argument3,argument4,argument3+127,argument4+13,spr_window_settings_scale,a,global.sett_grid[#6,argument2],5);
   sett_set_value(argument0,a);
 
  break;
  
 case SETT_TYPE.control_button:
   if gui_draw_sprite_clickable(spr_window_settings_change,0,argument3,argument4,true)=true {
    a=keyboard_get_input();
    if a[0]<>-1
     sett_set_value(argument0,a[0]);
    }
  break;
  
 default:
  break;
  
end;
