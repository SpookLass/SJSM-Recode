/*
Argument 0: Sound file path
*/
local.snd = fmod_snd_add_scr(argument0,false);
fmod_snd_set_group_scr(local.snd,snd_group_mus_const);
fmod_snd_set_loop_point_scr(local.snd,2/11,10/11)
return local.snd;