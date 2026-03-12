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
    par_var = noone;
    //Defaults
    ini_open(global.lang_var)
    str_var = ini_read_string("UI","interact","UI_interact");
    ini_close();
    min_scale_var = 0.125;
    x = 0;
    y = -72;
    halign_var = fa_center;
    valign_var = fa_bottom;
    cam_id_var = 0;
    fade_var = false;
    sep_var = -1;
    margin_var = 108;
    // Shadow
    shadow_x_var = -4;
    shadow_y_var = 4;
    shadow_var = 2;
    shadow_color_var = make_color_rgb(30,0,50);
    // Alarm
    alarm_len_var = 1;
    alarm_ini_scr();
    set_alarm_scr(0,120);
');
// Alarm 0 Event
object_event_add
(argument0,ev_alarm,0,'
    instance_destroy();
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if fade_var && alarm_arr[0,0] > 0
    { image_alpha = alarm_arr[0,0]/alarm_arr[0,1]; }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if view_current == cam_id_var || cam_id_var == -1
    {
        d3d_set_fog(false,c_black,0,0);
        d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
        d3d_set_hidden(false); draw_set_alpha(image_alpha);
        draw_set_halign(halign_var); draw_set_valign(valign_var);
        draw_str_ext_shadow_scr(str_var,x,y,image_xscale,image_yscale,min_scale_var,halign_var,valign_var,sep_var,margin_var,shadow_x_var,shadow_y_var,shadow_color_var,image_blend,shadow_var,image_angle);
        draw_set_halign(fa_left); draw_set_valign(fa_top);
        draw_set_alpha(1); d3d_set_hidden(true);
    }
');