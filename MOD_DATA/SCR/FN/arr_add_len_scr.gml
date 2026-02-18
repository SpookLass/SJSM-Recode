/*
Argument 0: Name of the array
Argument 1: Dimension
Argument 2: Length
*/
local.newlen = variable_global_get(argument0+"_len_var_"+string(argument1))+argument2;
variable_global_set(argument0+"_len_var_"+string(argument1),local.newlen);
return local.newlen;