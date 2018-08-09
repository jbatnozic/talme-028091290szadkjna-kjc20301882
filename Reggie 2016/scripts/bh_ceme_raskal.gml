///bh_ceme_raskal()
/*

*/

if (_state==1) {

  //Go to randezvous point:
  _startX=6096;
  _startY=608;
  _guardRange=32;
  _guardBody=-1;
  
  _state=2;

  }
else if (_state==2) {

  if (distance_to_point(_startX,_startY)<=32) _state=3;

  }
else if (_state==3) {

  if (distance_to_object(global.player_obj_id)<=50) {
  
    txt_begin();
  
    txt_add("Placeholder Raskal Dialogue.",0,0,"[End\]{End}");
  
    txt_interface_open(x, y);
    
    _state=4;
  
    }

  }
else if (_state==4) {

  if (txt_obj_exists()==false) {
  
    screen_fade(c_black,181,0);
    execute_string_delayed("game_change_room(); game_end_scene();", 180, true);
  
    }

  }
  
  
  
  
  
