/*
Argument 0: Path (no file extension)
*/
if file_exists(argument0+".gmmod")
{
    local.mdl = d3d_model_create();
    d3d_model_load(local.mdl,argument0+".gmmod");
    return local.mdl;
}
if file_exists(argument0+".d3d")
{
    local.mdl = d3d_model_create();
    d3d_model_load(local.mdl,argument0+".d3d");
    return local.mdl;
}
fmod_update_take_over_when_lock_scr();
show_error("Model does not exist!",false);
global.last_time_var = current_time;
display_mouse_set(display_get_width()/2,display_get_height()/2);
fmod_update_take_over_done_scr();
return noone;
