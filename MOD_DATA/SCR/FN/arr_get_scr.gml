/*
Argument 0: Name of the array
Argument 1-14: Indexes
*/
local.dimensions = variable_global_get(argument0+"_dim_var");
local.variable = argument0+"_arr_var_";
for (local.i=0; local.i<local.dimensions; local.i+=1;)
{
    if argument[local.i+1] > arr_get_len_scr(argument0,local.i)-1
    { show_error("Index outside of array length for dimension "+string(local.i)+"!",true); game_end(); }
    local.variable += string(argument[local.i+1]);
}
if variable_global_exists(local.variable) { return variable_global_get(local.variable); }
else { return noone; }