///TPP_text_parse(String, Colour, Alpha, Font, lineAlignment, Width, Sep, Justify)
/*

Prepares a string to be printed with more complex printing
functions later on. Be careful, this is a very slow function.

Returns: (Integer) Grid ID, later to be used with other functions.

*/
var i,t,p,v,c,c2,g,l,work_str,fnt,width,sep,pad,tot_h,jt;
var line_s,line_l,line_w,line_h,word_s,word_w,word_l,word_h;

work_str=argument0;
fnt=argument3;
width=argument5;
sep=argument6;
pad=argument7;

jt=global.TPP_JT;

g=ds_grid_create(4,1);

ds_stack_clear(global.TPP_STACK_CM);
ds_stack_clear(global.TPP_STACK_ID);

draw_set_font(fnt);
global.TPP_FONT=fnt;

word_s="";
word_l=0;
word_w=0;
word_h=0;
line_s="";
line_l=0;
line_w=0;
line_h=0;

tot_h=0;

for (i=1; i<=string_length(work_str); i+=1) {

  c=string_copy(work_str,i,1);
  
  //FORMATTING:
  if (c=="[") { //--------------------------------------------------------------------------------- Format tag
  
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
          word_s+="[col:"+vn+":";
          tpp_push(TPP.c_empty,0);
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
          word_s+="[fnt:"+vn+":";
          tpp_push(TPP.c_font,global.TPP_FONT);
          draw_set_font(global.TPP_VARMAP[?vn]);
          global.TPP_FONT=global.TPP_VARMAP[?vn];
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
          word_s+="[alp:"+vn+":";  
          tpp_push(TPP.c_empty,0); 
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
          word_s+="[aln:"+vn+":";
          tpp_push(TPP.c_empty,0);
          i=t;  
          continue;
        break;
      
      case "spr:": // Seems OK
          vn="";
          for (t=i+5; true; t+=1) {          
            c2=string_copy(work_str,t,1);
            if (c2<>"]")
              vn+=c2;
              else
                break;          
            }
          var ind=global.TPP_VARMAP[?vn];
              
          // First finish current word:
          if (line_w+word_w<=width) {
          
            //Add to current line:
            line_s+=word_s;
            line_l+=word_l;
            line_w+=word_w;
            line_h=max(line_h,word_h);
            word_s="";
            word_l=0;
            word_w=0;
            word_h=0;
          
            }
            else {
            
              //Break line, add to next line:
              p=min((width+pad-line_w)/(line_l),pad)*(line_w>width*jt);
              if (sep==-1) v=line_h; else v=sep;
              tpp_add_line_to_grid(g,line_s,line_w+line_l*p,v,p);
              tot_h=tot_h+v;
              
              line_s=word_s;
              line_l=word_l;
              line_w=word_w;
              line_h=word_h;
              word_s="";
              word_l=0;
              word_w=0;
              word_h=0;
            
              }    
          
          //Add sprite word:
          if (line_w+sprite_get_width(ind)<=width) {
          
            word_s+="[spr:"+vn+"]";
            word_l+=1;
            word_w+=sprite_get_width(ind);
            word_h=max(word_h,sprite_get_height(ind));             
          
            }
            else {
            
              //Break line, add to next line:
              p=min((width+pad-line_w)/(line_l),pad)*(line_w>width*jt);
              if (sep==-1) v=line_h; else v=sep;
              tpp_add_line_to_grid(g,line_s,line_w+line_l*p,v,p);
              tot_h=tot_h+v;
              
              line_s="[spr:"+vn+"]";
              line_l=1;
              line_w=sprite_get_width(ind);
              line_h=sprite_get_height(ind);
              word_s="";
              word_l=0;
              word_w=0;
              word_h=0;
            
              }
          
          i=t;
          continue;
        break;
        
      case "spe:": // Seems OK
          vn="";
          for (t=i+5; true; t+=1) {          
            c2=string_copy(work_str,t,1);
            if (c2<>"]")
              vn+=c2;
              else
                break;          
            }
          var ind=global.TPP_VARMAP[?vn];
          
          // First finish current word:
          if (line_w+word_w<=width) {
          
            //Add to current line:
            line_s+=word_s;
            line_l+=word_l;
            line_w+=word_w;
            line_h=max(line_h,word_h);
            word_s="";
            word_l=0;
            word_w=0;
            word_h=0;
          
            }
            else {
            
              //Break line, add to next line:
              p=min((width+pad-line_w)/(line_l),pad)*(line_w>width*jt);
              if (sep==-1) v=line_h; else v=sep;
              tpp_add_line_to_grid(g,line_s,line_w+line_l*p,v,p);
              tot_h=tot_h+v;
              
              line_s=word_s;
              line_l=word_l;
              line_w=word_w;
              line_h=word_h;
              word_s="";
              word_l=0;
              word_w=0;
              word_h=0;
            
              }    
          
          //Add sprite word:
          if (line_w+sprite_get_width(ind)<=width) {
          
            word_s+="[spe:"+vn+"]";
            word_l+=1;
            word_w+=sprite_get_width(ind);
            word_h=max(word_h,sprite_get_height(ind));             
          
            }
            else {
            
              //Break line, add to next line:
              p=min((width+pad-line_w)/(line_l),pad)*(line_w>width*jt);
              if (sep==-1) v=line_h; else v=sep;
              tpp_add_line_to_grid(g,line_s,line_w+line_l*p,v,p);
              tot_h=tot_h+v;
              
              line_s="[spe:"+vn+"]";
              line_l=1;
              line_w=sprite_get_width(ind);
              line_h=sprite_get_height(ind);
              word_s="";
              word_l=0;
              word_w=0;
              word_h=0;
            
              }
          
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
          word_s+="[clk:"+vn+":";
          tpp_push(TPP.c_empty,0);
          i=t;
          continue;
        break;
        
      case "exe:": //OK
          vn="";
          for (t=i+5; true; t+=1) {          
            c2=string_copy(work_str,t,1);
            if (c2<>":")
              vn+=c2;
              else
                break;          
            }
          word_s+="[exe:"+vn+":";
          tpp_push(TPP.c_empty,0);
          i=t;
          continue;
        break;
      
      default:
        break;
    
      }
  
    }
    else if (c=="]" && string_copy(work_str,i-1,1)<>"\") { //-------------------------------------- Regular ]
    
      word_s+="]";
      tpp_pop_execute();
      continue;
    
      }
      else if (c=="\" && string_copy(work_str,i+1,1)=="]") { //------------------------------------ Escaped ]
        
        word_s+="\";
        continue;
        
        }
        else if (c==" ") { //---------------------------------------------------------------------- Space
        
          //Break word:
          word_s+=c;
          word_l+=1;
          word_w+=string_width(c);
          
          if (line_w+word_w<=width) {
          
            //Add to current line:
            line_s+=word_s;
            line_l+=word_l;
            line_w+=word_w;
            line_h=max(line_h,word_h);
            word_s="";
            word_l=0;
            word_w=0;
            word_h=0;
          
            }
            else {
            
              //Break line, add to next line:
              p=min((width+pad-line_w)/(line_l),pad)*(line_w>width*jt);
              if (sep==-1) v=line_h; else v=sep;
              tpp_add_line_to_grid(g,line_s,line_w+line_l*p,v,p);
              tot_h=tot_h+v;
              
              line_s=word_s;
              line_l=word_l;
              line_w=word_w;
              line_h=word_h;
              word_s="";
              word_l=0;
              word_w=0;
              word_h=0;
            
              }
          
          continue;
        
          }
          else if (c=="#") { //-------------------------------------------------------------------- Hashtag
          
            word_s+="\#";
            word_l+=1;
            word_w+=string_width("\#");
            word_h=max(word_h,string_height("A"));
          
            }
            else if (c=="\" && string_copy(work_str,i+1,1)=="n") { //------------------------------ Line break
          
              //Finish current word:
              if (line_w+word_w<=width) {
          
                //Add to current line:
                line_s+=word_s;
                line_l+=word_l;
                line_w+=word_w;
                line_h=max(line_h,word_h);
          
                }
                else {
            
                  //Break line, add to next line:
                  p=min((width+pad-line_w)/(line_l),pad)*(line_w>width*jt);
                  if (sep==-1) v=line_h; else v=sep;
                  tpp_add_line_to_grid(g,line_s,line_w+line_l*p,v,p);
                  tot_h=tot_h+v;
              
                  line_s=word_s;
                  line_l=word_l;
                  line_w=word_w;
                  line_h=word_h;
            
                  }
                  
              //Break line:
              p=min((width+pad-line_w)/(line_l),pad)*(line_w>width*jt);
              if (sep==-1) v=line_h; else v=sep;
              if (v==0) v=string_height("A");
              tpp_add_line_to_grid(g,line_s,line_w+line_l*p,v,p);
              tot_h=tot_h+v;
              
              line_s="";
              line_l=0;
              line_w=0;
              line_h=0;
              word_s="";
              word_l=0;
              word_w=0;
              word_h=0;
                  
              i+=1;
              continue;
          
              }
    
  //Regular letter:
  word_s+=c;
  word_l+=1;
  word_w+=string_width(c);
  word_h=max(word_h,string_height("A"));
  
  if (word_w>=width) {
  
    //Break line, add to next line:
    if (line_l<>0) {
      p=min((width+pad-line_w)/(line_l),pad)*(line_w>width*jt);
      if (sep==-1) v=line_h; else v=sep;
      tpp_add_line_to_grid(g,line_s,line_w+line_l*p,v,p);
      tot_h=tot_h+v;
      }
              
    line_s=word_s;
    line_l=word_l;
    line_w=word_w;
    line_h=max(line_h,word_h);
    
    p=min((width+pad-line_w)/(line_l),pad)*(line_w>width*jt);
    if (sep==-1) v=line_h; else v=sep;
    tpp_add_line_to_grid(g,line_s,line_w+line_l*p,v,p);
    tot_h=tot_h+v;
    
    line_s="";
    line_l=0;
    line_w=0;
    line_h=0;
    word_s="";
    word_l=0;
    word_w=0;
    word_h=0;
  
    }

  }
  
