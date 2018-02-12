///pnc_draw_tooltip(fixed)
/*

*/
var s,twidth,theight,xx,yy;

if (global.pnc_target_id=PNC.no_target) exit;

s=global.pnc_tooltip;
w=string_width(s);

//Text formatting:
var maxwidth=200;
var padding=8;
var sep=12;

draw_set_halign(fa_left);
draw_set_valign(fa_top);

if (w<=maxwidth) {

  twidth=w+2*padding;
  theight=string_height_ext(s,sep,maxwidth)+2*padding;  

  }
  else {
  
    twidth=maxwidth+2*padding;
    theight=string_height_ext(s,sep,maxwidth)+2*padding;
  
    }

if (argument0=false) {

  xx=clamp(device_mouse_raw_x(0)/gui_get_scale(),
           padding,gui_width()-twidth-padding);
  yy=clamp(device_mouse_raw_y(0)/gui_get_scale()-theight,
           padding,gui_height()-theight-padding);

  }
  else {
  
    xx=gui_width()-twidth-padding;
    yy=padding;  
  
    }
    
//Draw backdrop: (WIP)
draw_set_colour(c_black);
draw_set_alpha(0.5);
  draw_rectangle(xx,yy,xx+twidth,yy+theight,false);

//Draw text:
draw_set_colour(c_white);
draw_set_alpha(1);
  draw_text_ext(xx+padding,yy+padding,s,sep,maxwidth);
