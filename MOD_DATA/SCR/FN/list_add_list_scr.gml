/*
Argument 0: List
Argument 1: Add List
Argument 2: Check
*/
local.size = ds_list_size(argument1);
for (local.i=0; local.i<local.size; local.i+=1;)
{
    local.value = ds_list_find_value(argument1,local.i);
    if argument2 { list_add_check_scr(argument0,local.value); }
    else { ds_list_add(argument0,local.value); }
}