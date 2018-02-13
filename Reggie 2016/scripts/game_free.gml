///game_free()
/*
Releases all memory in use by the game.
*/

//instance_activate_all();

//SYSTEMS:
crafting_free();
journal_free();
repair_free();
sett_free();
terr_free();
buf_free(true);
inv_free();
txt_free();
ptc_free();
sev_free();

spl_free();

NSP_free(true);
TPP_free();

//PENDING:
  //heart_free();  -- probs not needed
  //barter_free(); -- probs not needed
  global.barter_string="";
  
//BODIES:
//instance_activate_all();

/*with (bodyParObj) {
 buf_instance_recover();
 buf_instance_free();
 }*/
  
//OTHER:

 //Pathfinding:
 pfd_free();
 
 with (obj_tracker) {
  instance_destroy();
  }  
  
//CHECK REMAINING DATA STRUCTURES:
var s, t;

if (true) {
   for (i=0; i<=10000; i+=1) {
 
     if (ds_exists(i, ds_type_priority)) {show_message("Memory not deallocated: ("+string(i)+") : Priority"); t=ds_type_priority; }
     if (ds_exists(i, ds_type_stack))    {show_message("Memory not deallocated: ("+string(i)+") : Stack"); t=ds_type_stack; }
     if (ds_exists(i, ds_type_queue))    {show_message("Memory not deallocated: ("+string(i)+") : Queue"); t=ds_type_queue; }
     if (ds_exists(i, ds_type_grid))     {show_message("Memory not deallocated: ("+string(i)+") : Grid"); t=ds_type_grid; }
     if (ds_exists(i, ds_type_list))     {show_message("Memory not deallocated: ("+string(i)+") : List"); t=ds_type_list; }
     if (ds_exists(i, ds_type_map))      {show_message("Memory not deallocated: ("+string(i)+") : Map"); t=ds_type_map; }
 
    }
 
  }
 
 
 
 
 
