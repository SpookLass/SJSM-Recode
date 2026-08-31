/*
Argument 0: List
Argument 1: Remove List
Argument 2: Remove all
*/
local.size = ds_list_size(argument1);
for (local.i=0; local.i<local.size; local.i+=1;)
{ list_remove_value_scr(argument0,ds_list_find_value(argument1,local.i),argument2); }