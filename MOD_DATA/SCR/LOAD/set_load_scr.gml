ini_open("settings.ini");
global.fov_var = ini_read_real("MAIN","fov",fov_const);
global.fps_var = ini_read_real("MAIN","fps",fps_const);
global.fps_update_var = ini_read_real("MAIN","fps_update",fps_update_const);
global.tps_var = ini_read_real("MAIN","tps",tps_const);
global.vol_var = ini_read_real("MAIN","vol",vol_const);
global.mus_vol_var = ini_read_real("MAIN","mus_vol",mus_vol_const);
global.mon_vol_var = ini_read_real("MAIN","mon_vol",mon_vol_const);
global.sfx_vol_var = ini_read_real("MAIN","sfx_vol",sfx_vol_const);
global.voice_vol_var = ini_read_real("MAIN","voice_vol",voice_vol_const);
global.reduce_flash_var = ini_read_real("MAIN","reduce_flash",reduce_flash_const);
global.max_part_var = ini_read_real("MAIN","max_part",max_part_const);
global.crouch_toggle_var = ini_read_real("MAIN","crouch_toggle",crouch_toggle_const);
global.sub_var = ini_read_real("MAIN","sub",sub_const);
global.anti_alias_var = ini_read_real("MAIN","anti_alias",anti_alias_const);
global.vsync_var = ini_read_real("MAIN","vsync",vsync_const);
global.fullscreen_var = ini_read_real("MAIN","fullscreen",fullscreen_const);
global.color_var = ini_read_real("MAIN","color",color_const);
global.coll_prec_var = ini_read_real("MAIN","coll_prec",coll_prec_const);
global.move_bob_var = ini_read_real("MAIN","move_bob",move_bob_const);
global.idle_bob_var = ini_read_real("MAIN","idle_bob",idle_bob_const);
global.shake_type_var = ini_read_real("MAIN","shake_type",shake_modern_const);
global.mem_save_var = ini_read_real("MAIN","mem_save",mem_save_const);
global.res_w_var = ini_read_real("MAIN","res_w",res_w_const);
global.res_h_var = ini_read_real("MAIN","res_h",res_h_const);
global.name_var = ini_read_real("MAIN","name",name_hd_const);
global.lang_var = ini_read_string("MAIN","lang","en_us.ini");
global.killer_voice_var = ini_read_real("MAIN","killer_voice",killer_voice_const);
global.reset_spd_var = ini_read_real("MAIN","reset_spd",reset_spd_const);
// Hud
global.mon_hud_var = ini_read_real("MAIN","mon_hud",mon_hud_const);
global.rm_hud_var = ini_read_real("MAIN","rm_hud",rm_hud_const);
global.bar_hud_var = ini_read_real("MAIN","bar_hud",bar_hud_const);
global.tps_hud_var = ini_read_real("MAIN","tps_hud",tps_hud_const);
// Controls
global.input_len_var = 24;
for (local.i=0; local.i<4; local.i+=1;)
{
    global.sens_var[local.i] = ini_read_real("CONTROL","sens_"+string(local.i),sens_const);
    global.invert_yaw_var[local.i] = ini_read_real("CONTROL","invert_yaw_"+string(local.i),invert_yaw_const);
    global.invert_pitch_var[local.i] = ini_read_real("CONTROL","invert_pitch_"+string(local.i),invert_pitch_const);
    global.input_cam_var[local.i] = ini_read_real("CONTROL","cam_"+string(local.i),cond_scr(local.i==0,cam_const,cam_joy_r_const)); // Mouse, Joystick (R and L), Button, and D-Pad
    global.input_move_var[local.i] = ini_read_real("CONTROL","move_"+string(local.i),cond_scr(local.i==0,move_const,move_joy_l_const)); // Button, Joystick (L and R), and D-Pad
    global.input_menu_var[local.i] = ini_read_real("CONTROL","menu_"+string(local.i),cond_scr(local.i==0,menu_const,menu_dpad_const)); // Button / Mouse, D-Pad, and Joystick (L and R)
    global.input_key_arr[up_input_const,local.i] = ini_read_real("CONTROL","up_key_"+string(local.i),cond_scr(local.i==0,up_key_const,up_button_const)); // 87
    global.input_key_arr[down_input_const,local.i] = ini_read_real("CONTROL","down_key_"+string(local.i),cond_scr(local.i==0,down_key_const,down_button_const)); // 83
    global.input_key_arr[left_input_const,local.i] = ini_read_real("CONTROL","left_key_"+string(local.i),cond_scr(local.i==0,left_key_const,left_button_const)); // 65
    global.input_key_arr[right_input_const,local.i] = ini_read_real("CONTROL","right_key_"+string(local.i),cond_scr(local.i==0,right_key_const,right_button_const)); // 68
    global.input_key_arr[confirm_input_const,local.i] = ini_read_real("CONTROL","confirm_key_"+string(local.i),cond_scr(local.i==0,confirm_key_const,confirm_button_const)); // 69, nice
    global.input_key_arr[back_input_const,local.i] = ini_read_real("CONTROL","back_key_"+string(local.i),cond_scr(local.i==0,back_key_const,back_button_const)); // 27
    global.input_key_arr[forward_input_const,local.i] = ini_read_real("CONTROL","forward_key_"+string(local.i),cond_scr(local.i==0,forward_key_const,forward_button_const)); // 87
    global.input_key_arr[backward_input_const,local.i] = ini_read_real("CONTROL","backward_key_"+string(local.i),cond_scr(local.i==0,backward_key_const,backward_button_const)); // 83
    global.input_key_arr[strafe_left_input_const,local.i] = ini_read_real("CONTROL","strafe_left_key_"+string(local.i),cond_scr(local.i==0,strafe_left_key_const,strafe_left_button_const)); // 65
    global.input_key_arr[strafe_right_input_const,local.i] = ini_read_real("CONTROL","strafe_right_key_"+string(local.i),cond_scr(local.i==0,strafe_right_key_const,strafe_right_button_const)); // 68
    global.input_key_arr[interact_input_const,local.i] = ini_read_real("CONTROL","interact_key_"+string(local.i),cond_scr(local.i==0,interact_key_const,interact_button_const)); // 69
    global.input_key_arr[sprint_input_const,local.i] = ini_read_real("CONTROL","sprint_key_"+string(local.i),cond_scr(local.i==0,sprint_key_const,sprint_button_const)); // 16
    global.input_key_arr[jump_input_const,local.i] = ini_read_real("CONTROL","jump_key_"+string(local.i),cond_scr(local.i==0,jump_key_const,jump_button_const)); // 32
    global.input_key_arr[crouch_input_const,local.i] = ini_read_real("CONTROL","crouch_key_"+string(local.i),cond_scr(local.i==0,crouch_key_const,crouch_button_const)); // 17
    global.input_key_arr[attack_input_const,local.i] = ini_read_real("CONTROL","attack_key_"+string(local.i),cond_scr(local.i==0,attack_key_const,attack_button_const)); // -1 I think
    global.input_key_arr[pause_input_const,local.i] = ini_read_real("CONTROL","pause_key_"+string(local.i),cond_scr(local.i==0,pause_key_const,pause_button_const)); // 27
    global.input_key_arr[debug_input_const,local.i] = ini_read_real("CONTROL","debug_key_"+string(local.i),cond_scr(local.i==0,debug_key_const,debug_button_const)); // 45
    global.input_key_arr[turnaround_input_const,local.i] = ini_read_real("CONTROL","turnaround_key_"+string(local.i),cond_scr(local.i==0,turnaround_key_const,turnaround_button_const)); // 81
    global.input_key_arr[ff_input_const,local.i] = ini_read_real("CONTROL","ff_key_"+string(local.i),cond_scr(local.i==0,ff_key_const,ff_button_const)); // 70, 190, or 71
    global.input_key_arr[slow_input_const,local.i] = ini_read_real("CONTROL","slow_key_"+string(local.i),cond_scr(local.i==0,slow_key_const,slow_button_const)); // 82, 188, or 70
    global.input_key_arr[cam_up_input_const,local.i] = ini_read_real("CONTROL","cam_up_key_"+string(local.i),cond_scr(local.i==0,cam_up_key_const,cam_up_button_const)); // 38
    global.input_key_arr[cam_down_input_const,local.i] = ini_read_real("CONTROL","cam_down_key_"+string(local.i),cond_scr(local.i==0,cam_down_key_const,cam_down_button_const)); // 40
    global.input_key_arr[cam_left_input_const,local.i] = ini_read_real("CONTROL","cam_left_key_"+string(local.i),cond_scr(local.i==0,cam_left_key_const,cam_left_button_const)); // 37
    global.input_key_arr[cam_right_input_const,local.i] = ini_read_real("CONTROL","cam_right_key_"+string(local.i),cond_scr(local.i==0,cam_right_key_const,cam_right_button_const)); // 39
}
ini_close();
// Set stuff
window_set_fullscreen(global.fullscreen_var);
set_synchronization(global.vsync_var);
texture_set_interpolation(global.anti_alias_var);

global.save_list = ds_list_create();
ds_list_clear(global.save_list);

// Temporary lol
global.js_chance_var = 5;