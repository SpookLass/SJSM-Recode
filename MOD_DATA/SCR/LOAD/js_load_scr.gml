/*
Argument 0: Print
*/
global.js_len_var = 0;

local.index = 1;
local.index_str = '01'

while file_exists(vanilla_directory_const+"\TEX\SCARE_"+local.index_str+'.png')
{
    global.js_arr[global.js_len_var,0] = vanilla_directory_const+"\TEX\SCARE_"+local.index_str+".png";
    global.js_arr[global.js_len_var,1] = vanilla_directory_const+"\TEX\SCARE_"+local.index_str+"B.png";
    global.js_arr[global.js_len_var,2] = "";
    if argument0 { show_message("Added jumpscare "+local.index_str+" at index "+string(global.js_len_var)); }
    global.js_len_var += 1;
    // Draw
    draw_load_scr("Loading jumpscares ("+string(local.index)+")...");
    // Index
    local.index += 1;
    if local.index < 10 { local.index_str = '0'+string(local.index); }
    else { local.index_str = string(local.index); }
    
}
global.js_arr[global.js_len_var,0] = vanilla_directory_const+"\TEX\SCARE_01S.png";
global.js_arr[global.js_len_var,1] = vanilla_directory_const+"\TEX\SCARE_01B.png";
global.js_arr[global.js_len_var,2] = "";
if argument0 { show_message("Added jumpscare 01S at index "+string(global.js_len_var)); }
global.js_len_var += 1;

global.js_story_len_var = global.js_len_var;

local.index = 1;
local.index_str = '01';

while file_exists(vanilla_directory_const+"\EM\TEX\JS_"+local.index_str+'.png')
{
    global.js_arr[global.js_len_var,0] = vanilla_directory_const+"\EM\TEX\JS_"+local.index_str+".png";
    global.js_arr[global.js_len_var,1] = vanilla_directory_const+"\EM\TEX\JS_"+local.index_str+"B.png";
    global.js_arr[global.js_len_var,2] = "";
    if argument0 { show_message("Added EM jumpscare "+local.index_str+" at index "+string(global.js_len_var)); }
    global.js_len_var += 1;
    // Draw
    draw_load_scr("Loading endless jumpscares ("+string(local.index)+")...");
    // Index
    local.index += 1;
    if local.index < 10 { local.index_str = '0'+string(local.index); }
    else { local.index_str = string(local.index); }
}

global.js_snd_story_len_var = 12;
global.js_snd_len_var = 20;

global.js_snd_arr[0] = vanilla_directory_const+'\SND\STAB_01.wav';
global.js_snd_arr[1] = vanilla_directory_const+'\SND\STAB_02.wav';
global.js_snd_arr[2] = vanilla_directory_const+'\SND\STAB_03.wav';
global.js_snd_arr[3] = vanilla_directory_const+'\SND\STAB_04.wav';
global.js_snd_arr[4] = vanilla_directory_const+'\SND\STAB_05.wav';
global.js_snd_arr[5] = vanilla_directory_const+'\SND\STAB_06.wav';
global.js_snd_arr[6] = vanilla_directory_const+'\SND\STAB_07.wav';
global.js_snd_arr[7] = vanilla_directory_const+'\SND\STAB_08.wav';
global.js_snd_arr[8] = main_directory_const+'\SND\MON\stab_09_snd.wav';
global.js_snd_arr[9] = main_directory_const+'\SND\MON\stab_10_snd.wav';
global.js_snd_arr[10] = main_directory_const+'\SND\MON\stab_11_snd.wav';
global.js_snd_arr[11] = main_directory_const+'\SND\MON\stab_12_snd.wav';
global.js_snd_arr[12] = main_directory_const+'\SND\MON\stab_em_01_snd.wav';
global.js_snd_arr[13] = main_directory_const+'\SND\MON\stab_em_02_snd.wav';
global.js_snd_arr[14] = main_directory_const+'\SND\MON\stab_em_03_snd.wav';
global.js_snd_arr[15] = main_directory_const+'\SND\MON\stab_em_04_snd.wav';
global.js_snd_arr[16] = main_directory_const+'\SND\MON\stab_em_05_snd.wav';
global.js_snd_arr[17] = main_directory_const+'\SND\MON\stab_em_06_snd.wav';
global.js_snd_arr[18] = main_directory_const+'\SND\MON\stab_em_07_snd.wav';
global.js_snd_arr[19] = main_directory_const+'\SND\MON\stab_em_08_snd.wav';

if file_exists(working_directory+"\Karamari_Hospital\KH.exe")
{
    // Pepper
    global.js_arr[global.js_len_var,0] = main_directory_const+"\BG\KH\js_pepper_01_bg.png";
    global.js_arr[global.js_len_var,1] = main_directory_const+"\BG\KH\js_pepper_02_bg.png";
    global.js_arr[global.js_len_var,2] = "";
    if argument0 { show_message("Added Pepper jumpscare at index "+string(global.js_len_var)); }
    global.js_len_var += 1;
    // Can
    global.js_arr[global.js_len_var,0] = main_directory_const+"\BG\KH\js_can_01_bg.png";
    global.js_arr[global.js_len_var,1] = main_directory_const+"\BG\KH\js_can_02_bg.png";
    global.js_arr[global.js_len_var,2] = main_directory_const+'\SND\KH\js_oho_snd.wav';
    if argument0 { show_message("Added Can jumpscare at index "+string(global.js_len_var)); }
    global.js_len_var += 1;
}
// Draw
draw_load_scr("Loaded jumpscares!");