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
    str_var = string_replace_all(ini_read_string("DEAD","gc","DEAD_gc"),"@l","
");
    ini_close();
    // Load assets
    bg_var = background_add(vanilla_directory_const+"\TEX\sprites\MS22_01_spr.png",false,false);
    snd_var = fmod_snd_add_scr(vanilla_directory_const+"\SND\AMB\M6_AMB2.mp3");
    load_var = true;
    // Sound
    fmod_snd_play_scr(snd_var);
    // Background
    bg_x_var = random_range(-2,2);
    bg_y_var = random_range(-2,2);
    // String
    x = 200;
    y = 200+random_range(-2,2);
    image_xscale = 0.5;
    image_yscale = 0.5;
    // Static
    spr_var = static_01_spr;
    spr_id_var = irandom(sprite_get_number(spr_var)-1)
    spr_spd_var = 1;
    // Alarm
    fade_alarm_var = 60;
    alarm_len_var = 3;
    alarm_ini_scr();
    set_alarm_scr(0,300);
    set_alarm_scr(2,1);
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
    spr_id_var = mod_scr(spr_id_var+(spr_spd_var*global.delta_time_var),sprite_get_number(spr_var));
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
    y = 200+random_range(-2,2);
    bg_x_var = random_range(-2,2);
    bg_y_var = random_range(-2,2);
    set_alarm_scr(2,1);
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    draw_bg_fit_scr(bg_var,bg_x_var,bg_y_var);
    draw_str_scr(str_var,x,y,image_xscale,image_yscale,0.125,fa_left,fa_top,0);
    draw_spr_tiled_scale_ext_scr(spr_var,floor(spr_id_var),0,0,1024,128,2,0,c_white,0.5);
');