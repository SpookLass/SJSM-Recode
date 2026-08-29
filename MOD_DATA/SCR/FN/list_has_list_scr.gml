/*
Argument 0: Checking list
Argument 1: List in list
Argument 2: Must contain entire list
*/
local.size = ds_list_size(argument1);
for (local.i=0; local.i<local.size; local.i+=1;)
{
    local.has = (ds_list_find_index(argument0,ds_list_find_value(argument1,local.i)) >= 0)
    if local.has != argument2 { return local.has; }
}
return argument2;