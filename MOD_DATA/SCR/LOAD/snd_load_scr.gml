/*
Argument 0: Print
*/
fmod_load_scr();
fmod_ini_scr(100,false); // 100 is max sounds, second argument is web sounds
// Get the first file in the main directory
local.i = 0;
// Wave
local.file = file_find_first(main_directory_const+"\SND\MAIN\*.wav",-1);
while (local.file != "")
{
    file_to_snd_scr(main_directory_const+"\SND\MAIN\"+local.file,filename_change_ext(local.file,""),false,snd_group_sfx_const,argument0);
    local.file = file_find_next();
    local.i += 1;
    // Draw
    draw_load_scr("Loading sounds ("+string(local.i)+")...");
}
file_find_close();
// MP3
local.file = file_find_first(main_directory_const+"\SND\MAIN\*.mp3",-1);
while (local.file != "")
{
    file_to_snd_scr(main_directory_const+"\SND\MAIN\"+local.file,filename_change_ext(local.file,""),false,snd_group_sfx_const,argument0);
    local.file = file_find_next();
    local.i += 1;
    // Draw
    draw_load_scr("Loading sounds ("+string(local.i)+")...");
}
file_find_close();
// OGG
local.file = file_find_first(main_directory_const+"\SND\MAIN\*.ogg",-1);
while (local.file != "")
{
    file_to_snd_scr(main_directory_const+"\SND\MAIN\"+local.file,filename_change_ext(local.file,""),false,snd_group_sfx_const,argument0);
    local.file = file_find_next();
    local.i += 1;
    // Draw
    draw_load_scr("Loading sounds ("+string(local.i)+")...");
}
file_find_close();
// Draw
draw_load_scr("Loading ambience...");
// Manual
file_to_snd_scr(vanilla_directory_const+"\SND\AMB\AMB_01.mp3","amb_mus_01_snd",false,snd_group_mus_const,argument0);
file_to_snd_scr(vanilla_directory_const+"\SND\AMB\AMB_02.mp3","amb_mus_02_snd",false,snd_group_mus_const,argument0);
file_to_snd_scr(vanilla_directory_const+"\SND\AMB\AMB_03.mp3","amb_mus_03_snd",false,snd_group_mus_const,argument0);
file_to_snd_scr(vanilla_directory_const+"\SND\AMB\AMB_04.mp3","amb_mus_04_snd",false,snd_group_mus_const,argument0);
file_to_snd_scr(vanilla_directory_const+"\SND\AMB\AMB_05.mp3","amb_mus_05_snd",false,snd_group_mus_const,argument0);
file_to_snd_scr(vanilla_directory_const+"\SND\AMB\AMB_06.mp3","amb_mus_06_snd",false,snd_group_mus_const,argument0);
file_to_snd_scr(vanilla_directory_const+"\SND\AMB\AMB_07.mp3","amb_mus_07_snd",false,snd_group_mus_const,argument0);
file_to_snd_scr(vanilla_directory_const+"\SND\AMB\AMB_08.mp3","amb_mus_08_snd",false,snd_group_mus_const,argument0);
file_to_snd_scr(vanilla_directory_const+"\SND\AMB\AMB_09.mp3","amb_mus_09_snd",false,snd_group_mus_const,argument0);
file_to_snd_scr(vanilla_directory_const+"\SND\AMB\AMB_10.mp3","amb_mus_10_snd",false,snd_group_mus_const,argument0);
file_to_snd_scr(vanilla_directory_const+"\SND\AMB\AMB_11.mp3","amb_mus_11_snd",false,snd_group_mus_const,argument0);
// Mod stuff
for (local.j=0; local.j<ds_list_size(global.mod_list); local.j+=1;)
{
    local.dir = ds_list_find_value(global.mod_list,local.j);
    local.i = 0;
    // Wave
    local.file = file_find_first(local.dir+"\SND\MAIN\*.wav",-1);
    while (local.file != "")
    {
        file_to_snd_scr(local.dir+"\SND\MAIN\"+local.file,filename_change_ext(local.file,""),false,snd_group_sfx_const,argument0);
        local.file = file_find_next();
        local.i += 1;
        // Draw
        draw_load_scr("Loading mod sounds ("+string(local.i)+")...");
    }
    file_find_close();
    // MP3
    local.file = file_find_first(local.dir+"\SND\MAIN\*.mp3",-1);
    while (local.file != "")
    {
        file_to_snd_scr(local.dir+"\SND\MAIN\"+local.file,filename_change_ext(local.file,""),false,snd_group_sfx_const,argument0);
        local.file = file_find_next();
        local.i += 1;
        // Draw
        draw_load_scr("Loading mod sounds ("+string(local.i)+")...");
    }
    file_find_close();
    // OGG
    local.file = file_find_first(local.dir+"\SND\MAIN\*.ogg",-1);
    while (local.file != "")
    {
        file_to_snd_scr(local.dir+"\SND\MAIN\"+local.file,filename_change_ext(local.file,""),false,snd_group_sfx_const,argument0);
        local.file = file_find_next();
        local.i += 1;
        // Draw
        draw_load_scr("Loading mod sounds ("+string(local.i)+")...");
    }
    file_find_close();
}
// Draw
draw_load_scr("Loaded sounds!");