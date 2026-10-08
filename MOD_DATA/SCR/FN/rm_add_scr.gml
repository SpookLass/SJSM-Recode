/*
Argument 0: Path (no file extension)
Argument 1-14: Room Argument 2-15
*/
if file_exists(argument0+".gml")
{
    local.name = filename_name(argument0);
    if variable_global_exists(local.name)
    {
        local.rm = variable_global_get(local.name);
        room_instance_clear(local.rm);
    }
    else
    {
        local.rm = room_add();
        globalvar_scr(local.rm,local.name,false);
        rm_name_arr[local.rm] = local.name;
    }
    execute_file(argument0+".gml",local.rm,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10,argument11,argument12,argument13,argument14);
    return local.rm;
}
fmod_update_take_over_when_lock_scr();
show_error("Room does not exist!",false);
global.last_time_var = current_time;
display_mouse_set(display_get_width()/2,display_get_height()/2);
fmod_update_take_over_done_scr();
return noone;