///gui_get_view_position()
/*

 rv[0/1/2/3] - x1, y1, x2, y2

*/

var gw, gh, mode, rv, _other;

var ratio = 16/9;

gw = gui_width();
gh = gui_height();

if (gw >= gh * ratio)
  mode = 0; // Height-bound
else
  mode = 1; // Width-bound
  
if (mode == 0) {

  rv[1] = 0;
  rv[3] = gh;

  _other = gh * ratio;
  
  rv[0] = (gw - _other)/2;
  rv[2] = rv[0] + _other;
  
  }
else {

  rv[0] = 0;
  rv[2] = gw;
  
  _other = gw / ratio;

  rv[1] = (gh - _other)/2;
  rv[3] = rv[1] + _other;
  
  }
  
return rv;
