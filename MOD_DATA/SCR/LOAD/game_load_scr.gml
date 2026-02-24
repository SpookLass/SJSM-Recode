// Set variables
window_set_color(make_color_rgb(30,0,50));
texture_set_repeat(true);
action_set_cursor(-1,false);
draw_set_color(c_white);
draw_set_alpha(1);
d3d_set_lighting(false);
d3d_set_culling(false);
d3d_set_hidden(false);
draw_set_font(main_font);
splash_set_close_button(false);
global.game_spd_var = 1;
global.draw_3d_var = false;
global.res_override_var = false;
global.js_override_var = false;
global.note_override_var = false;
globalvar float_grid;
globalvar phys_grid;
globalvar input_arr;
globalvar input_prev_arr;
globalvar input_press_arr;
globalvar input_key_arr;
globalvar input_menu_hold_arr;
globalvar spawn_arr;
global.spawn_len_var = -1;
global.spawn_len_extra_var = -1;
global.mark_len_var = -1;
global.js_mark_len_var = -1;
global.rm_count_var = 0;
global.input_len_var = 24;
global.debug_var = false;
global.last_time_var = current_time;
global.reflect_var = false;
global.reflect_pos_var = 0;
global.reflect_axis_var = 0;
global.no_mon_var = false;
global.mon_fail_var = 0;
global.hide_hud_var = false;
global.hide_debug_var = false;
global.pause_var = false;
global.mouse_free_var = false;
global.debug_unlock_var = true;
for (local.i=0; local.i<8; local.i+=1;)
{
    input_menu_hold_arr[0,local.i] = 0;
    input_menu_hold_arr[1,local.i] = 0;
    input_menu_hold_arr[2,local.i] = 0;
    input_menu_hold_arr[3,local.i] = 0;
}
global.fog_var = false;
global.fog_dark_var = true;
global.fog_color_var = c_black;
global.fog_start_var = 0;
global.fog_end_var = 0;
// Lists
global.mon_list = ds_list_create();
ds_list_clear(global.mon_list);
global.mon_spawn_list = ds_list_create();
ds_list_clear(global.mon_spawn_list);
global.mon_curr_list = ds_list_create();
ds_list_clear(global.mon_curr_list);
global.save_list = ds_list_create();
ds_list_clear(global.save_list);
// Draw Text
draw_set_halign(fa_center); draw_set_valign(fa_bottom);
set_automatic_draw(false);
// Initialize mods and dlls
joy_ini_scr();
if gamemaker_version == 800 { sf_ini_scr(); }
execute_file(main_directory_const+"\SCR\LOAD\mod_load_01_scr.gml");
// Assets
execute_file(main_directory_const+"\SCR\LOAD\spr_load_scr.gml");
execute_file(main_directory_const+"\SCR\LOAD\bg_load_scr.gml");
execute_file(main_directory_const+"\SCR\LOAD\snd_load_scr.gml");
execute_file(main_directory_const+"\SCR\LOAD\mdl_load_scr.gml");
execute_file(main_directory_const+"\SCR\LOAD\coll_load_scr.gml");
execute_file(main_directory_const+"\SCR\LOAD\part_load_scr.gml");
execute_file(main_directory_const+"\SCR\LOAD\obj_load_scr.gml");
execute_file(main_directory_const+"\SCR\LOAD\rm_load_scr.gml");
execute_file(main_directory_const+"\SCR\LOAD\zone_load_scr.gml",true);
execute_file(main_directory_const+"\SCR\LOAD\tex_load_scr.gml");
execute_file(main_directory_const+"\SCR\LOAD\js_load_scr.gml");
if gamemaker_version == 800 { shader_load_scr(); }
// Settings
execute_file(main_directory_const+"\SCR\LOAD\menu_load_scr.gml");
// Load Mods
execute_file(main_directory_const+"\SCR\LOAD\mod_load_02_scr.gml");
// Load Settings
execute_file(main_directory_const+"\SCR\LOAD\set_load_scr.gml");
// In case mods load more controls
for (local.i=0; local.i<global.input_len_var; local.i+=1)
{
    for (local.j=0; local.j<8; local.j+=1;)
    {
        global.input_arr[local.i,local.j] = false;
        global.input_prev_arr[local.i,local.j] = 0;
    }
}
// Gay
global.pride_len_var = 30;
global.pride_arr[0] = pride_color_obj;
global.pride_arr[1] = abro_color_obj;
global.pride_arr[2] = ace_color_obj;
//global.pride_arr[0] = aceflux_color_obj;
global.pride_arr[3] = agender_color_obj;
global.pride_arr[4] = aro_color_obj;
global.pride_arr[5] = aroace_color_obj;
global.pride_arr[6] = bi_color_obj;
global.pride_arr[7] = bigender_color_obj;
global.pride_arr[8] = demiboy_color_obj;
global.pride_arr[9] = demigirl_color_obj;
global.pride_arr[10] = enby_color_obj;
global.pride_arr[11] = gay_color_obj;
global.pride_arr[12] = genderfluid_color_obj;
global.pride_arr[13] = genderflux_color_obj;
global.pride_arr[14] = genderqueer_color_obj;
global.pride_arr[15] = grayce_color_obj;
global.pride_arr[16] = grayro_color_obj;
global.pride_arr[17] = lesbian_color_obj;
global.pride_arr[18] = maverique_color_obj;
global.pride_arr[19] = omni_color_obj;
global.pride_arr[21] = pan_color_obj;
global.pride_arr[22] = pangender_color_obj;
global.pride_arr[23] = polyce_color_obj;
global.pride_arr[24] = queer_color_obj;
global.pride_arr[25] = trans_color_obj;
global.pride_arr[26] = transfem_color_obj;
global.pride_arr[27] = transmasc_color_obj;
global.pride_arr[28] = trigender_color_obj;
global.pride_arr[29] = xenogender_color_obj;
// Stop drawing text
draw_set_halign(fa_left); draw_set_valign(fa_top);
// Load
global.player_len_var = 1;
instance_create(0,0,control_obj);
rm_goto_menu_scr(splash_rm);