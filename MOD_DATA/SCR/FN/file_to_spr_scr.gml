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
    local.settings_file = filename_change_ext(argument0,".txt");
    // If settings file exists, read it.
    if file_exists(local.settings_file)
    {
        local.settings = file_text_open_read(local.settings_file);
        local.num = file_text_read_real(local.settings); file_text_readln(local.settings);
        local.remove_back = file_text_read_real(local.settings); file_text_readln(local.settings);
        local.smooth = file_text_read_real(local.settings); file_text_readln(local.settings);
        local.x_origin = file_text_read_real(local.settings); file_text_readln(local.settings);
        local.y_origin = file_text_read_real(local.settings); file_text_close(local.settings);
        if argument7 { show_message(
            "Initialized file with settings at "+argument1+"
            ##Number: "+string(local.num)+"
            ##Remove Back: "+string(local.remove_back)+"
            ##Smooth: "+string(local.smooth)+"
            ##X Origin: "+string(local.x_origin)+"
            ##Y Origin: "+string(local.y_origin)
        );}
    }
    // Else, use arguments
    else
    {
        if argument7 { show_message("Initialized file WITHOUT settings at "+argument1); }
        local.num = argument2;
        local.remove_back = argument3;
        local.smooth = argument4;
        local.x_origin = argument5;
        local.y_origin = argument6;
    }
    // Add the sprite
    local.spr = sprite_add(argument0,local.num,local.remove_back,local.smooth,local.x_origin,local.y_origin);
    // If origin is -1, set it to center. 
    if local.x_origin == -1 { local.x_origin = sprite_get_width(local.spr)/2; }
    if local.y_origin == -1 { local.y_origin = sprite_get_height(local.spr)/2; }
    sprite_set_offset(local.spr,local.x_origin,local.y_origin);
    // Add sprite to variable using execute_string
    execute_string
    (
        // If variable has not been set previously, set it.
        "if "+argument1+" == 0
        {
            globalvar "+argument1+";
            "+argument1+" = "+string(local.spr)+";
        }
        else if "+string(argument7)+"
        { show_error('Variable "+argument1+" already in use!',false); }"
    );
}
else if argument7 { show_error("File "+argument1+" doesn't exist at path "+argument0,false); }