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
    str_var = ini_read_string("DEAD","gel","DEAD_gel");
    ini_close();
    // State 0
    state_var = 0;
    color_var = c_white;
    spr_var = sprite_add(vanilla_directory_const+"\TEX\sprites\MS_02_spr.png",1,false,false,0,0);
    sprite_set_offset(spr_var,sprite_get_width(spr_var)/2,sprite_get_height(spr_var)/2);
    scale_base_var = 1280;
    // Text
    x = 100;
    y = 200;
    image_xscale = 0.5;
    image_yscale = 0.5;
    halign_var = fa_left;
    valign_var = fa_top;
    // Sound
    load_var = true;
    snd_01_var = fmod_snd_add_scr(main_directory_const+"\SND\MON\gel_wake_snd.wav");
    snd_02_var = fmod_snd_add_scr(main_directory_const+"\SND\DEAD\gel_dead_snd.wav");
    inst_var = fmod_snd_play_scr(snd_01_var);
    // Alarms
    alarm_len_var = 5;
    fade_alarm_var = 20;
    set_alarm_scr(0,30);
    set_alarm_scr(4,1);
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    if global.input_press_arr[confirm_input_const,global.dead_player_var] == 1
    {
        reset_alarm_scr();
        if state_var < 2 { event_perform(ev_alarm,1); }
        else { event_perform(ev_alarm,3); }
    }
    if global.input_press_arr[back_input_const,global.dead_player_var] == 1
    {
        reset_alarm_scr();
        event_perform(ev_alarm,3);
    }
    if state_var < 2
    {
        scale_var = scale_base_var;
        if state_var == 1
        { scale_var *= 1.2^(alarm_arr[1,1]-alarm_arr[1,0]);}
    }
');
// Alarm 0 Event
object_event_add
(argument0,ev_alarm,0,'
    color_var = c_red;
    state_var = 1;
    set_alarm_scr(1,30);
');
// Alarm 1 Event
object_event_add
(argument0,ev_alarm,1,'
    state_var = 2;
    fmod_inst_stop_scr(inst_var);
    inst_var = fmod_snd_loop_scr(snd_02_var);
    instance_create(0,0,flash_dead_obj);
    instance_create(0,0,static_dead_obj);
    set_alarm_scr(2,180);
');
// Alarm 2 Event
object_event_add
(argument0,ev_alarm,2,'
    set_alarm_scr(3,fade_alarm_var);
    with instance_create(0,0,fade_eff_obj)
    {
        cam_id_var = -1;
        image_blend = c_black;
        invert_var = true;
        set_alarm_scr(0,other.fade_alarm_var);
    }
');
// Alarm 3 Event
object_event_add
(argument0,ev_alarm,3,'
    rm_goto_menu_scr(menu_rm,true);
');
// Alarm 4 Event
object_event_add
(argument0,ev_alarm,4,'
    if state_var < 2
    {
        scale_base_var = random_range(1280,1536);
        set_alarm_scr(4,1);
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
        fmod_inst_stop_scr(inst_var);
        fmod_snd_free_scr(snd_01_var);
        fmod_snd_free_scr(snd_02_var);
        sprite_delete(spr_var);
    }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    d3d_set_fog(false,c_black,0,0);
    d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
    d3d_set_hidden(false);
    if state_var < 2 { draw_spr_stretch_ext_scr(spr_var,0,0,0,scale_var,0,fa_center,fa_middle,0,color_var,1); }
    else
    {
        draw_set_alpha(image_alpha); draw_set_color(image_blend);
        draw_str_scr(str_var,x,y,image_xscale,image_yscale,scale_min_var,halign_var,valign_var,image_angle);
        draw_set_alpha(1); draw_set_color(c_white);
    }
    d3d_set_hidden(true);
');