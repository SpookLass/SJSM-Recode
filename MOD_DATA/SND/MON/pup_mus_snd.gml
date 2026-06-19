/*
Argument 0: Sound file path
Argument 1: 3D
Argument 2: Group
Argument 3: Volume
Argument 4: Min distance
Argument 5: Max distance
*/
local.snd = fmod_snd_add_scr(argument0+".mp3",false);
fmod_snd_set_group_scr(local.snd,snd_group_mus_const);
fmod_snd_set_max_vol_scr(local.snd,argument3);
fmod_snd_set_loop_point_scr(local.snd,3/144,137/144); // Not exact
return local.snd;