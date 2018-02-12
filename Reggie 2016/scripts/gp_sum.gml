///gp_sum(a,q,n)
/*
Returns the sum of the first n numbers of a geometric progression.
*/

if argument2=0 return 0;

return argument0*(power(argument1,argument2)-1)/(argument1-1);
