///TPP_initialize()
/*

Initializes the parser. Needs to be called before any other TPP_* scripts.

Returns: n/a

*/

enum TPP {

  c_empty,
  c_colour,
  c_alpha,
  c_font,
  c_link

  }

enum TPP_LIST {

  colour,
  alpha,
  font,
  linealign,
  maxheight,
  def_font,
  def_width,
  def_sep,
  def_just

  }
  
global.TPP_VARMAP=ds_map_create();
global.TPP_STACK_CM=ds_stack_create();
global.TPP_STACK_ID=ds_stack_create();

global.TPP_FONT=-1;

global.TPP_JT=0.75;

global.TPP_CURSOR_X=0;
global.TPP_CURSOR_Y=0;
global.TPP_CURSOR_FLAG=0;

global.TPP_LINK_CURRENT="";
global.TPP_LINK_HOVER="";
global.TPP_LINK_HOVER_PREV="";

global.TPP_HOVER_COLOUR_1=c_white;
global.TPP_HOVER_COLOUR_2=c_black;
global.TPP_HOVER_ALPHA=0.5;


