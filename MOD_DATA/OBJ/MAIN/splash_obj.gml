// Builtin Variables
object_set_depth(argument0,100);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create
object_event_add
(argument0,ev_create,0,'
    kira_spr_var = execute_file(main_directory_const+"\SPR\UI\kira_spr.gml",main_directory_const+"\SPR\UI\kira_spr.png");
    kira_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\UI\kira_snd.wav");
    amg_vid_var = main_directory_const+"\VID\UI\amg_silent_vid.wmv";
    amg_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\UI\amg_snd.wav");
    recode_spr_var = execute_file(main_directory_const+"\SPR\UI\recode_spr.gml",main_directory_const+"\SPR\UI\recode_spr.png");
    fmod_spr_var = execute_file(main_directory_const+"\SPR\UI\fmod_spr.gml",main_directory_const+"\SPR\UI\fmod_spr.png");
    warn_bg_var = background_add(main_directory_const+"\BG\UI\warn_bg.png",false,false);
    ini_open(global.lang_var);
    warn_str_01_var = ini_read_string("MENU","warn_01","MENU_warn_01");
    warn_str_02_var = ini_read_string("MENU","warn_02","MENU_warn_02");
    warn_str_03_var = ini_read_string("MENU","warn_03","MENU_warn_03");
    ini_close();
    image_xscale = 0.01;
    image_yscale = 0.01;
    image_alpha = 0;
    shadow_off_var = 4;
    alarm_len_var = 6;
    set_alarm_scr(3,240);
    inst_var = fmod_snd_play_scr(kira_snd_var);
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    if state_var != 1
    {
        if global.input_press_arr[confirm_input_const,0] { event_user(0); }
        if global.input_press_arr[back_press_const,0] { room_goto_scr(menu_rm); }
    }
    switch state_var
    {
        case 0: // Kira
        {
            image_xscale += 0.001*global.delta_time_var;
            image_yscale += 0.001*global.delta_time_var;
            image_alpha += 0.001*global.delta_time_var;
            break;
        }
    }
    if alarm_arr[0,0] > 0 { fade_alpha_var = 1-(alarm_arr[0,0]/alarm_arr[0,1]); }
    if alarm_arr[1,0] > 0 { fade_alpha_var = alarm_arr[1,0]/alarm_arr[1,1]; }
');
// Next State Event
object_event_add
(argument0,ev_other,ev_user0,'
    state_var += 1;
    reset_alarm_scr();
    switch state_var
    {
        case 1: // AMG
        {
            fmod_inst_stop_scr(inst_var);
            inst_var = fmod_snd_play_scr(amg_snd_var);
            fmod_update_take_over_when_lock_scr();
            splash_show_video(amg_vid_var,false);
            global.last_time_var = current_time;
            fmod_update_take_over_done_scr();
            event_user(0);
            global.input_press_arr[confirm_input_const,0] = false;
            exit;
        }
        case 2: // Recode
        {
            fmod_inst_stop_scr(inst_var);
            image_xscale = 0.5;
            image_yscale = 0.5;
            image_alpha = 1;
            set_alarm_scr(1,60);
            set_alarm_scr(2,300);
            set_alarm_scr(5,240);
            break;
        }
        case 3: // FMOD
        {
            image_xscale = 1;
            image_yscale = 1;
            image_alpha = 1;
            set_alarm_scr(1,60);
            set_alarm_scr(2,300);
            set_alarm_scr(5,240);
            break;
        }
        case 4: // Warning
        {
            set_alarm_scr(1,60);
            set_alarm_scr(2,360);
            set_alarm_scr(4,240);
            break;
        }
        case 5: // Leave
        {
            room_goto_scr(menu_rm);
            break;
        }
    }
');
// Fade Out Alarm
object_event_add
(argument0,ev_alarm,0,'
    fade_alpha_var = 1;
');
// Fade In Alarm
object_event_add
(argument0,ev_alarm,1,'
    fade_alpha_var = 0;
');
// Next State Alarm
object_event_add
(argument0,ev_alarm,2,'
    event_user(0);
');
// Kira Alarm
object_event_add
(argument0,ev_alarm,3,'
    image_alpha = 1;
    image_xscale = 1;
    image_yscale = 1;
    set_alarm_scr(4,60);
    set_alarm_scr(2,180);
');
// Fade Delayed Alarm 1
object_event_add
(argument0,ev_alarm,4,'
    set_alarm_scr(0,120);
');
// Fade Delayed Alarm 2
object_event_add
(argument0,ev_alarm,5,'
    set_alarm_scr(0,60);
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    switch state_var
    {
        case 0:
        {
            local.scale = view_hview[view_current]/720;
            draw_sprite_ext(kira_spr_var,0,view_wview[view_current]/2,view_hview[view_current]/2,image_xscale*local.scale,image_yscale*local.scale,image_angle,image_blend,image_alpha);
            break;
        }
        case 2:
        {
            local.scale = view_hview[view_current]/720;
            draw_sprite_ext(recode_spr_var,0,view_wview[view_current]/2,view_hview[view_current]/2,image_xscale*local.scale,image_yscale*local.scale,image_angle,image_blend,image_alpha);
            break;
        }
        case 3:
        {
            local.scale = view_hview[view_current]/720;
            draw_sprite_ext(fmod_spr_var,0,view_wview[view_current]/2,view_hview[view_current]/2,image_xscale*local.scale,image_yscale*local.scale,image_angle,image_blend,image_alpha);
            break;
        }
        case 4:
        {
            local.scale = view_hview[view_current]/720;
            draw_background_stretched(warn_bg_var,0,0,view_wview[view_current],view_hview[view_current]);
            draw_set_font(warn_font); draw_set_halign(fa_center);
            local.center = view_wview[view_current]/2;
            for (local.i=0; local.i<9; local.i+=1)
            {
                if local.i < 8
                {
                    local.xtmp = lengthdir_x(shadow_off_var*local.scale,local.i*45);
                    local.ytmp = lengthdir_y(shadow_off_var*local.scale,local.i*45);
                    draw_set_color(c_black);
                }
                else
                {
                    local.xtmp = 0;
                    local.ytmp = 0;
                    draw_set_color(c_white);
                }
                draw_text_transformed(local.center+local.xtmp-15,(139*local.scale)+local.ytmp,warn_str_01_var,2*local.scale,2*local.scale,0);
                local.wrap = (view_wview[view_current]-400)/(1.5*local.scale);
                draw_text_ext_transformed(local.center+local.xtmp-6,(336*local.scale)+local.ytmp,warn_str_02_var,-1,local.wrap,1.5*local.scale,1.5*local.scale,0);
                draw_text_transformed(local.center+local.xtmp,(580*local.scale)+local.ytmp,warn_str_03_var,0.5*local.scale,0.5*local.scale,0);
            }
            draw_set_font(main_font); draw_set_halign(fa_left); draw_set_color(c_white);
            break;
        }
    }
    draw_set_color(c_black); draw_set_alpha(fade_alpha_var);
    draw_rectangle(0,0,view_wview[view_current],view_hview[view_current],false);
    draw_set_color(c_white); draw_set_alpha(1);
');