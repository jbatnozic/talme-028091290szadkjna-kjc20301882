///game_checkpoint_save()
/*

  File names:
    rb_checkpoint_state.sav
    rb_checkpoint_systems.ini

*/

game_checkpoint_del();

res_backup_all();

global.svld_string = "ChkptRestore";
 
game_save("rb_checkpoint_state.sav");
game_save_systems("rb_checkpoint_systems.ini");

res_clear_all_flags();

global.svld_string = "";
