/*
Argument 0: Section
Argument 1: Key
Argument 2: List
*/
local.num = -1;
if ds_list_size(argument2) > 50
{
    for (local.i=0; local.i<ds_list_size(argument2); local.i+=1)
    {
        if local.i mod 50 == 0
        {
            local.num += 1; 
            local.array[local.num] = ds_list_create();
            ds_list_clear(local.array[local.num]);
        }
        ds_list_add(local.array[local.num],ds_list_find_value(argument2,local.i))
    }
    for (local.i=0; local.i<=local.num; local.i+=1)
    {
        ini_write_string(argument0,argument1+"_"+string(local.i),ds_list_write(local.array[local.i]));
        ds_list_destroy(local.array[local.i]);
    }
    ini_write_real(argument0,argument1,local.num+1);
}
else
{
    ini_write_string(argument0,argument1+"_0",ds_list_write(argument2));
    ini_write_real(argument0,argument1,1);
}