///TPP_text_print(X, Y, String, Colour, Alpha, Font, lineAlignment, [OPT] maxPrint)
/*

Simple text-printing function. Requires no preparation.

Returns: (String) Identifier of the activated link or an
         empty string if no link was activated.

*/
var xx,yy,work_str,col,alp,fnt,la,maxprint;

//Set up variables:
xx=argument[0];
yy=argument[1];
work_str=argument[2];
col=argument[3];
alp=argument[4];
fnt=argument[5];
la=argument[6];

if (argument_count==8)
  maxprint=argument[7];
  else maxprint=-1;
  
//Set draw parameters:
draw_set_colour(col); 
draw_set_alpha(alp);
draw_set_font(fnt);
global.TPP_FONT=fnt;

draw_set_halign(fa_left);
draw_set_valign(fa_top);
  
//Draw: 
var a;

ds_stack_clear(global.TPP_STACK_CM);
ds_stack_clear(global.TPP_STACK_ID);

a=tpp_print_line(xx,yy,work_str,0,la,maxprint);

while (ds_stack_size(global.TPP_STACK_CM)<>0) 
  tpp_pop_execute();

return a[0];  






