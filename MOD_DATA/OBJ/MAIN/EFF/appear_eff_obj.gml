// Builtin Variables
object_set_depth(argument0,-5);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_3d_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    tex_var = white_bg_tex;
    step_var = 8;
    smooth_var = true;
    scale_len_var = 2;
    scale_arr_var[1] = 25;
    scale_arr_var[0] = 15;
    alarm_var = 30;
    alarm_len_var = 1;
    alarm_ini_scr();
    set_alarm_scr(0,alarm_var);
    scale_var = scale_arr_var[scale_len_var-1];
');
// Alarm
object_event_add
(argument0,ev_alarm,0,'
    instance_destroy();
');
// Step
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    if smooth_var
    { scale_var = scale_arr_var[scale_len_var-1]*alarm_arr[0,0]/alarm_arr[0,1]; }
    else { scale_var = scale_arr_var[median(scale_len_var-1,0,floor(scale_len_var*alarm_arr[0,0]/alarm_arr[0,1]))]; }
');
// Draw
object_event_add
(argument0,ev_draw,0,'
    d3d_set_fog(false,c_black,0,0);
    d3d_transform_set_identity();
    d3d_transform_add_translation(x,y,z);
    draw_set_color(image_blend); draw_set_alpha(image_alpha);
    d3d_draw_ellipsoid(-scale_var,-scale_var,-scale_var,scale_var,scale_var,scale_var,tex_var,1,1,step_var);
    d3d_transform_set_identity();
    draw_set_color(c_white); draw_set_alpha(1);
    d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var);
');