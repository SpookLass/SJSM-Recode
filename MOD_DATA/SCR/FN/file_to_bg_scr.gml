/*
Argument 0: File path
Argument 1: Variable name
Argument 2: Remove Background
Argument 3: Smooth
Argument 4: Print
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
        local.remove_back = file_text_read_real(local.settings); file_text_readln(local.settings);
        local.smooth = file_text_read_real(local.settings); file_text_close(local.settings);
        if argument4 { show_message(
            "Initialized file with settings at "+argument1+"
            ##Remove Back: "+string(local.remove_back)+"
            ##Smooth: "+string(local.smooth)
        );}
    }
    // Else, use arguments
    else
    {
        if argument4 { show_message("Initialized file WITHOUT settings at "+argument1); }
        local.remove_back = argument2;
        local.smooth = argument3;
    }
    // Add the background
    local.bg = background_add(argument0,local.remove_back,local.smooth);
    // Add background to variable using execute_string
    execute_string
    (
        // If variable has not been set previously, set it.
        "if "+argument1+" == 0
        {
            globalvar "+argument1+";
            globalvar "+argument1+"_tex;
            "+argument1+" = "+string(local.bg)+";
            "+argument1+"_tex = background_get_texture("+argument1+");
        }
        else if "+string(argument4)+"
        { show_error('Variable "+argument1+" already in use!',false); }"
    );
}
else if argument4 { show_error("File "+argument1+" doesn't exist at path "+argument0,false); }