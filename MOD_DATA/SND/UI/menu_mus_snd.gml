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
fmod_snd_set_loop_point_scr(local.snd,5/70,69/70);
return local.snd;