///TPP_set_cursor(X, Y, Flag)
/*

From Documentation:
 "This functions is only needed if you want to make links in text. As no assumptions
  are made regarding what represents the sursor in your program, so in order to use
  links you need to 'tell' the engine what are the X and Y coordinates of the cursor
  (the first two arguments) and whether the cursor is active (currently clicking - 
  the third argument). Usually you'd put mouse_x and mouse_y as X and Y, and
  mouse_check_button_pressed(mb_left) as Flag, but of course it's not mandatory. Note
  that this script needs to be called once every step before the Draw event
  (preferrably in Step, End Step or Pre-Draw event). However, since GUI coordinates
  are not the same as world coordinates, if you're printing anything in GUI you'll
  also need to call it once after the Draw event but before Draw GUI event (so
  preferrably in Post-draw event)."
  
Returns: n/a

*/

global.TPP_CURSOR_X=argument0;
global.TPP_CURSOR_Y=argument1;
global.TPP_CURSOR_FLAG=argument2;
