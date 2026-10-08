/*
Argument 0: Path (no file extension)
Argument 1: Name (Blank for default)
Argument 2-14: Object Argument 3-15
*/
if file_exists(argument0+".gml")
{
    if !is_string(argument1)
    { local.name = filename_name(argument0); }
    else { local.name = argument1; }
    local.obj = object_add();
    execute_file(argument0+".gml",local.obj,local.name,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10,argument11,argument12,argument13,argument14);
    obj_name_arr[local.obj] = local.name;
    return local.obj;
}
fmod_update_take_over_when_lock_scr();
show_error("Object does not exist!",false);
global.last_time_var = current_time;
display_mouse_set(display_get_width()/2,display_get_height()/2);
fmod_update_take_over_done_scr();
return noone;