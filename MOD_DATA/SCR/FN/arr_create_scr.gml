/*
Argument 0: Name of the array
Argument 1: Dimensions
Argument 2-15: Size of each dimension
I've officially gone fully mental.
*/
variable_global_set(argument0+"_dim_var",argument1);
for (local.i=0; local.i<min(14,argument1); local.i+=1;)
{ variable_global_set(argument0+"_len_var_"+string(local.i),argument[local.i+2]); }