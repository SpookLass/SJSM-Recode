ini_open("settings.ini");
global.fov_var = ini_read_real("MAIN","fov",fov_const);
global.fps_var = ini_read_real("MAIN","fps",fps_const);
global.fps_update_var = ini_read_real("MAIN","fps_update",fps_update_const);
global.tps_var = ini_read_real("MAIN","tps",tps_const);
global.sens_var = ini_read_real("MAIN","sens",sens_const);
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
global.invert_yaw_var = ini_read_real("MAIN","invert_yaw",invert_yaw_const);
global.invert_pitch_var = ini_read_real("MAIN","invert_pitch",invert_pitch_const);
global.killer_voice_var = ini_read_real("MAIN","killer_voice",killer_voice_const);
global.reset_spd_var = ini_read_real("MAIN","reset_spd",reset_spd_const);
// Hud
global.mon_hud_var = ini_read_real("MAIN","mon_hud",mon_hud_const);
global.rm_hud_var = ini_read_real("MAIN","rm_hud",rm_hud_const);
global.bar_hud_var = ini_read_real("MAIN","bar_hud",bar_hud_const);
global.tps_hud_var = ini_read_real("MAIN","tps_hud",tps_hud_const);
// Controls
global.input_len_var = 20;
for (local.i=0; local.i<4; local.i+=1;)
{
    global.input_key_arr[up_input_const,local.i] = ini_read_real("CONTROL","up_key_"+string(local.i),up_key_const); // 87
    global.input_key_arr[down_input_const,local.i] = ini_read_real("CONTROL","down_key_"+string(local.i),down_key_const); // 83
    global.input_key_arr[left_input_const,local.i] = ini_read_real("CONTROL","left_key_"+string(local.i),left_key_const); // 65
    global.input_key_arr[right_input_const,local.i] = ini_read_real("CONTROL","right_key_"+string(local.i),right_key_const); // 68
    global.input_key_arr[confirm_input_const,local.i] = ini_read_real("CONTROL","confirm_key_"+string(local.i),confirm_key_const); // 69, nice
    global.input_key_arr[back_input_const,local.i] = ini_read_real("CONTROL","back_key_"+string(local.i),back_key_const); // 27
    global.input_key_arr[forward_input_const,local.i] = ini_read_real("CONTROL","forward_key_"+string(local.i),forward_key_const); // 87
    global.input_key_arr[backward_input_const,local.i] = ini_read_real("CONTROL","backward_key_"+string(local.i),backward_key_const); // 83
    global.input_key_arr[strafe_left_input_const,local.i] = ini_read_real("CONTROL","strafe_left_key_"+string(local.i),strafe_left_key_const); // 65
    global.input_key_arr[strafe_right_input_const,local.i] = ini_read_real("CONTROL","strafe_right_key_"+string(local.i),strafe_right_key_const); // 68
    global.input_key_arr[interact_input_const,local.i] = ini_read_real("CONTROL","interact_key_"+string(local.i),interact_key_const); // 69
    global.input_key_arr[sprint_input_const,local.i] = ini_read_real("CONTROL","sprint_key_"+string(local.i),sprint_key_const); // 16
    global.input_key_arr[jump_input_const,local.i] = ini_read_real("CONTROL","jump_key_"+string(local.i),jump_key_const); // 32
    global.input_key_arr[crouch_input_const,local.i] = ini_read_real("CONTROL","crouch_key_"+string(local.i),crouch_key_const); // 17
    global.input_key_arr[attack_input_const,local.i] = ini_read_real("CONTROL","attack_key_"+string(local.i),attack_key_const); // -1 I think
    global.input_key_arr[pause_input_const,local.i] = ini_read_real("CONTROL","pause_key_"+string(local.i),pause_key_const); // 27
    global.input_key_arr[debug_input_const,local.i] = ini_read_real("CONTROL","debug_key_"+string(local.i),debug_key_const); // 45
    global.input_key_arr[turnaround_input_const,local.i] = ini_read_real("CONTROL","turnaround_key_"+string(local.i),turnaround_key_const); // 81
    global.input_key_arr[ff_input_const,local.i] = ini_read_real("CONTROL","ff_key_"+string(local.i),ff_key_const); // 70, 190, or 71
    global.input_key_arr[slow_input_const,local.i] = ini_read_real("CONTROL","slow_key_"+string(local.i),slow_key_const); // 82, 188, or 70
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