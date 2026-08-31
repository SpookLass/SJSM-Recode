/*
Argument 0: List
Argument 1: Whitelist
*/
local.size = ds_list_size(argument0);
for (local.i=0; local.i<local.size; local.i+=1;)
{
    if ds_list_find_index(argument1,ds_list_find_value(argument0,local.i)) < 0
    {
        ds_list_delete(argument0,local.i);
        local.i -= 1;
        local.size -= 1;
    }
}