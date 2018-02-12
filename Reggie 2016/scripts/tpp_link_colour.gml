//tpp_link_colour(CurrentLinkID)
/*

Underlying TPP script:
  Gets the required backdrop colour for the current link.

NOTES:
  --
  
Returns: (Integer) Backdrop colour.

*/

if (argument0==global.TPP_LINK_HOVER_PREV && global.TPP_CURSOR_FLAG==true) {

  return global.TPP_HOVER_COLOUR_2;
  
  }
  
return global.TPP_HOVER_COLOUR_1;
