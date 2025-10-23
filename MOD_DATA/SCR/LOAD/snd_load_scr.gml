/*
Argument 0: Print
*/
fmod_load_scr(); // I'll rename these eventually
fmod_ini_scr(100,false); // 100 is max sounds, second argument is web sounds
fmod_set_all_vol_scr(global.vol_var/100);
fmod_set_group_vol_scr(snd_group_sfx_const,global.sfx_vol_var/100);
fmod_set_group_vol_scr(snd_group_mon_const,global.mon_vol_var/100);
fmod_set_group_vol_scr(snd_group_mus_const,global.mus_vol_var/100);
fmod_set_group_vol_scr(snd_group_voice_const,global.voice_vol_var/100);
// Get the first file in the main directory
local.file = file_find_first(main_directory_const+"\SND\MAIN\*.wav",-1);
// Not sure why, but it doesn't include the path.
while (local.file != "")
{
    file_to_snd_scr(main_directory_const+"\SND\MAIN\"+local.file,filename_change_ext(local.file,""),snd_group_sfx_const,argument0);
    local.file = file_find_next();
}
file_find_close();
// Manual
file_to_snd_scr(vanilla_directory_const+"\SND\AMB\AMB_01.mp3","amb_mus_01_snd",snd_group_mus_const,argument0);
file_to_snd_scr(vanilla_directory_const+"\SND\AMB\AMB_02.mp3","amb_mus_02_snd",snd_group_mus_const,argument0);
file_to_snd_scr(vanilla_directory_const+"\SND\AMB\AMB_03.mp3","amb_mus_03_snd",snd_group_mus_const,argument0);
file_to_snd_scr(vanilla_directory_const+"\SND\AMB\AMB_04.mp3","amb_mus_04_snd",snd_group_mus_const,argument0);
file_to_snd_scr(vanilla_directory_const+"\SND\AMB\AMB_05.mp3","amb_mus_05_snd",snd_group_mus_const,argument0);
file_to_snd_scr(vanilla_directory_const+"\SND\AMB\AMB_06.mp3","amb_mus_06_snd",snd_group_mus_const,argument0);
file_to_snd_scr(vanilla_directory_const+"\SND\AMB\AMB_07.mp3","amb_mus_07_snd",snd_group_mus_const,argument0);
file_to_snd_scr(vanilla_directory_const+"\SND\AMB\AMB_08.mp3","amb_mus_08_snd",snd_group_mus_const,argument0);
file_to_snd_scr(vanilla_directory_const+"\SND\AMB\AMB_09.mp3","amb_mus_09_snd",snd_group_mus_const,argument0);
file_to_snd_scr(vanilla_directory_const+"\SND\AMB\AMB_10.mp3","amb_mus_10_snd",snd_group_mus_const,argument0);
file_to_snd_scr(vanilla_directory_const+"\SND\AMB\AMB_11.mp3","amb_mus_11_snd",snd_group_mus_const,argument0);