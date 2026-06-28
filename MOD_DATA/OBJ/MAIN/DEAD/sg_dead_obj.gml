// Builtin Variables
object_set_depth(argument0,-99);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
/*
Static Rendered at 4x scale
Black bar is 360 pixels, centered
Text is about 60 pixels tall
*/
// Create Event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    true_time_var = true;
    // Translate
    str_len_var = 12;
    ini_open("lang_"+global.lang_var+".ini");
    for (local.i=0; local.i<str_len_var; local.i+=1;)
    {
        local.num = string(local.i+1);
        if string_length(local.num) < 2 { local.num = "0"+local.num; }
        str_var[local.i] = ini_read_string("DEAD","sg_"+local.num,"DEAD_sg_"+local.num);
    }
    ini_close();
    // Create Text
    char_alarm_var = 4;
    char_delay_min_var = 15;
    char_delay_max_var = 30;
    scale_var = 1;
    scale_min_var = 0.125;
    image_blend = c_black;
    with instance_create(54,54,sg_dead_str_obj)
    {
        str_var = other.str_var[0];
        char_alarm_var = other.char_alarm_var;
        char_delay_min_var = other.char_delay_min_var;
        char_delay_max_var = other.char_delay_max_var;
        scale_var = other.scale_var;
        scale_min_var = other.scale_min_var;
        image_blend = other.image_blend;
        par_var = other.id;
        set_alarm_scr(0,char_alarm_var);
    }
    // Sound
    fmod_snd_play_scr(load_par_obj.snd_arr_var[0,0]);
    // Effect variables
    fog_end_var = 96;
    fog_color_var = c_black;
	wall_num_var = 6;
	wall_alpha_var = 0.15;
	wall_start_var = 24;
	wall_end_var = 64;
	wall_color_var = make_color_rgb(98,57,57);
    // Behavior
    if global.sg_type_var == -1 { local.type = irandom(3); }
    else { local.type = global.sg_type_var; }
    switch local.type
    {
        case 0:
        {
            fog_end_var = 128;
            // fog_color_var = wall_color_var;
            break;
        }
    }
    // Effects
    with instance_create(0,0,fog_par_obj)
    {
        prio_var = 2;
        par_var = other.id;
        fog_var = true;
        fog_color_var = other.fog_color_var;
        fog_start_var = 0;
        fog_end_var = other.fog_end_var;
        fog_dark_var = true;
        event_user(0);
    }
    with instance_create(0,0,kh_fog_obj)
    {
        prio_var = 2;
        par_var = other.id;
        fog_type_var = 0;
        image_blend = other.wall_color_var;
        image_alpha = other.wall_alpha_var;
        wall_num_var = other.wall_num_var;
        wall_start_var = other.wall_start_var;
        wall_end_var = other.wall_end_var;
        event_user(0);
    }
    with instance_create(0,0,kh_overlay_obj)
    {
        par_var = other.id;
        overlay_bg_var = load_par_obj.bg_arr_var[3,0];
        overlay_var = true;
        overlay_alpha_var = 0.5;
        spr_spd_var = 0.1;
        image_alpha = 0.025;
    }
    // Camera
    with instance_create(424,192,cam_dead_obj)
    {
        h_var = 11.25;
        control_var = 0;
        breath_mult_var = 0;
        pitch_var = 33.3;
        fov_var = 50;
    }
    // Alarm
    alarm_len_var = 1;
    alarm_ini_scr();
    set_alarm_scr(0,720);
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
    with load_par_obj { instance_destroy(); }
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    if global.input_press_arr[confirm_input_const,global.menu_player_var] == 1
    || global.input_press_arr[back_input_const,global.menu_player_var] == 1
    || global.input_press_arr[pause_input_const,global.menu_player_var] == 1
    { rm_goto_menu_scr(dead_rm,true); }
    local.per = median(0,1,power(1-(alarm_arr[0,0]/alarm_arr[0,1]),2));
    image_alpha = local.per;
    with cam_dead_obj { fov_var = lerp_scr(50,30,local.per); }
');
// String Alarm Var
object_event_add
(argument0,ev_alarm,0,'
    rm_goto_menu_scr(dead_rm,true);
');
// Draw
object_event_add
(argument0,ev_draw,0,'
    d3d_set_fog(false,c_black,0,0);
    d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
    d3d_set_hidden(false);
    // Background
    draw_set_color(image_blend); draw_set_alpha(image_alpha);
    draw_rectangle(0,0,view_wview[view_current],view_hview[view_current],false);
    draw_set_color(c_white); draw_set_alpha(1);
    // Reset
    d3d_set_hidden(true);
');