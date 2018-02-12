///tpp_push(Command, ID)
/*

Underlying TPP script:
  Pushes a command on the underlying stack.

NOTES:
  --
  
Returns: n/a

*/

ds_stack_push(global.TPP_STACK_CM,argument0);
ds_stack_push(global.TPP_STACK_ID,argument1);
