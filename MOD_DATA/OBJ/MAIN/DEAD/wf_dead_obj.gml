// Builtin Variables
object_set_depth(argument0,-100);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    // Load
    spr_var = sprite_add(main_directory_const+"\SPR\DEAD\killer_static_02_spr.png",6,false,false,0,0);
    bg_var = background_add(vanilla_directory_const+"\TEX\sprites\MS28_07_spr.png",false,false);
    snd_var = fmod_snd_add_scr(main_directory_const+"\SND\DEAD\wf_scream_snd.wav",false);
    load_var = true;
    // Sound
    inst_var = fmod_snd_play_scr(snd_var);
    //Defaults
    spr_spd_var = 0.5;
    spr_id_var = 0;
    image_alpha = 0.5;
    image_xscale = 256;
    image_yscale = 256;
    // Alarms
    alarm_len_var = 2;
    alarm_ini_scr();
    set_alarm_scr(0,45);
');
// Destroy
object_event_add
(argument0,ev_destroy,0,'
    event_user(0);
');
// Room end event
object_event_add
(argument0,ev_other,ev_room_end,'
    event_user(0);
');
// Delete background
object_event_add
(argument0,ev_other,ev_user0,'
    global.res_override_var = false;
    global.res_override_w_var = global.res_w_var;
    global.res_override_h_var = global.res_h_var;
    if load_var
    {
        fmod_snd_free_scr(snd_var);
        sprite_delete(spr_var);
        background_delete(bg_var);
        load_var = false;
    }
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    spr_id_var = (spr_id_var+(spr_spd_var*global.delta_time_var)) mod sprite_get_number(spr_var);
    if global.input_press_arr[confirm_input_const,global.menu_player_var] == 1
    || global.input_press_arr[back_input_const,global.menu_player_var] == 1
    { event_perform(ev_alarm,1); }
');
// Alarm 0 Event
object_event_add
(argument0,ev_alarm,0,'
    fmod_inst_stop_scr(inst_var);
    visible = false;
    set_alarm_scr(1,70);
');
// Alarm 1 Event
object_event_add
(argument0,ev_alarm,1,'
    with global.player_arr[global.menu_player_var] { dead_var = false; do_coll_var = true; }
    instance_create(0,0,wf_02_obj);
    rm_leave_menu_scr(wf_hall_10_rm);
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    d3d_set_fog(false,c_black,0,0);
    d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
    d3d_set_hidden(false);
    draw_spr_tiled_stretch_ext_scr(spr_var,floor(spr_id_var),0,0,image_xscale,0,2,image_angle,image_blend,image_alpha);
    draw_bg_fit_scr(bg_var,0,0);
    d3d_set_hidden(true);
');