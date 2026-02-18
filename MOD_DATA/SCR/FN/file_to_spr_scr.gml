/*
Argument 0: File path
Argument 1: Variable name
Argument 2: Sprite Number
Argument 3: Remove Background
Argument 4: Smooth
Argument 5: X origin
Argument 6: Y origin
Argument 7: Print
ONLY USE THIS WHEN THE GAME LOADS
*/
// If the file exists
if argument0 != "" && file_exists(argument0)
{
    if !variable_global_exists(argument1)
    {
        local.settings_file = filename_change_ext(argument0,".gml");
        // If settings file exists, read it.
        if file_exists(local.settings_file)
        {
            local.spr = execute_file(local.settings_file,argument0);
            if argument7 { show_message("Initialized file with settings at "+argument1); }
        }
        // Else, use arguments
        else
        {
            local.spr = sprite_add(argument0,argument2,argument3,argument4,argument5,argument6);
            if argument7 { show_message("Initialized file WITHOUT settings at "+argument1); }
        }
        // Add sprite to variable
        execute_string("globalvar "+argument1);
        variable_global_set(argument1,local.spr);
    }
    else if argument7 { show_error("Variable "+argument1+" already in use!",false); }
}
else if argument7 { show_error("File "+argument1+" doesn't exist at path "+argument0,false); }