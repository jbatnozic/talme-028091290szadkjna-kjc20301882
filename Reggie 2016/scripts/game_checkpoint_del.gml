///game_checkpoint_del()
/*

  Deletes checkpoint files, if any.

*/
var arr;

arr[0] = "rb_checkpoint_state.sav";
arr[1] = "rb_checkpoint_systems.ini";

for (var i = 0; i < 2; i += 1) {

  if (file_exists(arr[i])) {
  
    file_delete(arr[i]);
  
    }

  }
