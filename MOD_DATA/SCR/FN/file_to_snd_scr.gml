/*
Argument 0: File path
Argument 1: Variable name
Argument 2: 3D
Argument 3: Group
Argument 4: Print
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
            local.snd = execute_file(local.settings_file,argument0);
            if argument4 { show_message("Initialized file with settings at "+argument1); }
        }
        // Else, use arguments
        else
        {
            local.snd = fmod_snd_add_scr(argument0,argument2);
            fmod_snd_set_group_scr(local.snd,argument3);
            if argument4 { show_message("Initialized file WITHOUT settings at "+argument1); }
        }
        // Add sound to variable
        execute_string("globalvar "+argument1);
        variable_global_set(argument1,local.snd);
    }
    else if argument4 { show_error("Variable "+argument1+" already in use!",false); }
}
else if argument4 { show_error("File "+argument1+" doesn't exist at path "+argument0,false); }