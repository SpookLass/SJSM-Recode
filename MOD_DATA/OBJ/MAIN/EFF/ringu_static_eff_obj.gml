// Builtin Variables
object_set_depth(argument0,-99); // Under hud
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    // Static
    spr_var = static_01_spr;
    spr_id_var = 0;
    spr_spd_var = 0.25;
    y_spd_var = 0.5;
    alpha_02_var = 0.4;
    alpha_03_max_var = 0.2;
    alpha_03_var = random(alpha_03_max_var);
    color_02_var = c_black;
    image_xscale = 128;
    image_yscale = 128;
    image_alpha = 0;
    // Alarm
    alarm_var = 250; // 420 for HD
    alarm_len_var = 2;
    alarm_ini_scr();
    alarm_arr[0,2] = false;
    set_alarm_scr(0,alarm_var);
    set_alarm_scr(1,1);
');
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,'
    if !alarm_arr[0,2]
    {
        set_alarm_scr(0,alarm_var);
        image_alpha = 0;
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
// Alarm 1 Event
object_event_add
(argument0,ev_alarm,1,'
    alpha_03_var = random(alpha_03_max_var);
    set_alarm_scr(1,1);
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    y = y+(y_spd_var*global.delta_time_var);
    spr_id_var = (spr_id_var+(spr_spd_var*global.delta_time_var)) mod sprite_get_number(spr_var);
    local.per = alarm_arr[0,0]/alarm_arr[0,1];
    image_alpha = 1.25*(1-local.per);
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if global.cam_type_var[view_current] == cam_alive_const
    {
        d3d_set_fog(false,c_black,0,0);
        d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
        d3d_set_hidden(false);
        draw_set_color(color_02_var); draw_set_alpha(image_alpha);
        draw_rectangle(0,0,view_wview[view_current],view_hview[view_current],false);
        draw_set_alpha(alpha_03_var);
        draw_rectangle(0,0,view_wview[view_current],view_hview[view_current],false);
        draw_set_color(c_white); draw_set_alpha(1);
        draw_spr_tiled_scale_ext_scr(spr_var,floor(spr_id_var),0,y,image_xscale,image_yscale,2,image_angle,image_blend,alpha_02_var);
        d3d_set_hidden(true);
    }
');