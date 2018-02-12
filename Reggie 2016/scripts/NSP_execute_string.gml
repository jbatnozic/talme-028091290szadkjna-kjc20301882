///NSP_execute_string(String)
/*

Executes a string of GML code.

Returns: Argument of "return" statement or undefined
         (see the documentation). 

*/
var nspListStr=global.nspListStr,
    nspListPar=global.nspListPar,
    rv;

if argument0="" exit;

nsp_convert_to_list(argument0,nspListStr);
nsp_list_parameters(nspListStr,nspListPar);

rv=nsp_execute_master(0,ds_list_size(nspListStr)-1,false);

ds_list_clear(nspListStr);
ds_list_clear(nspListPar);

return rv;
