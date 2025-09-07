// Builtin Variables
object_set_depth(argument0,-99); // Under hud
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,"
    //Defaults
    alarm_var = 250;
    spr_var = static_01_spr;
    spr_spd_var = 0.25;
    y_spd_var = 0.5;
    alpha_02_var = 0.4;
    alpha_03_var = 0.2;
    color_02_var = c_black;
    // Alarm
    alarm_len_var = 1;
    alarm_arr[0,2] = '';
    set_alarm_scr(0,250);
");
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,"
    event_inherited();
    if !instance_exists(ringu_real_obj)
    { instance_destroy(); } // Failsafe
    set_alarm_scr(0,250);
    image_alpha = 0;
");
// Alarm 0 Event
object_event_add
(argument0,ev_alarm,0,"
    with (ringu_real_obj)
    { event_perform(ev_other,ev_user14); }
    set_alarm_scr(0,250);
");
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,"
    event_inherited();
    y = (y+(y_spd_var*global.delta_time_var)) mod sprite_get_height(spr_var);
    spr_id_var = (spr_id_var+(spr_spd_var*global.delta_time_var)) mod sprite_get_number(spr_var);
    local.per = 1-(alarm_arr[0,0]/alarm_arr[0,1]);
    image_alpha = 1.25*local.per;
");
// Draw Event
object_event_add
(argument0,ev_draw,0,"
    d3d_set_projection_ortho
    (
        view_xview[view_current],
        view_yview[view_current],
        view_xview[view_current]+view_wview[view_current],
        view_yview[view_current]+view_hview[view_current],
        0
    );
    d3d_set_hidden(false);
    draw_set_color(color_02_var); draw_set_alpha(image_alpha);
    draw_rectangle
    (
        view_xview[view_current],
        view_yview[view_current],
        view_xview[view_current]+view_wview[view_current],
        view_yview[view_current]+view_hview[view_current],
        false
    );
    draw_set_alpha(random(alpha_03_var));
    draw_rectangle
    (
        view_xview[view_current],
        view_yview[view_current],
        view_xview[view_current]+view_wview[view_current],
        view_yview[view_current]+view_hview[view_current],
        false
    );
    draw_set_color(image_blend); draw_set_alpha(alpha_02_var);
    draw_sprite_tiled(spr_var,spr_id_var,0,y);
    draw_set_color(c_white); draw_set_alpha(1);
    d3d_set_hidden(true);
");