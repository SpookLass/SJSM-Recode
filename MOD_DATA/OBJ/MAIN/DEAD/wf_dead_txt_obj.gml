// Builtin Variables
object_set_depth(argument0,-101);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    // Translations
    str_len_var = 3;
    ini_open(global.lang_var);
    str_arr_var[0] = ini_read_string("DEAD","wf_01","DEAD_wf_01");
    str_arr_var[1] = ini_read_string("DEAD","wf_02","DEAD_wf_02");
    str_arr_var[2] = ini_read_string("DEAD","wf_03","DEAD_wf_03");
    ini_close();
    // Text
    char_var = 0;
    str_var = 0;
    char_alarm_var = 10/3;
    char_delay_var = 106; // On average
    str_draw_var = "";
    image_xscale = 0.8;
    image_yscale = 0.8;
    // Sound
    inst_var = noone;
    // Alarms
    alarm_len_var = 1;
    alarm_ini_scr();
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    if global.input_press_arr[confirm_input_const,global.menu_player_var] == 1
    {
        reset_alarm_scr();
        if str_var >= str_len_var
        {
            with wf_dead_3d_obj { set_alarm_scr(1,pass_delay_var); }
            instance_destroy();
        }
        else if char_var < string_length(str_arr_var[str_var])
        {
            str_draw_var = str_arr_var[str_var];
            set_alarm_scr(0,char_delay_var);
            str_var += 1;
            char_var = 0;
        }
        else { event_perform(ev_alarm,0); }
    }
');
// String Alarm Event
object_event_add
(argument0,ev_alarm,0,'
    if str_var >= str_len_var
    {
        with wf_dead_3d_obj { set_alarm_scr(1,pass_delay_var); }
        instance_destroy();
    }
    else if char_var < string_length(str_arr_var[str_var])
    {
        char_var += 1;
        // Sound
        fmod_inst_stop_scr(inst_var);
        inst_var = fmod_snd_play_scr(load_par_obj.snd_arr_var[irandom(load_par_obj.snd_len_var-1),0]);
        // Next string
        if char_var >= string_length(str_arr_var[str_var])
        {
            str_draw_var = str_arr_var[str_var];
            set_alarm_scr(0,char_delay_var);
            str_var += 1;
            char_var = 0;
        }
        else
        {
            str_draw_var = string_copy(str_arr_var[str_var], 0, char_var);
            set_alarm_scr(0,char_alarm_var);
        }
    }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    d3d_set_fog(false,c_black,0,0);
    d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
    d3d_set_hidden(false);
    draw_set_color(image_blend); draw_set_alpha(image_alpha); draw_set_halign(fa_center); draw_set_valign(fa_bottom);
    draw_str_ext_scr(str_draw_var,0,-54,image_xscale,image_yscale,0.125,fa_center,fa_bottom,-1,54,0)
    draw_set_color(c_white); draw_set_alpha(1); draw_set_halign(fa_left); draw_set_valign(fa_top);
    d3d_set_hidden(true);
');