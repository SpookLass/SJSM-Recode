/*
Argument 0: Sound file path
Argument 1: 3D
Argument 2: Group
Argument 3: Volume
Argument 4: Min distance
Argument 5: Max distance
*/
local.snd = fmod_snd_add_scr(vanilla_directory_const+"\SND\AMB\AMB_11.mp3",false);
fmod_snd_set_group_scr(local.snd,snd_group_mus_const);
return local.snd;