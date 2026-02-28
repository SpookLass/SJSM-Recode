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
    str_var = string_replace_all(ini_read_string("DEAD","patient","DEAD_patient"),"@l","
");
    ini_close();
    // Load assets
    spr_var = sprite_add(vanilla_directory_const+"\TEX\sprites\MS21_01_spr.png",8,0,0,0,0);
    sprite_set_offset(spr_var,sprite_get_width(spr_var)/2,sprite_get_height(spr_var)/2);
    snd_var = fmod_snd_add_scr(vanilla_directory_const+"\SND\AMB\M6_AMB2.mp3");
    load_var = true;
    // Sound
    fmod_snd_play_scr(snd_var);
    // Background
    spr_id_var = 0;
    spr_x_var = random_range(-8,8);
    spr_y_var = random_range(-8,8);
    spr_xscale_var = random_range(1280,1344);
    spr_yscale_var = random_range(720,756);
    // String
    x = 200;
    y = 200;
    image_xscale = 0.5;
    image_yscale = random_range(0.5,0.6);
    // Static
    static_spr_var = static_01_spr;
    static_spr_id_var = irandom(sprite_get_number(spr_var)-1)
    static_spr_spd_var = 0.25;
    static_scale_var = random_range(128,768);
    // Alarm
    fade_alarm_var = 60;
    alarm_len_var = 4;
    alarm_ini_scr();
    set_alarm_scr(0,300);
    set_alarm_scr(2,1);
    set_alarm_scr(3,30);
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
        sprite_delete(spr_var);
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
    static_spr_id_var = mod_scr(static_spr_id_var+(static_spr_spd_var*global.delta_time_var),sprite_get_number(static_spr_var));
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
    image_yscale = random_range(0.5,0.6);
    spr_x_var = random_range(-8,8);
    spr_y_var = random_range(-8,8);
    spr_xscale_var = random_range(1280,1344);
    spr_yscale_var = random_range(720,756);
    spr_id_var = irandom(sprite_get_number(spr_var)-1);
    set_alarm_scr(2,1);
');
// Effect Alarm
object_event_add
(argument0,ev_alarm,3,'
    if !irandom(1) { static_scale_var = random_range(128,768); }
    set_alarm_scr(3,30);
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    draw_spr_scale_scr(spr_var,floor(spr_id_var),spr_x_var,spr_y_var,spr_xscale_var,spr_yscale_var,fa_center,fa_middle);
    draw_str_scr(str_var,x,y,image_xscale,image_yscale,0.125,fa_left,fa_top,0);
    draw_spr_tiled_scale_ext_scr(static_spr_var,floor(static_spr_id_var),0,0,128,static_scale_var,2,0,c_white,0.2);
');