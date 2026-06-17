/*
Argument 0: File path
Argument 1: Variable name
Argument 2: Print
ONLY USE THIS WHEN THE GAME LOADS
*/
if !variable_global_exists(argument1)
{
    local.rm = room_add();
    execute_file(argument0,local.rm);
    globalvar_scr(local.rm,argument1,false);
    rm_name_arr[local.rm] = argument1;
    if argument2 { show_message("Initialized room "+argument0+" at variable "+argument1); }
}
else if argument2 { show_error("Variable "+argument1+" already in use!",false); }