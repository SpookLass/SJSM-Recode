/*
Argument 0: Path (no file extension)
Argument 1: 3D
Argument 2: Group
Argument 3: Volume
Argument 4: Min distance
Argument 5: Max distance
*/
if file_exists(argument0+".gml") { return execute_file(argument0+".gml",argument0,argument1,argument2,argument3,argument4,argument5); }
local.snd = noone;
if file_exists(argument0+".wav") { local.snd = fmod_snd_add_scr(argument0+".wav",argument1); }
else if file_exists(argument0+".mp3") { local.snd = fmod_snd_add_scr(argument0+".mp3",argument1); }
else if file_exists(argument0+".ogg") { local.snd = fmod_snd_add_scr(argument0+".ogg",argument1); }
if local.snd != noone
{
    fmod_snd_set_group_scr(local.snd,argument2);
    fmod_snd_set_max_vol_scr(local.snd,argument3);
    if argument1 { fmod_snd_set_minmax_dist_scr(local.snd,argument4,argument5); }
}
else
{
    fmod_update_take_over_when_lock_scr();
    show_error("Sound does not exist!",false);
    global.last_time_var = current_time;
    display_mouse_set(display_get_width()/2,display_get_height()/2);
    fmod_update_take_over_done_scr();
}
return local.snd;