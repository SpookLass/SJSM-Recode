/*
Argument 0: File path
Argument 1: Variable name
Argument 2: Print
ONLY USE THIS WHEN THE GAME LOADS
*/
// If the file exists
if argument0 != "" && file_exists(argument0)
{
    if argument2 { show_message("Initialized sound at "+argument1); }
    // Add the sprite
    local.snd = fmod_snd_add_scr(argument0);
    // Add sprite to variable using execute_string
    execute_string
    (
        // If variable has not been set previously, set it.
        "if "+argument1+" == 0
        {
            globalvar "+argument1+";
            "+argument1+" = "+string(local.snd)+";
        }
        else if "+string(argument2)+"
        { show_error('Variable "+argument1+" already in use!',false); }"
    );
}
else if argument2 { show_error("File "+argument1+" doesn't exist at path "+argument0,false); }