// Builtin Variables
object_set_depth(argument0,-100);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    // Translation
    str_var = "Once a world of dreams and excitement,
a land of journey and enlightenment.

Now a forgotten soul tattered and stretched thin,
still living yet buried under the scorched skin.";
    // Load assets
    snd_var = fmod_snd_add_scr(example_directory_const+"\SND\DEAD\gurgle_dead_snd.wav");
    load_var = true;
    // Sound
    inst_var = fmod_snd_loop_scr(snd_var);
    // String
    image_xscale = 0.6;
    image_yscale = 0.6;
    image_alpha = random(1);
    // Resolution
    res_max_var = 1;
    res_min_var = 0.1;
    global.res_override_var = true;
    global.res_override_w_var = global.res_w_var;
    global.res_override_h_var = global.res_h_var;
    res_rate_var = 6;
    // Alarm
    alarm_len_var = 3;
    alarm_ini_scr();
    alarm_arr[0,2] = true;
    set_alarm_scr(0,576);
    set_alarm_scr(2,1);
    // Persist!
    with instance_create(0,0,static_dead_obj)
    {
        alarm_arr[0,2] = true;
        persistent = true;
    }
');
// Destroy
object_event_add
(argument0,ev_destroy,0,'
    global.res_override_var = false;
    global.res_override_w_var = global.res_w_var;
    global.res_override_h_var = global.res_h_var;
    if load_var
    {
        fmod_snd_free_scr(snd_var);
        load_var = false;
    }
');
// Room Start
object_event_add
(argument0,ev_other,ev_room_start,'
    set_alarm_scr(1,res_rate_var);
    set_alarm_scr(2,1);
    if alarm_arr[0,0] <= 0 { event_perform(ev_alarm,0); }
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if global.input_press_arr[confirm_input_const,global.menu_player_var] == 1
    || global.input_press_arr[back_input_const,global.menu_player_var] == 1
    { event_perform(ev_alarm,0); }
    if alarm_arr[0,0] > 0
    {
        local.per = lerp_scr(res_min_var,res_max_var,alarm_arr[0,0]/alarm_arr[0,1]);
        global.res_override_w_var = global.res_w_var*local.per;
        global.res_override_h_var = global.res_h_var*local.per;
    }
');
// Alarm 0
object_event_add
(argument0,ev_alarm,0,'
    rm_goto_menu_scr(dead_rm,true);
');
// Alarm 1
object_event_add
(argument0,ev_alarm,1,'
    rm_goto_menu_scr(gurgle_dead_02_rm,false);
');
// Effect Alarm
object_event_add
(argument0,ev_alarm,2,'
    image_alpha = random(1);
    set_alarm_scr(2,1);
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    draw_set_alpha(image_alpha);
    draw_set_halign(fa_center); draw_set_valign(fa_middle);
    draw_str_scr(str_var,0,0,image_xscale,image_yscale,0,fa_center,fa_middle,0);
    draw_set_halign(fa_left); draw_set_valign(fa_top);
    draw_set_alpha(1);
');