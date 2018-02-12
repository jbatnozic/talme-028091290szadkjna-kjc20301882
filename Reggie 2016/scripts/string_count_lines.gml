///string_count_lines(String, Width)
/*

NOTE: This script is very slow, and should not be used every step,
      especially not for long strings.

argument0 - Input string.
argument1 - Desired width of the string (in pixels).

Returns the number of lines (rows).
*/
var current_word,current_line,work_str,str_array; 
var i,char,space,temp_exit,width;

work_str=argument0;
current_line=0;
str_array[current_line]="";

while (string_length(work_str)>0) begin

 //Select current word:
 switch (string_copy(work_str,1,1)) begin

 case " ":
   current_word=" ";
   space=1;
   temp_exit=false;
  break;
 
 case "#":
   current_word="#";
   space=1;
   current_line+=1;
   str_array[current_line]="";
   temp_exit=true;
  break;
 
 default:
   current_word="";
   for (i=1; i<=string_length(work_str); i+=1) begin
    char=string_copy(work_str,i,1);
    if (char=" " or char="#") {
     i-=1;
     break;
     }
   end;
 
   current_word=string_copy(work_str,1,i);
   
   space=0;
   temp_exit=false;
   
  break;
 
 end;
 
 //See what to do with the current word:
 if temp_exit=false {
 
  width=string_width(ite(space,0,current_word,string_copy(current_word,1,string_length(current_word)-1)));
 
  if string_width(str_array[current_line])+width<=argument1 {
   str_array[current_line]+=current_word;
   }
   else if width<=argument1 {
    current_line+=1;
    str_array[current_line]="";
    str_array[current_line]+=current_word;
    }
    else {
     i=1;
     while (i<string_length(current_word)) begin
      char=string_copy(current_word,i,1);
      if string_width(str_array[current_line]+char)<=argument1-string_width("-") {
       str_array[current_line]+=char;
       i+=1;
       }
       else {
        str_array[current_line]+="-";
        current_line+=1;
        str_array[current_line]="";
        str_array[current_line]+=char;
        i+=1;
        }
      end;
     }
    
  }
 
 work_str=string_delete(work_str,1,string_length(current_word));
 current_word="";
 
end;

//Return the number of lines:
return array_length_1d(str_array);
