/*
Argument 0: File path
Argument 1: Variable name
Argument 2: Type
Argument 3: Print
ONLY USE THIS WHEN THE GAME LOADS
*/
// If the file exists
if argument0 != "" && file_exists(argument0)
{
    local.settings_file = filename_change_ext(argument0,".txt");
    // If settings file exists, read it.
    if file_exists(local.settings_file)
    {
        local.settings = file_text_open_read(local.settings_file);
        local.type = file_text_read_real(local.settings);
        file_text_close(local.settings);
        if argument3 { show_message(
            "Initialized file with settings at "+argument1+"
            ##Type: "+string(local.type)
        );}
    }
    // Else, use arguments
    else
    {
        if argument3 { show_message("Initialized file WITHOUT settings at "+argument1); }
        local.type = argument2;
    }
    // Add the sprite
    local.snd = sound_add(argument0,local.type,argument3);
    // Add sprite to variable using execute_string
    execute_string
    (
        // If variable has not been set previously, set it.
        "if "+argument1+" == 0
        {
            globalvar "+argument1+";
            "+argument1+" = "+string(local.snd)+";
        }
        else if "+string(argument3)+"
        { show_error('Variable "+argument1+" already in use!',false); }"
    );
}
else if argument3 { show_error("File "+argument1+" doesn't exist at path "+argument0,false); }