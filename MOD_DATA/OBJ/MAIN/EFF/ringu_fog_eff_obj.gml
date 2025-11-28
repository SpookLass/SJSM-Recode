// Builtin Variables
object_set_depth(argument0,99);
object_set_mask(argument0,noone);
object_set_parent(argument0,fog_par_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    // Fog
    fog_color_var = c_dkgray;
    fog_var = true;
    fog_dark_var = false;
    fog_max_start_var =  560/3; // 186.r6
    fog_max_end_var = 1120/3; // 373.r3
    fog_start_var = fog_max_start_var;
    fog_end_var = fog_max_end_var;
    event_inherited();
    prio_var = 3;
    // Special
    alarm_var = 420;
    spr_var = static_01_spr;
    spr_spd_var = 0.25;
    alarm_len_var = 1;
    set_alarm_scr(0,alarm_var);
    alarm_arr[0,2] = false; // Persistent
');
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,'
    if !alarm_arr[0,2]
    {
        set_alarm_scr(0,alarm_var);
        // Reset
        fog_start_var = fog_max_start_var;
        fog_end_var = fog_max_end_var;
        event_user(0);
    }
    else if alarm_arr[0,0] <= 0
    { set_alarm_scr(0,alarm_var); }
');
// Alarm 0 Event
object_event_add
(argument0,ev_alarm,0,'
    fmod_snd_play_scr(snd_var);
    with real_ringu_obj
    { event_user(15); }
    set_alarm_scr(0,alarm_var);
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    spr_id_var = (spr_id_var+(spr_spd_var*global.delta_time_var)) mod sprite_get_number(spr_var);
    local.per = alarm_arr[0,0]/alarm_arr[0,1];
    fog_start_var = fog_max_start_var*local.per;
    fog_end_var = fog_max_end_var*local.per;
    event_user(0);
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if global.cam_type_var[view_current] == cam_alive_const
    {
        d3d_set_fog(false,c_black,0,0);
        d3d_transform_set_identity();
        d3d_transform_set_translation(global.cam_x_var[view_current],global.cam_y_var[view_current],global.cam_z_var[view_current]);
        d3d_draw_ellipsoid(-fog_end_var,-fog_end_var,-fog_end_var,fog_end_var,fog_end_var,fog_end_var,sprite_get_texture(spr_var,spr_id_var),2,2,10);
        d3d_transform_set_identity();
    }
    event_inherited();
');