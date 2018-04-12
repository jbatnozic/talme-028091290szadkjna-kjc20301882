///pnc_draw_tooltip(fixed)
/*

*/
var s, twidth, theight, xx, yy;

if (global.pnc_target_id = PNC.no_target) exit;

s = global.pnc_tooltip;

if (is_string(s)) {

  fnt_draw_set(FONT.tooltip);

  w = string_width(s);
  
  //Text formatting:
  var maxwidth = 200;
  var padding = 8;
  var sep = 20;
  
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
  
    var mx = device_mouse_raw_x(0) / gui_get_scale(),
        my = device_mouse_raw_y(0) / gui_get_scale();    
  
    xx=clamp(device_mouse_raw_x(0)/gui_get_scale(),
             padding,gui_width()-twidth-padding);
             
    if (my < gui_height() / 5) {
    
      yy=clamp(device_mouse_raw_y(0) / gui_get_scale(),
               padding,
               gui_height() - (theight + padding));
    
      }
    else {
    
      yy=clamp(device_mouse_raw_y(0) / gui_get_scale() - theight,
               padding,
               gui_height() - (theight + padding));
    
      }
  
    }
    else {
    
      xx=gui_width()-twidth-padding;
      yy=padding;  
    
      }
      
  //Draw backdrop: (WIP)
  draw_set_colour(c_black);
  draw_set_alpha(0.5);
    draw_rectangle(xx,yy,xx+twidth,yy+theight,false);
  
  //Draw corners:
  draw_sprite_ext(spr_tooltip_corner, 0, xx, yy, 1, 1, 0, c_white, 1);
  draw_sprite_ext(spr_tooltip_corner, 0, xx + twidth, yy, 1, 1, -90, c_white, 1);
  draw_sprite_ext(spr_tooltip_corner, 0, xx, yy + theight, 1, 1, 90, c_white, 1);
  draw_sprite_ext(spr_tooltip_corner, 0, xx + twidth, yy + theight, 1, 1, 180, c_white, 1);
    
  //Draw text:
  draw_set_colour(c_white);
  draw_set_alpha(1);
    draw_text_ext(xx+padding,yy+padding,s,sep,maxwidth);
    //TPP_text_print(xx + padding, yy + padding, s, c_white, 1, fnt_get(FONT.tooltip), fa_bottom);
  
  }
