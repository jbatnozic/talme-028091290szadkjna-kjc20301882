///TPP_text_print_ext(X, Y, Grid ID, hAlign, vAlign, [OPT] maxPrint)
/*

A more complex text printing function. Requires a Grid ID
returned by TPP_text_parse().

Returns: (String) Identifier of the activated link or an
         empty string if no link was activated.

*/
var a,i,g,l,xx,yy,xorig,retval,maxprint,printed;

//Set parameters:
xorig=argument[0];
yy=argument[1];
g=argument[2];
l=g[#0,0];

if (argument_count==6)
  maxprint=argument[5];
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
    yy-=l[|TPP_LIST.maxheight];
    break;
  
  case fa_center:
    yy-=l[|TPP_LIST.maxheight]/2;
    break;
    
  default:
    break;  

  }

yy=round(yy);
  
//Print:
retval="";
printed=0;
for (i=1; i<ds_grid_height(g); i+=1) {

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
