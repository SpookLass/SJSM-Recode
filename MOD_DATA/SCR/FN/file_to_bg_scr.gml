/*
Argument 0: File path
Argument 1: Variable name
Argument 2: Print
Argument 3: Remove background
Argument 4: Smooth
ONLY USE THIS WHEN THE GAME LOADS
*/
if !variable_global_exists(argument1)
{
    local.asset = execute_file(argument0+".gml",argument0,argument3,argument4);
    globalvar_scr(local.asset,argument1,false);
    globalvar_scr(background_get_texture(local.asset),argument1+"_tex",false);
    if argument2 { show_message("Initialized asset "+argument0+" at variable "+argument1); }
    return local.asset;
}
else if argument2 { show_message("Variable "+argument1+" already in use!"); }