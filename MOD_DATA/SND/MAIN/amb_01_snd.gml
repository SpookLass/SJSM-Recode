/*
Argument 0: Sound file path
*/
local.snd = fmod_snd_add_scr(argument0,true);
fmod_snd_set_group_scr(local.snd,snd_group_sfx_const);
fmod_snd_set_minmax_dist_scr(local.snd,128,256);
return local.snd;