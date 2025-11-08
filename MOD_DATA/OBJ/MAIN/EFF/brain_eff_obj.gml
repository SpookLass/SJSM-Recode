// Builtin Variables
object_set_depth(argument0,-99);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Room Start
object_event_add
(argument0,ev_other,ev_room_start,'
    visible = false;
    event_inherited();
    set_alarm_scr(1,irandom_range(str_alarm_min_var,str_alarm_max_var));
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
        d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
        d3d_set_hidden(false);
        draw_set_color(image_blend); draw_set_alpha(image_alpha);
        draw_rectangle(0,0,view_wview[view_current],view_hview[view_current],false);
        // Scale
        if view_wview[view_current] >= view_hview[view_current]
        { local.scale = view_hview[view_current]/720; }
        else { local.scale = view_wview[view_current]/1280; }
        local.scale = max(local.scale,scale_min_var);
        // Text
        draw_set_color(str_color_var); draw_set_halign(fa_center); draw_set_valign(fa_middle);
        draw_text_transformed(view_wview[view_current]/2,view_hview[view_current]/2,str_draw_var,local.scale,local.scale,0);
        draw_set_halign(fa_left); draw_set_valign(fa_top); draw_set_color(c_white); draw_set_alpha(1);
        d3d_set_hidden(true);
    }
');
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
    str_wake_var = "What are you hoping to accomplish?"
    str_len_var = 9;
    str_arr_var[0,0] = "1235."
    str_arr_var[0,1] = "Give in."
    str_arr_var[0,2] = "Worthless."
    str_arr_var[0,3] = "You won'+"'"+'t get far" // Breaks the editor lol
    str_arr_var[0,4] = "Failure."
    str_arr_var[0,5] = "Stop wasting time."
    str_arr_var[0,6] = "Disappointment."
    str_arr_var[0,7] = "You'+"'"+'re pathetic."
    str_arr_var[0,8] = "Weak."
    str_var = str_wake_var;
    alarm_len_var = 2;
    set_alarm_scr(0,anim_alarm_var);
    set_alarm_scr(1,char_alarm_var);
    char_var = 1;
    str_draw_var = string_copy(str_var, 0, char_var);
    str_color_var = c_white;
    image_blend = c_black;
    scale_min_var = 0.25;
');