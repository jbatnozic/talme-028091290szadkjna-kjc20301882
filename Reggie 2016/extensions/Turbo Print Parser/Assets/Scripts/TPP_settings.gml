///TPP_settings(HoverCol_1, HoverCol_2, HoverAlpha, JustTreshold)
/*

From Documentation:
 "Use this function to set some general parameters for the parser.
 
    HoverCol_1 - (Real) Colour of link backdrop that's drawn when the cursor is
                        hovering over the link.
    HoverCol_2 - (Real) Colour of link backdrop that's drawn when the cursor is
                        clicking or otherwise activating the link.
    HoverAlpha - (Real) Alpha of the backdrops mentioned above.
    
    JustTreshold - (Real) A real value between 0 and 1, which determines how much
                          of a line if text needs to be filled with characters in
                          order to enable justification. With 0 the text will
                          always be justified as much as required and possible,
                          with 0.5 at least half of the line will need to be filled
                          in order to be justified etc. The default value is 0.75."
    
Returns: n/a

*/

global.TPP_HOVER_COLOUR_1=argument0;
global.TPP_HOVER_COLOUR_2=argument1;
global.TPP_HOVER_ALPHA=argument2;

global.TPP_JT=argument3;
