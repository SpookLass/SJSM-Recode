/*
Argument 0: Section
Argument 1: Key
Argument 2: List
*/
ds_list_clear(argument2);
local.len = ini_read_real(argument0,argument1,0);
if local.len > 1
{
    for (local.i=0; local.i<local.len; local.i+=1)
    {
        local.list = ds_list_create();
        ds_list_clear(local.list);
        ds_list_read(local.list,ini_read_string(argument0,argument1+"_"+string(local.i),"2F01000000000000"));
        for (local.n=0; local.n<ds_list_size(local.list); local.n+=1)
        { ds_list_add(argument2,ds_list_find_value(local.list,local.n)); }
        ds_list_destroy(local.list);
    }
}
else { ds_list_read(argument2,ini_read_string(argument0,argument1+"_0","2F01000000000000")); }