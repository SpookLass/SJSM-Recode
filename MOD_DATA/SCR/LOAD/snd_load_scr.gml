/*
Argument 0: Print
*/
fmod_load_scr(); // I'll rename these eventually
fmod_ini_scr(100,false); // 100 is max sounds, second argument is web sounds
fmod_set_all_vol_scr(global.vol_var/100);
// Get the first file in the main directory
local.file = file_find_first(main_directory_const+"\SND\MAIN\*.wav",-1);
// Not sure why, but it doesn't include the path.
while (local.file != "")
{
    file_to_snd_scr(main_directory_const+"\SND\MAIN\"+local.file,filename_change_ext(local.file,""),argument0);
    local.file = file_find_next();
}
file_find_close();
// OGG! Thank you Gaster
local.file = file_find_first(main_directory_const+"\SND\MAIN\*.ogg",-1);
// Not sure why, but it doesn't include the path.
while (local.file != "")
{
    file_to_snd_scr(main_directory_const+"\SND\MAIN\"+local.file,filename_change_ext(local.file,""),argument0);
    local.file = file_find_next();
}
file_find_close();