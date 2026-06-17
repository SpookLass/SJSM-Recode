/*
Argument 0: Variable
Argument 1: Variable name
Argument 2: Print
ONLY USE THIS WHEN THE GAME LOADS
*/
// If the file exists
if !variable_global_exists(argument1)
{
    execute_string("globalvar "+argument1);
    variable_global_set(argument1,argument0);
    if argument2 { show_message("Initialized variable at "+argument1); }
}
else if argument2 { show_error("Variable "+argument1+" already in use!",false); }