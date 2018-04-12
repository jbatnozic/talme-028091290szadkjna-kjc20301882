///game_checkpoint_load(Name)
/*

  Returns false if game cannot be loaded.

*/
var arr;

arr[0] = "rb_checkpoint_state.sav";
arr[1] = "rb_checkpoint_systems.ini";

if (!(file_exists(arr[0]) && file_exists(arr[1]))) {

  return false;

  }

game_cleanup();

//global.game_init_flag = false; <- done in game_cleanup()

game_load(arr[0]);
