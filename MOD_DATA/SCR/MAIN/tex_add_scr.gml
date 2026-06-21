/*
Argument 0: Floor
Argument 1: Wall
Argument 2: Ceil
Argument 3: Light Floor
Argument 4: Light Wall
Argument 5: Mode
*/
if argument5 < 0 
{
    for (local.i=0; local.i<global.mode_len_var; local.i+=1;)
    {
        local.len = tex_len_arr[local.i];
        tex_floor_arr[local.i,local.len] = argument0;
        tex_wall_arr[local.i,local.len] = argument1;
        tex_ceil_arr[local.i,local.len] = argument2;
        tex_light_floor_arr[local.i,local.len] = argument3;
        tex_light_wall_arr[local.i,local.len] = argument4;
        tex_len_arr[local.i] += 1;
    }
}
else
{
    local.len = tex_len_arr[argument5];
    tex_floor_arr[argument5,local.len] = argument0;
    tex_wall_arr[argument5,local.len] = argument1;
    tex_ceil_arr[argument5,local.len] = argument2;
    tex_light_floor_arr[argument5,local.len] = argument3;
    tex_light_wall_arr[argument5,local.len] = argument4;
    tex_len_arr[argument5] += 1;
}