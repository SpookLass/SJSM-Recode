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
    str_var = string_replace_all(ini_read_string("DEAD","eel","DEAD_eel"),"@l","
");
    ini_close();
    // Load assets
    spr_01_var = execute_file(main_directory_const+"\SPR\DEAD\eel_dead_01_spr.gml",main_directory_const+"\SPR\DEAD\eel_dead_01_spr.png");
    spr_02_var = execute_file(main_directory_const+"\SPR\DEAD\eel_dead_02_spr.gml",main_directory_const+"\SPR\DEAD\eel_dead_02_spr.png");
    spr_03_var = execute_file(main_directory_const+"\SPR\DEAD\eel_dead_03_spr.gml",main_directory_const+"\SPR\DEAD\eel_dead_03_spr.png");
    spr_04_var = static_01_spr;
    snd_var = fmod_snd_add_scr(main_directory_const+"\SND\DEAD\gel_dead_snd.wav");
    load_var = true;
    // Sprite
    spr_03_id_var = irandom(sprite_get_number(spr_03_var)-1);
    spr_04_id_var = irandom(sprite_get_number(spr_04_var)-1);
    spr_spd_var = 0.5;
    // Sound
    inst_var = fmod_snd_loop_scr(snd_var);
    // Effects
    invert_var = !irandom(3);
    // Chomp!
    prechomp_dist_var = 280;
    prechomp_alarm_var = 540;
    chomp_dist_var = 0;
    chomp_alarm_var = 15;
    fade_alarm_var = 30;
    chomp_y_var = 360;
    // Alarm
    alarm_len_var = 5;
    alarm_ini_scr();
    set_alarm_scr(0,prechomp_alarm_var);
    set_alarm_scr(3,15);
    set_alarm_scr(4,irandom_range(3,6));
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
        sprite_delete(spr_01_var);
        sprite_delete(spr_02_var);
        sprite_delete(spr_03_var);
        fmod_snd_free_scr(snd_var);
        load_var = false;
    }
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if global.input_press_arr[confirm_input_const,global.dead_player_var] == 1
    || global.input_press_arr[back_input_const,global.dead_player_var] == 1
    { event_perform(ev_alarm,2); }
    spr_04_id_var = mod_scr(spr_04_id_var+(spr_spd_var*global.delta_time_var),sprite_get_number(spr_04_var));
    if alarm_arr[0,0] > 0
    { chomp_y_var = lerp_scr(prechomp_dist_var,360,alarm_arr[0,0]/alarm_arr[0,1]); }
    else if alarm_arr[1,0]
    { chomp_y_var = lerp_scr(chomp_dist_var,prechomp_dist_var,alarm_arr[1,0]/alarm_arr[1,1]); }
');
// Alarm 0
object_event_add
(argument0,ev_alarm,0,'
    chomp_y_var = prechomp_dist_var;
    set_alarm_scr(1,chomp_alarm_var);
');
// Alarm 1
object_event_add
(argument0,ev_alarm,1,'
    chomp_y_var = chomp_dist_var;
    fmod_inst_stop_scr(inst_var);
    inst_var = fmod_snd_play_scr(claw_snd);
    set_alarm_scr(2,fade_alarm_var);
    with instance_create(0,0,fade_eff_obj)
    {
        cam_id_var = -1;
        image_blend = c_red;
        set_alarm_scr(0,other.fade_alarm_var);
    }
');
// Alarm 1
object_event_add
(argument0,ev_alarm,2,'
    fmod_inst_stop_scr(inst_var);
    rm_goto_menu_scr(dead_rm,true);
');
// Alarm 3
object_event_add
(argument0,ev_alarm,3,'
    if !irandom(3) { spr_03_id_var = irandom(sprite_get_number(spr_03_var)-1); }
    else { spr_03_id_var = mod_scr(spr_03_id_var+1,sprite_get_number(spr_03_var));}
    set_alarm_scr(3,15);
');
// Alarm 4
object_event_add
(argument0,ev_alarm,4,'
    invert_var = !irandom(3);
    set_alarm_scr(4,irandom_range(3,6));
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    draw_spr_fit_scr(spr_03_var,floor(spr_03_id_var),0,0);
    if invert_var
    {
        draw_set_blend_mode_ext(bm_inv_dest_color,bm_zero);
        draw_rectangle(0,0,view_wview[view_current],view_hview[view_current],false);
        draw_set_blend_mode(bm_normal);
    }
    draw_str_scr(str_var,0,0,0.5,0.5,0.125,fa_center,fa_middle,0);
    draw_spr_tiled_scale_ext_scr(spr_04_var,floor(spr_04_id_var),0,0,256,256,2,0,c_white,0.25);
    draw_spr_stretch_scr(spr_01_var,0,0,-chomp_y_var,1280,0,fa_center,fa_middle);
    draw_spr_stretch_scr(spr_02_var,0,0,chomp_y_var,1280,0,fa_center,fa_middle);
');