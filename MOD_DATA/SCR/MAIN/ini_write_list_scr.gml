/*
Argument 0: Section
Argument 1: Key
Argument 2: List
Argument 3: Type
    0: Default
    1: Number
    2: String
    3: Object
    4: Room
*/
if argument3 == 0
{
    local.len = -1;
    if ds_list_size(argument2) > 50
    {
        for (local.i=0; local.i<ds_list_size(argument2); local.i+=1)
        {
            if local.i mod 50 == 0
            {
                local.len += 1; 
                local.array[local.len] = ds_list_create();
                ds_list_clear(local.array[local.len]);
            }
            ds_list_add(local.array[local.len],ds_list_find_value(argument2,local.i))
        }
        for (local.i=0; local.i<=local.len; local.i+=1)
        {
            ini_write_string(argument0,argument1+"_"+string(local.i),ds_list_write(local.array[local.i]));
            ds_list_destroy(local.array[local.i]);
        }
        ini_write_real(argument0,argument1,local.len+1);
    }
    else
    {
        ini_write_string(argument0,argument1+"_0",ds_list_write(argument2));
        ini_write_real(argument0,argument1,1);
    }
}
else
{
    local.len = ds_list_size(argument2);
    ini_write_real(argument0,argument1,local.len);
    for (local.i=0; local.i<local.len; local.i+=1;)
    {
        local.value = ds_list_find_value(argument2,local.i);
        switch argument3
        {
            case 3: { local.value = obj_name_arr[local.value]; break; }
            case 4: { local.value = rm_name_arr[local.value]; break; }
        }
        if is_string(local.value) { ini_write_string(argument0,argument1+"_"+string(local.i),local.value); }
        else { ini_write_real(argument0,argument1+"_"+string(local.i),local.value); }
    }
}