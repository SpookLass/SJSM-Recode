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
    // Translation
    ini_open(global.lang_var);
    str_var = ini_read_string("DEAD","ringu","DEAD_ringu");
    ini_close();
    // State 0
    state_var = 0;
    spr_var = sprite_add(vanilla_directory_const+"\TEX\sprites\MS3_02_spr.png",12,false,false,0,0);
    bg_var = background_add(vanilla_directory_const+"\TEX\menu\hand_tex.png",false,false);
    // Text
    x = 300;
    y = 200;
    image_xscale = 0.5;
    image_yscale = 0.5;
    halign_var = fa_left;
    valign_var = fa_top;
    // Sound
    load_var = true;
    snd_01_var = fmod_snd_add_scr(main_directory_const+"\SND\MON\ringu_wake_snd.wav");
    snd_02_var = fmod_snd_add_scr(main_directory_const+"\SND\DEAD\gel_dead_snd.wav");
    inst_var = fmod_snd_play_scr(snd_01_var);
    // Alarms
    alarm_len_var = 3;
    fade_alarm_var = 20;
    set_alarm_scr(0,48);
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    if global.input_press_arr[confirm_input_const,global.dead_player_var] == 1
    {
        reset_alarm_scr();
        if state_var { event_perform(ev_alarm,2); }
        else { event_perform(ev_alarm,0); }
    }
    if global.input_press_arr[back_input_const,global.dead_player_var] == 1
    {
        reset_alarm_scr();
        event_perform(ev_alarm,2);
    }
    if !state_var && alarm_arr[0,0] > 0
    { spr_id_var = floor(sprite_get_number(spr_var)*(1-(alarm_arr[0,0]/alarm_arr[0,1]))); }
');
// Alarm 0 Event
object_event_add
(argument0,ev_alarm,0,'
    state_var = 1;
    fmod_inst_stop_scr(inst_var);
    inst_var = fmod_snd_loop_scr(snd_02_var);
    with instance_create(0,0,ringu_dead_bg_obj)
    {
        par_var = other.id;
        bg_var = other.bg_var;
    }
    instance_create(0,0,static_dead_obj);
    
    set_alarm_scr(1,220);
');
// Alarm 1 Event
object_event_add
(argument0,ev_alarm,1,'
    set_alarm_scr(2,fade_alarm_var);
    with instance_create(0,0,fade_eff_obj)
    {
        cam_id_var = -1;
        image_blend = c_black;
        invert_var = true;
        set_alarm_scr(0,other.fade_alarm_var);
    }
');
// Alarm 2 Event
object_event_add
(argument0,ev_alarm,2,'
    rm_goto_menu_scr(dead_rm,true);
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
    with ringu_dead_bg_obj { if par_var == other.id { instance_destroy(); }}
    if load_var
    {
        fmod_inst_stop_scr(inst_var);
        fmod_snd_free_scr(snd_01_var);
        fmod_snd_free_scr(snd_02_var);
        sprite_delete(spr_var);
        background_delete(bg_var);
        load_var = false;
    }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    d3d_set_fog(false,c_black,0,0);
    d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
    d3d_set_hidden(false);
    if state_var 
    {
        draw_set_alpha(image_alpha); draw_set_color(image_blend);
        draw_str_scr(str_var,x,y,image_xscale,image_yscale,scale_min_var,halign_var,valign_var,image_angle);
        draw_set_alpha(1); draw_set_color(c_white);
    }
    else { draw_spr_fit_scr(spr_var,spr_id_var,0,0); }
    d3d_set_hidden(true);
');