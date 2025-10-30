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
global.up_key_var = ini_read_real("CONTROL","up_key",87);
global.down_key_var = ini_read_real("CONTROL","down_key",83);
global.left_key_var = ini_read_real("CONTROL","left_key",65);
global.right_key_var = ini_read_real("CONTROL","right_key",68);
global.confirm_key_var = ini_read_real("CONTROL","confirm_key",69);
global.back_key_var = ini_read_real("CONTROL","back_key",27);
global.forward_key_var = ini_read_real("CONTROL","forward_key",87);
global.backward_key_var = ini_read_real("CONTROL","backward_key",83);
global.strafe_left_key_var = ini_read_real("CONTROL","strafe_left_key",65);
global.strafe_right_key_var = ini_read_real("CONTROL","strafe_right_key",68);
global.interact_key_var = ini_read_real("CONTROL","interact_key",69);
global.sprint_key_var = ini_read_real("CONTROL","sprint_key",16);
global.jump_key_var = ini_read_real("CONTROL","jump_key",32);
global.crouch_key_var = ini_read_real("CONTROL","crouch_key",17);
global.attack_key_var = ini_read_real("CONTROL","attack_key",17);
global.pause_key_var = ini_read_real("CONTROL","pause_key",27);
global.debug_key_var = ini_read_real("CONTROL","debug_key",45);
global.turnaround_key_var = ini_read_real("CONTROL","turnaround_key",81);
global.ff_key_var = ini_read_real("CONTROL","ff_key",70); // 190 or 71
global.slow_key_var = ini_read_real("CONTROL","slow_key",82); // 188 or 70
ini_close();
// Set stuff
window_set_fullscreen(global.fullscreen_var);
set_synchronization(global.vsync_var);
texture_set_interpolation(global.anti_alias_var);

global.save_list = ds_list_create();
ds_list_clear(global.save_list);