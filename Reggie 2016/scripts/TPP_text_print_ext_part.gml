///TPP_text_print_ext_part(X, Y, Grid ID, hAlign, vAlign, Start, End, [OPT] maxPrint)
/*

A more complex text printing function. Requires a Grid ID
returned by TPP_text_parse(). Prints only certain lines of text,
from "Start" line to "End" line.

Returns: (String) Identifier of the activated link or an
         empty string if no link was activated.

*/
var i,g,l,xx,yy,xorig,a,retval,line_s,line_e,maxprint,printed;

//Set parameters:
xorig=argument[0];
yy=argument[1];
g=argument[2];
l=g[#0,0];
line_s=argument[5];
line_e=argument[6];

if (argument_count==8)
  maxprint=argument[7];
  else maxprint=-1;

ds_stack_clear(global.TPP_STACK_CM);
ds_stack_clear(global.TPP_STACK_ID);

draw_set_colour(l[|TPP_LIST.colour]);
 draw_set_alpha(l[|TPP_LIST.alpha]);
  draw_set_font(l[|TPP_LIST.font]);
global.TPP_FONT=l[|TPP_LIST.font];

var la=l[|TPP_LIST.linealign];

//Adjust Y:
switch (argument[4]) {

  case fa_bottom:
    for (i=max(1,line_s); i<=min(line_e,ds_grid_height(g)-1); i+=1) {
      yy-=g[#2,i];
      }    
    break;
  
  case fa_center:
    for (i=max(1,line_s); i<=min(line_e,ds_grid_height(g)-1); i+=1) {
      yy-=g[#2,i]/2;
      } 
    break;
    
  default:
    break;  

  }
  
yy=round(yy);

//Print:
retval="";
printed=0;
for (i=max(1,line_s); i<=min(line_e,ds_grid_height(g)-1); i+=1) {

  //Set X:
  switch (argument[3]) {

    case fa_right:
      xx=xorig-g[#1,i];
      break;
    
    case fa_center:
      xx=xorig-g[#1,i]/2;
      break;
      
    default:
      xx=xorig;
      break;

    }

  a=tpp_print_line(xx,yy+g[#2,i]*la,g[#0,i],g[#3,i],la,maxprint-printed);
  
  yy+=g[#2,i];
  
  if (retval=="")
    retval=a[0];
    
  printed+=a[1];
  
  if (maxprint>0 and printed>=maxprint)
    break;
    
  }
  
while (ds_stack_size(global.TPP_STACK_CM)<>0) 
  tpp_pop_execute();

return retval;
