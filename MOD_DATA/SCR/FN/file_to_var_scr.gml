/*
Argument 0: File path
Argument 1: Variable name
Argument 2: Print
ONLY USE THIS WHEN THE GAME LOADS
*/
// If the file exists
if argument0 != "" && file_exists(argument0)
{
    if !variable_global_exists(argument1)
    {
        if argument2 { show_message("Initialized file at "+argument1); }
        // Add file to variable using execute_string
        execute_string("globalvar "+argument1);
        variable_global_set(argument1,argument0);
    }
    else if argument2 { show_error("Variable "+argument1+" already in use!",false); }
}
else if argument2 { show_error("File "+argument1+" doesn't exist at path "+argument0,false); }