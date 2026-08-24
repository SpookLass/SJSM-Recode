/*
Argument 0: File path
Argument 1: Variable name
Argument 2: Print
ONLY USE THIS WHEN THE GAME LOADS
*/
if !variable_global_exists(argument1)
{
    // Add the model
    local.mdl = d3d_model_create();
    d3d_model_load(local.mdl,argument0+".gmmod");
    globalvar_scr(local.mdl,argument1,false);
    globalvar_scr(argument0,argument1+"_path",argument2);
    if argument2 { show_message("Initialized model "+argument0+" at variable "+argument1); }
    return local.mdl;
}
else if argument2 { show_error("Variable "+argument1+" already in use!",false); }