///sett_draw_widget(Name, Type, GridPos, X, Y, [OPT] String)
var a,i,v,pos,pc;

switch (argument[1]) begin

 case SETT_TYPE.selection:
   draw_sprite(spr_window_settings_selection,0,argument[3],argument[4]);
   
   if gui_draw_rectangle_clickable(argument[3],argument[4],112,26,true)=true {
   
    //***
    v=sett_get_value(argument[0]);
    pc=global.sett_grid[#4,argument[2]];
    
    for (i=5; i<=5+pc; i+=1) begin
   
     if global.sett_grid[#i,argument[2]]=v {
      pos=i;
      break;
      }
    
    end;
    
    pos=max(pos-1,5);
    sett_set_value(argument[0],global.sett_grid[#pos,argument[2]]);    
    //***
   
    }
    
   if gui_draw_rectangle_clickable(argument[3]+142,argument[4],112,26,true)=true {
    
    //***
    v=sett_get_value(argument[0]);
    pc=global.sett_grid[#4,argument[2]];
    
    for (i=5; i<=5+pc; i+=1) begin
   
     //show_message(string(i)+" / "+string(argument[2])+" / "+force_string(global.sett_grid[#i,argument[2]]));
    
     if global.sett_grid[#i,argument[2]]=v {
      pos=i;
      break;
      }
    
    end;
    
    pos=min(pos+1,4+pc);
    sett_set_value(argument[0],global.sett_grid[#pos,argument[2]]);    
    //***
   
    }
  break;
  
 case SETT_TYPE.fixed:
   draw_set_colour(c_black);
   draw_text(argument[3]+1,argument[4]-3,"Fixed setting.");
  break;
  
 case SETT_TYPE.toggle:
   if gui_draw_sprite_clickable(spr_window_settings_toggle,0,argument[3],argument[4],true)=true {
    v=sett_get_value(argument[0]);
    if global.sett_grid[#5,argument[2]]=v
     sett_set_value(argument[0],global.sett_grid[#6,argument[2]])
     else 
      sett_set_value(argument[0],global.sett_grid[#5,argument[2]]);   
    }
  break;
  
 case SETT_TYPE.percent_scale:
   
   a=sett_get_value(argument[0]);
   a=gui_draw_scale_clickable(argument[3],argument[4],argument[3]+254,argument[4]+26,spr_window_settings_scale,a,global.sett_grid[#6,argument[2]],5);
   sett_set_value(argument[0],a);
 
  break;
  
 case SETT_TYPE.control_button:
   if gui_draw_sprite_clickable(spr_window_settings_change,0,argument[3],argument[4],true)=true {
    a=keyboard_get_input();
    if a[0]<>-1
     sett_set_value(argument[0],a[0]);
    }
  break;
  
 case SETT_TYPE.execute_string:
   if gui_draw_sprite_clickable(spr_window_settings_exec,0,argument[3],argument[4],true)=true {
   
    NSP_execute_string(argument[5]);
      
    }
    break;
  
 default:
  break;
  
end;
