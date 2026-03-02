// Builtin Variables
object_set_depth(argument0,-99);
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
    cam_id_var = -1;
    anim_alarm_var = 1;
    char_alarm_var = 6;
    char_delay_var = 30;
    str_alarm_min_var = 240;
    str_alarm_max_var = 460;
    ini_open(global.lang_var);
    str_wake_var = ini_read_string("MON","brain_wake","MON_brain_wake");
    str_len_var = 9;
    for (local.i=0; local.i<str_len_var; local.i+=1;)
    {
        local.num = string(local.i+1);
        if string_length(local.num) < 2 { local.num = "0"+local.num; }
        local.str = "brain_"+local.num;
        str_arr_var[0,local.i] = ini_read_string("MON",local.str,"MON_"+local.str);
    }
    ini_close();
    str_var = str_wake_var;
    alarm_len_var = 2;
    alarm_ini_scr();
    set_alarm_scr(0,anim_alarm_var);
    set_alarm_scr(1,char_alarm_var);
    char_var = 1;
    str_draw_var = string_copy(str_var, 0, char_var);
    str_color_var = c_white;
    image_blend = c_black;
    scale_min_var = 0.25;
');
// Room Start
object_event_add
(argument0,ev_other,ev_room_start,'
    visible = false;
    event_inherited();
    set_alarm_scr(1,irandom_range(str_alarm_min_var,str_alarm_max_var));
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if visible && do_mult_var // && instance_number(mon_par_obj) < 2
    {
        with (player_obj)
        {
            if spd_mult_var > other.target_spd_mult_var
            { spd_mult_var *= other.target_spd_mult_var; }
        }
    }
    event_inherited();
');
// Anim
object_event_add
(argument0,ev_alarm,0,'
    image_alpha = random_range(0.3,1);
    set_alarm_scr(0,anim_alarm_var);
');
// String
object_event_add
(argument0,ev_alarm,1,'
    if !visible
    {
        str_var = str_arr_var[0,irandom(str_len_var-1)];
        set_alarm_scr(0,anim_alarm_var);
        set_alarm_scr(1,char_alarm_var);
        char_var = 1;
        str_draw_var = string_copy(str_var, 0, char_var);
        visible = true;
    }
    else
    {
        if char_var < string_length(str_var)
        {
            char_var += 1;
            str_draw_var = string_copy(str_var, 0, char_var);
            if char_var >= string_length(str_var) { set_alarm_scr(1,char_delay_var); }
            else { set_alarm_scr(1,char_alarm_var); }
        }
        else
        {
            set_alarm_scr(0,-1);
            set_alarm_scr(1,irandom_range(str_alarm_min_var,str_alarm_max_var));
            char_var = string_length(str_var);
            str_draw_var = string_copy(str_var, 0, char_var);
            visible = false;
        }
    }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if view_current == cam_id_var || cam_id_var == -1
    {
        d3d_set_fog(false,c_black,0,0);
        d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
        d3d_set_hidden(false);
        draw_set_color(image_blend); draw_set_alpha(image_alpha);
        draw_rectangle(0,0,view_wview[view_current],view_hview[view_current],false);
        // Text
        draw_set_color(str_color_var); draw_set_halign(fa_center); draw_set_valign(fa_middle);
        draw_str_ext_scr(str_draw_var,0,0,1,1,scale_min_var,fa_center,fa_middle,-1,108,0);
        draw_set_halign(fa_left); draw_set_valign(fa_top); draw_set_color(c_white); draw_set_alpha(1);
        d3d_set_hidden(true);
    }
');