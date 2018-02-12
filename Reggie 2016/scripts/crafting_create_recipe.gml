///crafting_create_recipe(result name, result amount, name 1, amount 1, name 2, ...)
/*
Creates a new recipe and returns its ID.

argument0 - (String)  Name of the resulting item from the recipe
argument1 - (Integer) Amount of the resulting item
argument2 - (String)  Name of the first item required
argument3 - (Integer) Number of the first item required
argument4 - (.......) Further items   
*/
 
var __list=ds_list_create();
var l=global.crafting_recipes;

if (argument_count<=3)
    show_error("Empty recipe created! You must have at least one item!", true);
if (argument_count mod 2 != 0)
    show_error("Every recipe item must have an amount!",true);

for (var i=0; i<argument_count; i+=1) begin
 ds_list_add(__list,argument[i]);
end;

if crafting_recipe_exists(__list)=true {

 ds_list_destroy(__list);

 }
 else {

  ds_list_add(l,__list);
  ds_list_mark_as_list(l,ds_list_size(l)-1);
  
  };
