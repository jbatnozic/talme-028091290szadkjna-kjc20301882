///heart_reduce_strain(Amount [0..500])
/*
Reduces some strain (secondary modifier) of the heart.

Returns nothing.
*/

if argument0=0 exit;

global.heart_meter_sec-=(argument0/100);
