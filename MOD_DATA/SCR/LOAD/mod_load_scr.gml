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
global.version_var = "Project Recode - Mod Loader: v26.4.6";
global.game_var = false;
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
globalvar obj_name_arr;
global.spawn_len_var = -1;
global.spawn_len_extra_var = -1;
global.mark_len_var = -1;
global.js_mark_len_var = -1;
global.rm_count_var = 0;
global.rm_count_override_var = noone;
global.input_len_var = 26;
global.debug_var = false;
global.reflect_var = false;
global.reflect_pos_var = 0;
global.reflect_axis_var = 0;
global.no_mon_var = false;
global.mon_fail_var = 0;
global.hide_rm_var = false;
global.hide_hud_var = false;
global.hide_debug_var = false;
global.pause_var = false;
global.can_pause_var = true;
global.mouse_free_var = false;
global.debug_unlock_var = false; // Change to false on release!!!
global.draw_time_var = 0;
global.fps_curr_var = 0;
global.boss_var = noone;
global.permadeath_var = false;
for (local.i=0; local.i<8; local.i+=1;)
{
    input_menu_hold_arr[0,local.i] = 0;
    input_menu_hold_arr[1,local.i] = 0;
    input_menu_hold_arr[2,local.i] = true;
    input_menu_hold_arr[3,local.i] = 0;
    input_menu_hold_arr[4,local.i] = 0;
    input_menu_hold_arr[5,local.i] = true;
}
// Fog
global.fog_var = false;
global.fog_dark_var = true;
global.fog_color_var = c_black;
global.fog_start_var = 0;
global.fog_end_var = 0;
// Timing
global.last_time_var = current_time;
global.time_diff_var = 0;
global.true_delta_time_var = 0;
global.delta_time_var = 0;
global.game_time_var = 0;
// Lists
global.mon_list = ds_list_create();
ds_list_clear(global.mon_list);
global.mon_spawn_list = ds_list_create();
ds_list_clear(global.mon_spawn_list);
global.mon_curr_list = ds_list_create();
ds_list_clear(global.mon_curr_list);
global.save_list = ds_list_create();
ds_list_clear(global.save_list);
// Workarounds
globalvar fog_par_obj;
fog_par_obj = noone;
pause_menu_obj = noone;
// Draw Text
draw_set_halign(fa_center); draw_set_valign(fa_bottom);
set_automatic_draw(false);
// Initialize dlls
joy_ini_scr();
if gamemaker_version == 800 { sf_ini_scr(); }
fmod_load_scr();
fmod_ini_scr(100,false); // 100 is max sounds, second argument is web sounds
fmod_listen_set_num_scr(1);
fmod_set_world_scale_scr(pixel_meter_rate_const);
// Assets
file_to_spr_scr(main_directory_const+"\SPR\MAIN\select_spr.png","select_spr",false,false,false);
file_to_bg_scr(main_directory_const+"\BG\MAIN\settings_bg.png","settings_bg",false,false,false);
file_to_snd_scr(main_directory_const+"\SND\MAIN\confirm_snd.wav","confirm_snd",false,snd_group_sfx_const,false);
file_to_snd_scr(main_directory_const+"\SND\MAIN\deny_snd.wav","deny_snd",false,snd_group_sfx_const,false);
file_to_snd_scr(main_directory_const+"\SND\MAIN\select_snd.wav","select_snd",false,snd_group_sfx_const,false);
file_to_snd_scr(main_directory_const+"\SND\MAIN\result_mus_snd.ogg","result_mus_snd",false,snd_group_sfx_const,false);
file_to_obj_scr(main_directory_const+"\OBJ\par_obj.gml","par_obj",false);
file_to_obj_scr(main_directory_const+"\OBJ\par_3d_obj.gml","par_3d_obj",false);
file_to_obj_scr(main_directory_const+"\OBJ\enemy_par_obj.gml","enemy_par_obj",false);
file_to_obj_scr(main_directory_const+"\OBJ\PAR\fog_par_obj.gml","fog_par_obj",false);
file_to_obj_scr(main_directory_const+"\OBJ\PAR\mon_par_obj.gml","mon_par_obj",false);
file_to_obj_scr(main_directory_const+"\OBJ\MAIN\control_obj.gml","control_obj",false);
file_to_obj_scr(main_directory_const+"\OBJ\MAIN\pause_menu_obj.gml","pause_menu_obj",false);
file_to_obj_scr(main_directory_const+"\OBJ\MOD\mod_obj.gml","mod_obj",false);
file_to_rm_scr(main_directory_const+"\RM\MOD\mod_rm.gml","mod_rm",false);
execute_file(main_directory_const+"\SCR\LOAD\mod_load_01_scr.gml");
/*
Load settings bg, menu sounds, jazzy solstice, mod room, mod object, and control object
execute_file(main_directory_const+"\SCR\LOAD\spr_load_scr.gml");
execute_file(main_directory_const+"\SCR\LOAD\bg_load_scr.gml");
execute_file(main_directory_const+"\SCR\LOAD\snd_load_scr.gml");
execute_file(main_directory_const+"\SCR\LOAD\mdl_load_scr.gml");
execute_file(main_directory_const+"\SCR\LOAD\coll_load_scr.gml");
execute_file(main_directory_const+"\SCR\LOAD\part_load_scr.gml");
execute_file(main_directory_const+"\SCR\LOAD\obj_load_scr.gml");
execute_file(main_directory_const+"\SCR\LOAD\rm_load_scr.gml");
*/
if gamemaker_version == 800 { shader_load_scr(); }
// Settings
execute_file(main_directory_const+"\SCR\LOAD\menu_load_02_scr.gml");
// Load Settings
execute_file(main_directory_const+"\SCR\LOAD\set_load_scr.gml");
// In case mods load more controls
for (local.i=0; local.i<global.input_len_var; local.i+=1)
{
    for (local.j=0; local.j<8; local.j+=1;)
    {
        global.input_arr[local.i,local.j] = false;
        global.input_prev_arr[local.i,local.j] = 0;
        global.input_press_arr[local.i,local.j] = 0;
    }
}
// Stop drawing text
draw_set_halign(fa_left); draw_set_valign(fa_top);
// Load
global.player_len_var = 1;
instance_create(0,0,control_obj);
rm_goto_menu_scr(mod_rm);