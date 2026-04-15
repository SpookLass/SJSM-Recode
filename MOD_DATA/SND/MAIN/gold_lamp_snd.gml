/*
Argument 0: Sound file path
*/
local.snd = fmod_snd_add_scr(argument0,true);
fmod_snd_set_group_scr(local.snd,snd_group_sfx_const);
fmod_snd_set_minmax_dist_scr(local.snd,32/3,320/3);
fmod_snd_set_max_vol_scr(local.snd,0.1);
return local.snd;