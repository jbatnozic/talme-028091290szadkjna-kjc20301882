///shop_count_item(Destination, Item name)
/*
THIS SCRIPT WILL COUNT THE AMOUNT OF THE SPECIFIED ITEM CURRENTLY IN THE INVENTORY OF THE
SPECIFIED SHOP OR THE CURRENTLY OPENED SHOP.

argument0 - (Integer) Index of the target shop (which must not be opened at the time of
            counting the items!) or -1 to target the currently opened shop.
argument1 - (String)  Name of the item to count.

Returns the amount of the specified item as an integer.
*/
var value;

if argument0=-1 begin

 if ds_map_exists(global.barter_map,argument1)=true {
 
  value=ds_map_find_value(global.barter_map,argument1);
  return value;
  
  }
  
  else return 0;

end

 else begin
 
  var i,t,pos1,pos2,pos3,search_str,end_str;

  //Setup:
  pos1=string_pos("%"+string(argument0)+"b%",global.barter_string);
  
  search_str="["+argument1+"]|";
  end_str="%"+string(argument0)+"e%";
  
  //Main loop:
  for (i=pos1; i>0; i+=1) begin
   
   //Found search string:
   if string_copy(global.barter_string,i,string_length(search_str))=search_str {
    pos2=i+string_length(search_str);
    
    for (t=pos2; t>0; t+=1) begin
     if string_copy(global.barter_string,t,1)="]" {
      pos3=t;
      break;
      }
    end;
   
    current_val=real(string_copy(global.barter_string,pos2+1,pos3-pos2-1));
    
    return current_val;
    }
    //Didn't find search string:
    else if string_copy(global.barter_string,i,string_length(end_str))=end_str {
     return 0;
     }
 
  end;
 
 end;
