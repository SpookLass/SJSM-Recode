/*
Argument 0: File path
Argument 1: Variable name
Argument 2: Print
ONLY USE THIS WHEN THE GAME LOADS
*/
// Add the object
local.obj = object_add();
execute_file(argument0,local.obj,argument1);
// Assign if not initialized
if !variable_global_exists(argument1)
{
    globalvar_scr(local.obj,argument1,false);
    if argument2 { show_message("Initialized object "+argument0+" at variable "+argument1); }
}
// Replace if initialized
else
{
    variable_global_set(argument1,local.obj);
    if argument2 { show_message("Replaced variable "+argument1+" with object "+argument0); }
}
obj_name_arr[local.obj] = argument1;
return local.obj;