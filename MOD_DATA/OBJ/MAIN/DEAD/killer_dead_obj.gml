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
    // Assets
    face_spr_var = sprite_add(vanilla_directory_const+"\TEX\sprites\FACE_02_spr.png",1,0,0,0,0);
    sprite_set_offset(face_spr_var,sprite_get_width(face_spr_var)/2,sprite_get_height(face_spr_var)/2);
    eff_spr_var = sprite_add(vanilla_directory_const+"\TEX\sprites\FACE_02b_spr.png",10,0,0,0,0);
    static_01_spr_var = execute_file(main_directory_const+"\SPR\DEAD\killer_static_01_spr.gml",main_directory_const+"\SPR\DEAD\killer_static_01_spr.png");
    static_02_spr_var = execute_file(main_directory_const+"\SPR\DEAD\killer_static_02_spr.gml",main_directory_const+"\SPR\DEAD\killer_static_02_spr.png");
    snd_var = fmod_snd_add_scr(main_directory_const+"\SND\DEAD\killer_dead_snd.wav");
    load_var = true;
    // Sound
    fmod_snd_play_scr(snd_var);
    // Effect
    eff_spr_id_var = irandom(sprite_get_number(eff_spr_var)-1);
    eff_spr_spd_var = 0.25;
    eff_alarm_min_var = 3;
    eff_alarm_max_var = 12;
    // Static
    if !irandom(1) { static_spr_var = static_01_spr_var; }
    else { static_spr_var = static_02_spr_var; }
    static_spr_id_var  = irandom(sprite_get_number(static_spr_var)-1);
    static_spr_spd_var = 0.5;
    static_alarm_min_var = 6;
    static_alarm_max_var = 12;
    image_xscale = 192;
    image_yscale = 192;
    // Alarm
    alarm_len_var = 5;
    alarm_ini_scr();
    fade_alarm_var = 60;
    set_alarm_scr(0,240);
    set_alarm_scr(2,irandom_range(eff_alarm_min_var,eff_alarm_max_var));
    set_alarm_scr(3,irandom_range(static_alarm_min_var,static_alarm_max_var));
    set_alarm_scr(4,1);
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
        sprite_delete(face_spr_var);
        sprite_delete(eff_spr_var);
        sprite_delete(static_01_spr_var);
        sprite_delete(static_02_spr_var);
        fmod_snd_free_scr(snd_var);
        load_var = false;
    }
');
// Alarm 0
object_event_add
(argument0,ev_alarm,0,'
    set_alarm_scr(1,fade_alarm_var);
    with instance_create(0,0,fade_eff_obj)
    {
        cam_id_var = -1;
        image_blend = c_black;
        invert_var = true;
        set_alarm_scr(0,other.fade_alarm_var);
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
    if !irandom(1) { eff_spr_id_var = irandom(sprite_get_number(eff_spr_var)-1); }
    set_alarm_scr(2,irandom_range(eff_alarm_min_var,eff_alarm_max_var));
');
// Static Alarm
object_event_add
(argument0,ev_alarm,3,'
    if !irandom(1) { static_spr_var = static_01_spr_var; }
    else { static_spr_var = static_02_spr_var; }
    if !irandom(1) { image_yscale = random_range(6400,19200); }
    else { image_yscale = 192; }
    set_alarm_scr(3,irandom_range(static_alarm_min_var,static_alarm_max_var));
');
// Other Alarm
object_event_add
(argument0,ev_alarm,4,'
    if !irandom(1) { image_alpha = random_range(0.5,1.3); }
    set_alarm_scr(4,1);
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if global.input_press_arr[confirm_input_const,global.menu_player_var] == 1
    || global.input_press_arr[back_input_const,global.menu_player_var] == 1
    { event_perform(ev_alarm,1); }
    eff_spr_id_var = mod_scr(eff_spr_id_var+(eff_spr_spd_var*global.delta_time_var),sprite_get_number(eff_spr_var));
    static_spr_id_var = mod_scr(static_spr_id_var+(static_spr_spd_var*global.delta_time_var),sprite_get_number(static_spr_var));
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    draw_spr_tiled_scale_scr(static_spr_var,floor(static_spr_id_var),0,0,image_xscale,image_yscale,2);
    draw_spr_stretch_ext_scr(face_spr_var,0,0,0,1033,0,fa_center,fa_middle,0,image_blend,image_alpha);
    draw_spr_fit_scr(eff_spr_var,floor(eff_spr_id_var),0,0);
');