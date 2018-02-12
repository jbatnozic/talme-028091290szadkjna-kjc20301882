///screen_flash(color, [OPTIONAL] decrease)
if (argument_count == 0)
    return 0;
with (obj_screen_flash)
    instance_destroy();
var __id = instance_create(0,0,obj_screen_flash);
__id._color=argument[0];
if (argument_count>1)
    __id._decrease=argument[1];
