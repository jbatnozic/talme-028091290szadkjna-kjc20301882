///TPP_text_length(String)
/*

Returns the number of printable characters in a string.
Sprites are also considered characters.

*/
var i,t,c,work_str,counter;

//Set up variables:
work_str=argument0;

//Enter loop / count:
counter=0;

for (i=1; i<=string_length(work_str); i+=1) {

  c=string_copy(work_str,i,1);
  
  //FORMATTING:
  if (c=="[") {
  
    switch  (string_copy(work_str,i+1,4)) {
      
      case "col:":      
      case "fnt:":
      case "alp:":
      case "aln:":
      case "clk:":
      case "lnk:":
          for (t=i+5; t<=string_length(work_str); t+=1) {  
            if (string_copy(work_str,t,1)==":")
              break;          
            }
          i=t;
          continue;
        break;
      
      case "spr:":
      case "spe:":
          for (t=i+5; t<=string_length(work_str); t+=1) {  
            if (string_copy(work_str,t,1)=="]")
              break;          
            }
          i=t;
          /*if (argument1) */counter+=1;
          continue;
        break;
      
      
      case "exe:":
          for (t=i+5; t<=string_length(work_str); t+=1) {  
            if (string_copy(work_str,t,1)=="]")
              break;          
            }
          i=t;
          continue;
        break;
      
      default:
        break;
    
      }
  
    }
    else if (c=="]" && string_copy(work_str,i-1,1)<>"\") { //-------------------------------------- Regular ]
    
      continue;
    
      }
      else if (c=="\" && string_copy(work_str,i+1,1)=="]") { //------------------------------------ Escaped ]
        
        counter+=1;
        i+=1;
        continue;
        
        }
        else if (c=="\" && string_copy(work_str,i+1,1)=="n") { //---------------------------------- Line break
        
          i+=1;
          continue;
        
          }
    
  counter+=1;

  }
  
return counter;
