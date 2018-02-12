///cha_start(Text, Delay, Safe, Action, [OPT] Further arguments [1..4])
/*

*/
var i;

if instance_exists(obj_channel_bar)
  remove(obj_channel_bar);
  
with (instance_create(0,0,obj_channel_bar)) {

  _text=argument[0];
  _duration=argument[1];
  _safe=argument[2];
  _action=asset_get_index(argument[3]);
  _argc=argument_count-4;
  
  for (i=4; i<argument_count; i+=1) {
  
    _arg[i-4]=argument[i];
  
    }

  }
