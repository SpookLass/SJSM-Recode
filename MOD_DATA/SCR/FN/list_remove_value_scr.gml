/*
Argument 0: List
Argument 1: Value
Argument 2: Remove all
*/
local.index = ds_list_find_index(argument0,argument1);
if argument2
{
    while local.index >= 0
    {
        ds_list_delete(argument0,local.index);
        local.index = ds_list_find_index(argument0,argument1);
    }
}
else if local.index >= 0 { ds_list_delete(argument0,local.index); }