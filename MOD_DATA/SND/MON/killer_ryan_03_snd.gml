/*
Argument 0: Sound file path
Argument 1: 3D
Argument 2: Group
Argument 3: Volume
Argument 4: Min distance
Argument 5: Max distance
Author: Ryan J.
*/
local.snd = fmod_snd_add_scr(argument0+".wav",argument1);
fmod_snd_set_group_scr(local.snd,argument2);
fmod_snd_set_max_vol_scr(local.snd,argument3);
if argument1 { fmod_snd_set_minmax_dist_scr(local.snd,argument4,argument5); }
return local.snd;