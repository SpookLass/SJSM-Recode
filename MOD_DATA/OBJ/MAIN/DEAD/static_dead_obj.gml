// Builtin Variables
object_set_depth(argument0,-99);
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
    spr_var = static_01_spr;
    spr_spd_var = 0.25;
    image_alpha = 0.4;
    stretch_type_var = 0;
    image_xscale = 128;
    // Alarm
    scale_chance_var = 2;
    scale_min_var = 128;
    scale_max_var = 768;
    image_yscale = random_range(scale_min_var,scale_max_var);
    alarm_len_var = 1;
    alarm_ini_scr();
    alarm_var = 30;
    set_alarm_scr(0,alarm_var);
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    spr_id_var = (spr_id_var+(spr_spd_var*global.delta_time_var)) mod sprite_get_number(spr_var);
');
// Alarm 0 Event
object_event_add
(argument0,ev_alarm,0,'
    if frac_chance_scr(1,scale_chance_var)
    { image_yscale = random_range(scale_min_var,scale_max_var); }
    set_alarm_scr(0,alarm_var);
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    d3d_set_fog(false,c_black,0,0);
    d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
    d3d_set_hidden(false);
    draw_spr_tiled_scale_ext_scr(spr_var,spr_id_var,x,y,image_xscale,image_yscale,2,image_angle,image_blend,image_alpha);
    d3d_set_hidden(true);
');