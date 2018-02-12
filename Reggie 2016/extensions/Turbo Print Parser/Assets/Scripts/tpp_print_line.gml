///tpp_print_line(X, Y, String, Padding, lineAlignment [Resolved], maxPrint)
/*

Underlying TPP script:
  Basic single line printing function.

NOTES:
  Requires the font set up beforehand.
  
Returns: (Array) a[0] - Link identifier, a[1] - # of printed characters.

*/
var a,i,t,w,c,c2,xx,yy,yorig,work_str,vn,retval;
var oldhover,pad,la,hoveralp,mx,my,printed,maxprint;

//*** SET UP VARIABLES:
xx=round(argument0);
yorig=argument1;
work_str=argument2;

oldhover=global.TPP_LINK_HOVER_PREV;
retval="";

pad=argument3;
la=argument4;
  
yy=round(yorig-string_height("A")*la);

maxprint=argument5;

hoveralp=global.TPP_HOVER_ALPHA;
mx=global.TPP_CURSOR_X;
my=global.TPP_CURSOR_Y;

draw_set_valign(fa_top);
draw_set_halign(fa_left);

//*** ENTER LOOP:
w=0;
printed=0;
for (i=1; i<=string_length(work_str); i+=1) {

  c=string_copy(work_str,i,1);
  
  //FORMATTING:
  if (c=="[") {
  
    switch  (string_copy(work_str,i+1,4)) {
      
      case "col:": // OK
          vn="";
          for (t=i+5; true; t+=1) {          
            c2=string_copy(work_str,t,1);
            if (c2<>":")
              vn+=c2;
              else
                break;          
            }          
          tpp_push(TPP.c_colour,draw_get_colour());
          draw_set_colour(global.TPP_VARMAP[?vn]);
          i=t;
          continue;  
        break;
      
      case "fnt:": // OK
          vn="";
          for (t=i+5; true; t+=1) {          
            c2=string_copy(work_str,t,1);
            if (c2<>":")
              vn+=c2;
              else
                break;          
            }          
          tpp_push(TPP.c_font,global.TPP_FONT);                    
          draw_set_font(global.TPP_VARMAP[?vn]);          
          global.TPP_FONT=global.TPP_VARMAP[?vn];
          yy=round(yorig-string_height("A")*la);
          i=t;
          continue;
        break;
        
      case "alp:": // OK
          vn="";
          for (t=i+5; true; t+=1) {          
            c2=string_copy(work_str,t,1);
            if (c2<>":")
              vn+=c2;
              else
                break;          
            }
          tpp_push(TPP.c_alpha,draw_get_alpha());
          draw_set_alpha(global.TPP_VARMAP[?vn]);
          i=t;
          continue;
        break;
        
      case "aln:": // OK
          vn="";
          for (t=i+5; true; t+=1) {          
            c2=string_copy(work_str,t,1);
            if (c2<>":")
              vn+=c2;
              else
                break;          
            }
          tpp_push(TPP.c_alpha,draw_get_alpha());
          draw_set_alpha(real(vn));
          i=t;
          continue;
        break;
      
      case "spr:":
          vn="";
          for (t=i+5; true; t+=1) {          
            c2=string_copy(work_str,t,1);
            if (c2<>"]")
              vn+=c2;
              else
                break;          
            }
          var ind=global.TPP_VARMAP[?vn],syy;
            
          syy=yorig-sprite_get_height(ind)*la;
          
          /*var oc=draw_get_color(),
              oa=draw_get_alpha();*/
          
          draw_sprite_ext(ind,-1,round(xx+w),round(syy),1,1,0,c_white,1);
          
          /*draw_set_color(oc);
          draw_set_alpha(oa);*/
          
          printed+=1;
          
          //Linked image:
          if (global.TPP_LINK_CURRENT<>"") {          
          
            var flag=point_in_rectangle(mx,my,xx+w,syy,xx+w+sprite_get_width(ind),syy+sprite_get_height(ind));
            
            if (flag==true) {
            
              global.TPP_LINK_HOVER=global.TPP_LINK_CURRENT;
            
              var oc=draw_get_color(),
                  oa=draw_get_alpha();

              draw_set_color(tpp_link_colour(global.TPP_LINK_CURRENT));
              draw_set_alpha(hoveralp);
              
              draw_rectangle(xx+w,syy,xx+w+sprite_get_width(ind),syy+sprite_get_height(ind),false);
              
              draw_set_color(oc);
              draw_set_alpha(oa);
        
              if (global.TPP_CURSOR_FLAG==true)
                retval=global.TPP_LINK_CURRENT;
                
              }
              else if (global.TPP_LINK_CURRENT==oldhover or global.TPP_LINK_CURRENT==global.TPP_LINK_HOVER) {
              
                var oc=draw_get_color(),
                    oa=draw_get_alpha();

                draw_set_color(tpp_link_colour(global.TPP_LINK_CURRENT));
                draw_set_alpha(hoveralp);
              
                draw_rectangle(xx+w,syy,xx+w+sprite_get_width(ind),syy+sprite_get_height(ind),false);
              
                draw_set_color(oc);
                draw_set_alpha(oa);              
              
                }
          
            }
                      
          w+=sprite_get_width(ind)+pad;
          i=t;
          continue;
        break;
        
      case "spe:": // OK
          vn="";
          for (t=i+5; true; t+=1) {          
            c2=string_copy(work_str,t,1);
            if (c2<>"]")
              vn+=c2;
              else
                break;          
            }
          var ind=global.TPP_VARMAP[?vn],syy;
          
          syy=yorig-sprite_get_height(ind)*la;
          
          draw_sprite_ext(ind,-1,round(xx+w),round(syy),1,1,0,draw_get_colour(),draw_get_alpha());
          printed+=1;
          
          //Linked image:
          if (global.TPP_LINK_CURRENT<>"") {          
          
            var flag=point_in_rectangle(mx,my,xx+w,syy,xx+w+sprite_get_width(ind),syy+sprite_get_height(ind));
            
            if (flag==true) {
            
              global.TPP_LINK_HOVER=global.TPP_LINK_CURRENT;
            
              var oc=draw_get_color(),
                  oa=draw_get_alpha();

              draw_set_color(tpp_link_colour(global.TPP_LINK_CURRENT));
              draw_set_alpha(hoveralp);
              
              draw_rectangle(xx+w,syy,xx+w+sprite_get_width(ind),syy+sprite_get_height(ind),false);
              
              draw_set_color(oc);
              draw_set_alpha(oa);
        
              if (global.TPP_CURSOR_FLAG==true)
                retval=global.TPP_LINK_CURRENT;
                
              }
              else if (global.TPP_LINK_CURRENT==oldhover or global.TPP_LINK_CURRENT==global.TPP_LINK_HOVER) {
              
                var oc=draw_get_color(),
                    oa=draw_get_alpha();

                draw_set_color(tpp_link_colour(global.TPP_LINK_CURRENT));
                draw_set_alpha(hoveralp);
              
                draw_rectangle(xx+w,syy,xx+w+sprite_get_width(ind),syy+sprite_get_height(ind),false);
              
                draw_set_color(oc);
                draw_set_alpha(oa);              
              
                }
                
            }

          w+=sprite_get_width(ind)+pad;
          i=t;
          continue;
        break;
      
      case "lnk:": // OK
      case "clk:": // OK
          vn="";
          for (t=i+5; true; t+=1) {          
            c2=string_copy(work_str,t,1);
            if (c2<>":")
              vn+=c2;
              else
                break;          
            }
          tpp_push(TPP.c_link,global.TPP_LINK_CURRENT);
          global.TPP_LINK_CURRENT=vn;
          i=t;
          continue;
        break;
        
      case "exe:":
          vn="";
          for (t=i+5; true; t+=1) {          
            c2=string_copy(work_str,t,1);
            if (c2<>"]")
              vn+=c2;
              else
                break;          
            }
          TPP_execute_code(xx+w,yy,vn);
          continue;
        break;
      
      default:
        break;
    
      }
  
    }
    else if (c=="]" && string_copy(work_str,i-1,1)<>"\") {
       
      tpp_pop_execute();
      yy=round(yorig-string_height("A")*la);
      continue;
    
      }
      else if (c=="\" && string_copy(work_str,i+1,1)=="]") {
        
        continue;
        
        }
        else if (c=="\" && string_copy(work_str,i+1,1)=="n") {
        
          w=0;
          yorig+=string_height("A");
          i+=1;
          continue;
        
          }
          else if (c=="\" && string_copy(work_str,i+1,1)=="#") {
        
            c="\#";
        
            }
    
  //DRAWING:
  if (global.TPP_LINK_CURRENT=="") {
        
    //Draw regular letter:
    draw_text(xx+w,yy,c);
    w+=string_width(c)+pad;
    printed+=1;
    
    }
    else {
    
      //Draw clickable letter:
      draw_text(xx+w,yy,c);
      w+=string_width(c)+pad;
      printed+=1;

      var flag=point_in_rectangle(mx,my,xx+w-pad-string_width(c),yy,xx+w,yy+string_height("A"));
    
      if (flag==true) {
        
        global.TPP_LINK_HOVER=global.TPP_LINK_CURRENT;
                  
        var oc=draw_get_color(),
            oa=draw_get_alpha();
            
        draw_set_color(tpp_link_colour(global.TPP_LINK_CURRENT));
        draw_set_alpha(hoveralp);
        
        draw_rectangle(xx+w-pad-string_width(c),yy,xx+w-1,yy+string_height("A"),false);
        
        draw_set_color(oc);
        draw_set_alpha(oa);
        
        if (global.TPP_CURSOR_FLAG==true)
          retval=global.TPP_LINK_CURRENT;
        
        }
        else if (global.TPP_LINK_CURRENT==oldhover or global.TPP_LINK_CURRENT==global.TPP_LINK_HOVER) {
        
          var oc=draw_get_color(),
              oa=draw_get_alpha();

          draw_set_color(tpp_link_colour(global.TPP_LINK_CURRENT));
          draw_set_alpha(hoveralp);
        
          draw_rectangle(xx+w-pad-string_width(c),yy,xx+w-1,yy+string_height("A"),false);
        
          draw_set_color(oc);
          draw_set_alpha(oa);                
        
          }
    
      }
      
  if (maxprint>0 and printed>=maxprint)
    break;

  }
  
a[0]=retval;
a[1]=printed;
  
return a;
