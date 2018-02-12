//TPP_link_clear_hover()
/*

From Documentation:
 "This functions is only needed if you want to make links in text. It prepares some
  variables that are needed for drawing links correctly and you will encounter
  visual errors if you don't use this function correctly. It's important to call
  this script at the very end of a step (so after all drawing is done) OR before
  any drawing is done. Just remember that you need to call this script exactly ONCE
  per step."
  
Returns: n/a

*/

global.TPP_LINK_HOVER_PREV=global.TPP_LINK_HOVER;
global.TPP_LINK_HOVER="";
