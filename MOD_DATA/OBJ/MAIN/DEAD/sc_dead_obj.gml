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
    true_time_var = true;
    // Translation
    ini_open("lang_"+global.lang_var+".ini");
    str_var = string_replace_all(ini_read_string("DEAD","sc","DEAD_sc"),"@l","
");
    ini_close();
    // Load assets
    bg_var = bg_add_scr(sc_dead_bg_path,1,false,false,0,0);
    snd_var = snd_add_scr(sc_dead_snd_path,false,snd_group_mus_const,1,0,0);
    load_var = true;
    // String
    str_visible_var = true;
    image_alpha = 0;
    // Sound
    fmod_snd_play_scr(snd_var);
    // State
    state_var = 0;
    state_len_var = 8;
    alarm_var[0] = 60;
    alarm_var[1] = 80; // String fade in
    alarm_var[2] = 80;
    alarm_var[3] = 60; // Background 1
    alarm_var[4] = 60; // Background 2
    alarm_var[5] = 60; // Background 3
    alarm_var[6] = 380; // Background 4
    alarm_var[7] = 60;
    // Alarm
    fade_alarm_var = 60;
    alarm_len_var = 3;
    alarm_ini_scr();
    set_alarm_scr(0,alarm_var[state_var]);
    // Static Fade
    with instance_create(0,0,static_fade_obj)
    {
        cam_id_var = -1;
        image_blend = c_black;
        set_alarm_scr(0,other.alarm_var[other.state_var]);
    }
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
    if load_var
    {
        background_delete(bg_var);
        fmod_snd_free_scr(snd_var);
        load_var = false;
    }
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if global.input_press_arr[confirm_input_const,global.menu_player_var] == 1
    || global.input_press_arr[back_input_const,global.menu_player_var] == 1
    { event_perform(ev_alarm,1); }
    if state_var == 1 && alarm_arr[0,0] > 0
    { image_alpha = lerp_scr(0.8,0,alarm_arr[0,0]/alarm_arr[0,1]); }
');
// Alarm 0
object_event_add
(argument0,ev_alarm,0,'
    state_var += 1;
    switch state_var
    {
        case state_len_var-1:
        {
            set_alarm_scr(1,alarm_var[state_var]);
            with instance_create(0,0,static_fade_obj)
            {
                cam_id_var = -1;
                image_blend = c_black;
                invert_var = true;
                set_alarm_scr(0,other.alarm_var[other.state_var]);
            }
            break;
        }
        case 2: { image_alpha = 0.8; }
        case 1: { if !global.reduce_flash_var { set_alarm_scr(2,1); }}
        default: { set_alarm_scr(0,alarm_var[state_var]); break; }
    }
');
// Alarm 1
object_event_add
(argument0,ev_alarm,1,'
    rm_goto_menu_scr(dead_rm,true);
');
// Effect Alarm
object_event_add
(argument0,ev_alarm,2,'
    if image_alpha > 0
    { str_visible_var = frac_chance_scr(1,2); }
    set_alarm_scr(2,1);
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    draw_bg_fit_scr(bg_var,0,0);
    if state_var >= 3 { draw_bg_fit_ext_scr(bg_var,0,6,0,c_white,0.3);}
    if state_var >= 4 { draw_bg_fit_ext_scr(bg_var,0,-6,0,c_white,0.3);}
    if state_var >= 5 { draw_bg_fit_ext_scr(bg_var,-6,0,0,c_white,0.3);}
    if state_var >= 6 { draw_bg_fit_ext_scr(bg_var,6,0,0,c_white,0.3);}
    if str_visible_var && image_alpha > 0
    {
        draw_set_halign(fa_center); draw_set_valign(fa_middle); draw_set_alpha(image_alpha); draw_set_color(c_black);
        draw_str_ext_scr(str_var,0,0,0.6,0.7,0.125,fa_center,fa_middle,80,-1,0);
        draw_set_halign(fa_left); draw_set_valign(fa_top); draw_set_alpha(1);  draw_set_color(c_white);
    }
    
');