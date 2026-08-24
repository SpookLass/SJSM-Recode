/*
Argument 0: Path (no file extension)
*/
if file_exists(argument0+".gml")
{
    local.name = filename_name(argument0);
    local.obj = object_add();
    execute_file(argument0+".gml",local.obj,local.name);
    obj_name_arr[local.obj] = local.name;
    return local.obj;
}
fmod_update_take_over_when_lock_scr();
show_error("Object does not exist!",false);
global.last_time_var = current_time;
display_mouse_set(display_get_width()/2,display_get_height()/2);
fmod_update_take_over_done_scr();
return noone;