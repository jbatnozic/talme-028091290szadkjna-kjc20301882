///txt_local_get_choice(Index)
/*
Note: Choice indexing starts from 1!

Returns a 1-d array with 2 elements:
array[0] - Text of the choice
array[1] - (Bool) False if it had a conditional and evaluation returned false,
                  true otherwise
*/
var a;

a[0] = _txt_local_array[0, argument0];
a[1] = _txt_local_array[1, argument0];

return a;
