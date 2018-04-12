///execute_string_delayed(String, Delay, CanPause, [OPT] ExecutorDepth)
/*

*/
var a;

a = instance_create(0, 0, obj_action_delayed);

a.code      = argument[0];
a.duration  = argument[1];
a.can_pause = argument[2];

if (argument_count >= 4)
  a.depth = argument[3];