//Add final words:
if (word_s<>"") {

  if (line_w+word_w<=width) {
          
    //Add to current line:
    line_s+=word_s;
    line_l+=word_l;
    line_w+=word_w;
    line_h=max(line_h,word_h);
    word_s="";
    word_l=0;
    word_w=0;
    word_h=0;
          
    }
    else {
            
      //Break line, add to next line:
      p=min((width+pad-line_w)/(line_l),pad)*(line_w>width*jt);
      if (sep==-1) v=line_h; else v=sep;
      tpp_add_line_to_grid(g,line_s,line_w+line_l*p,v,p);
      tot_h=tot_h+v;
              
      line_s=word_s;
      line_l=word_l;
      line_w=word_w;
      line_h=word_h;
      word_s="";
      word_l=0;
      word_w=0;
      word_h=0;
            
      }

  }
  
if (line_s<>"") {

  p=min((width+pad-line_w)/(line_l),pad)*(line_w>width*jt);
  if (sep==-1) v=line_h; else v=sep;
  tpp_add_line_to_grid(g,line_s,line_w+line_l*p,v,p);
  tot_h=tot_h+v;              
  
  }

//Finalize:
l=ds_list_create();

l[|TPP_LIST.colour]=argument1;
l[|TPP_LIST.alpha]=argument2;
l[|TPP_LIST.font]=argument3;

switch (argument4) {

  case fa_top:
    l[|TPP_LIST.linealign]=0;
    break;
    
  case fa_center:
    l[|TPP_LIST.linealign]=0.5;
    break;
    
  case fa_bottom:
    l[|TPP_LIST.linealign]=1;
    break;
    
  default:
    break;

  }

l[|TPP_LIST.maxheight]=tot_h;

l[|TPP_LIST.def_font]=fnt;
l[|TPP_LIST.def_width]=width;
l[|TPP_LIST.def_sep]=sep;
l[|TPP_LIST.def_just]=pad;

g[#0,0]=l;

return g;






