/*
Argument 0: Print
*/
global.tex_var = 0;
global.tex_len_var = 0;

local.index = 1;
local.index_str = '01'

while file_exists(vanilla_directory_const+"\TEX\FLOOR_"+local.index_str+'.png')
{
    global.tex_arr[global.tex_len_var,0] = vanilla_directory_const+"\TEX\FLOOR_"+local.index_str+".png";
    global.tex_arr[global.tex_len_var,1] = vanilla_directory_const+"\TEX\WALL_"+local.index_str+".png";
    global.tex_arr[global.tex_len_var,2] = vanilla_directory_const+"\TEX\ROOF_"+local.index_str+".png";
    global.tex_arr[global.tex_len_var,3] = vanilla_directory_const+"\TEX\FLOOR_"+local.index_str+"L0.png";
    global.tex_arr[global.tex_len_var,4] = vanilla_directory_const+"\TEX\WALL_"+local.index_str+"L0.png";
    if argument0 { show_message("Added tex set "+local.index_str+" at index "+string(global.tex_len_var)); }
    global.tex_len_var += 1;
    // Draw
    draw_clear_alpha(c_black,0);
    draw_text_transformed(view_wview[view_current]/2,view_hview[view_current]*0.9,"Loading texture sets ("+string(local.index)+")...",1,1,0);
    screen_refresh();
    // Index
    local.index += 1;
    if local.index < 10 { local.index_str = '0'+string(local.index); }
    else { local.index_str = string(local.index); }
}

global.tex_story_len_var = global.tex_len_var

local.index = 1;
local.index_str = '01';

while file_exists(vanilla_directory_const+"\EM\TEX\EM_FLOOR_"+local.index_str+'.png')
{
    global.tex_arr[global.tex_len_var,0] = vanilla_directory_const+"\EM\TEX\EM_FLOOR_"+local.index_str+".png";
    global.tex_arr[global.tex_len_var,1] = vanilla_directory_const+"\EM\TEX\EM_WALL_"+local.index_str+".png";
    global.tex_arr[global.tex_len_var,2] = vanilla_directory_const+"\EM\TEX\EM_ROOF_"+local.index_str+".png";
    global.tex_arr[global.tex_len_var,3] = vanilla_directory_const+"\EM\TEX\EM_FLOOR_"+local.index_str+"L0.png";
    global.tex_arr[global.tex_len_var,4] = vanilla_directory_const+"\EM\TEX\EM_WALL_"+local.index_str+"L0.png";
    if argument0 { show_message("Added tex set EM"+local.index_str+" at index "+string(global.tex_len_var)); }
    global.tex_len_var += 1;
    // Draw
    draw_clear_alpha(c_black,0);
    draw_text_transformed(view_wview[view_current]/2,view_hview[view_current]*0.9,"Loading endless texture sets ("+string(local.index)+")...",1,1,0);
    screen_refresh();
    // Index
    local.index += 1;
    if local.index < 10 { local.index_str = '0'+string(local.index); }
    else { local.index_str = string(local.index); }
}
// Draw
draw_clear_alpha(c_black,0);
draw_text_transformed(view_wview[view_current]/2,view_hview[view_current]*0.9,"Loaded texture sets!",1,1,0);
screen_refresh();