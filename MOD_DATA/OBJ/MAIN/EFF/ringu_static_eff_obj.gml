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
    //Defaults
    alarm_var = 250; // 420 for HD
    spr_var = static_01_spr;
    spr_spd_var = 0.25;
    y_spd_var = 0.5;
    alpha_02_var = 0.4;
    alpha_03_var = 0.2;
    color_02_var = c_black;
    // HD-ify
    fog_var = true;
    fog_color_var = c_dkgray;
    fog_dark_var = false;
    fog_max_start_var = 128; // 186.r6
    fog_max_end_var = 256; // 373.r3
    // Alarm
    alarm_len_var = 1;
    // Set
    set_alarm_scr(0,alarm_var);
    image_alpha = 0;
    // Fog
    if fog_var
    {
        fog_start_var = fog_max_start_var;
        fog_end_var = fog_max_end_var;
        event_perform(ev_other,ev_user0);
        depth = 99;
    }
    event_inherited();
    // Room start
    event_perform(ev_other,ev_room_start);
');
// Room End Event
object_event_add
(argument0,ev_other,ev_room_end,'
    if !per_var { event_inherited(); }
');
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,'
    if !per_var
    {
        set_alarm_scr(0,alarm_var);
        image_alpha = 0;
        // Fog
        if fog_var
        {
            fog_start_var = fog_max_start_var;
            fog_end_var = fog_max_end_var;
            event_perform(ev_other,ev_user0);
        }
    }
    if alarm_arr[0,0] <= 0
    { set_alarm_scr(0,alarm_var); }
');
// Set fog
object_event_add
(argument0,ev_other,ev_user0,'
    global.fog_var = fog_var;
    global.fog_color_var = fog_color_var;
    global.fog_start_var = fog_start_var;
    global.fog_end_var = fog_end_var;
    global.fog_dark_var = fog_dark_var;
    background_color = global.fog_color_var;
    d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var);
');
// Alarm 0 Event
object_event_add
(argument0,ev_alarm,0,'
    fmod_snd_play_scr(snd_var);
    with (real_ringu_obj)
    { event_user(15); }
    set_alarm_scr(0,alarm_var);
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    y = (y+(y_spd_var*global.delta_time_var)) mod sprite_get_height(spr_var);
    spr_id_var = (spr_id_var+(spr_spd_var*global.delta_time_var)) mod sprite_get_number(spr_var);
    local.per = alarm_arr[0,0]/alarm_arr[0,1];
    if fog_var 
    {
        fog_start_var = fog_max_start_var*local.per;
        fog_end_var = fog_max_end_var*local.per;
        event_user(0);
    }
    else { image_alpha = 1.25*(1-local.per); }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if global.cam_type_var[view_current] == cam_alive_const
    {
        if fog_var
        {
            d3d_set_fog(false,c_black,0,0);
            d3d_transform_set_identity();
            d3d_transform_set_translation(global.cam_x_var[view_current],global.cam_y_var[view_current],global.cam_z_var[view_current]);
            d3d_draw_ellipsoid(-fog_end_var,-fog_end_var,-fog_end_var,fog_end_var,fog_end_var,fog_end_var,sprite_get_texture(spr_var,spr_id_var),2,2,10);
            d3d_transform_set_identity();
            global.fog_var = true;
            event_inherited();
            break;
        }
        else
        {
            if view_wview[view_current] >= view_hview[view_current]
            { local.scale = view_hview[view_current]/720; }
            else { local.scale = view_wview[view_current]/1280; }
            d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
            d3d_set_hidden(false);
            draw_set_color(color_02_var); draw_set_alpha(image_alpha);
            draw_rectangle(0,0,view_wview[view_current],view_hview[view_current],false);
            draw_set_alpha(random(alpha_03_var));
            draw_rectangle(0,0,view_wview[view_current],view_hview[view_current],false);
            draw_set_color(c_white); draw_set_alpha(1);
            draw_sprite_tiled_ext(spr_var,spr_id_var,0,y,local.scale,local.scale,image_blend,image_alpha);
            d3d_set_hidden(true);
        }
    }
    else { global.fog_var = false; }
    if fog_var { d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var); }
');