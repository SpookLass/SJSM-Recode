/*
Argument 0: File path
Argument 1: Variable name
Argument 2: Print
ONLY USE THIS WHEN THE GAME LOADS
*/
if argument0 != "" && file_exists(argument0)
{
    local.obj = object_add();
    if argument2 { show_message("Initialized object at "+argument1)}
    execute_string
    ("
        if "+argument1+" == 0
        {
            globalvar "+argument1+";
            "+argument1+" = "+string(local.obj)+";
        }
        else if "+string(argument2)+"
        { show_error('Variable "+argument1+" already in use!',false); }
    ");
    execute_file(argument0,local.obj);
}
else if argument2 { show_error("File "+argument1+" doesn't exist at path "+argument0,false); }