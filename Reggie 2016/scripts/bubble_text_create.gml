///bubble_text_create(X, Y, Text, Duration, Colour, Comp, FollowObj, Offset)
/*

*/
var a;

a=instance_create(argument0,argument1,obj_bubble_text);

with (a) {

  _text=argument2;
  _duration=argument3;
  
  _colour=argument4;
  _complex=argument5;
  
  _obj=argument6;
  _offset=argument7;
  
  draw_set_font(FONT);
  _w=min(MAXWIDTH,string_width(_text));
  _h=string_height_ext(_text,SEP,MAXWIDTH);

  }
