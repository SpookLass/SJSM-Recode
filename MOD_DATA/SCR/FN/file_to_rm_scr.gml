/*
Argument 0: File path
Argument 1: Variable name
Argument 2: Print
ONLY USE THIS WHEN THE GAME LOADS
*/
if argument0 != "" && file_exists(argument0)
{
    local.rm = room_add();
    execute_file(argument0,local.rm);
    if !variable_global_exists(argument1)
    {
        execute_string("globalvar "+argument1);
        if argument2 { show_message("Initialized room at "+argument1); }
    }
    else if argument2 { show_message("Replaced room at "+argument1); }
    variable_global_set(argument1,local.rm);
    rm_name_arr[local.rm] = argument1;
}
else if argument2 { show_error("File "+argument1+" doesn't exist at path "+argument0,false); }