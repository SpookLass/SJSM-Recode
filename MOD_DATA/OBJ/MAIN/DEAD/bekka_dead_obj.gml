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
    str_var = ini_read_string("DEAD","bekka","DEAD_bekka");
    ini_close();
    // Load assets
    spr_var = sprite_add(vanilla_directory_const+"\TEX\sprites\MS23_01_spr.png",1,false,false,0,0);
    sprite_set_offset(spr_var,sprite_get_width(spr_var)/2,125);
    snd_var = fmod_snd_add_scr(main_directory_const+"\SND\DEAD\bekka_dead_snd.ogg");
    load_var = true;
    // Sprite
    spr_visible_var = !irandom(2);
    // Sound
    fmod_snd_play_scr(snd_var);
    // Alarm
    fade_alarm_var = 60;
    alarm_len_var = 3;
    alarm_ini_scr();
    set_alarm_scr(0,340);
    set_alarm_scr(2,1);
    // Static Fade
    with instance_create(0,0,static_fade_obj)
    {
        cam_id_var = -1;
        image_blend = c_black;
        set_alarm_scr(0,other.fade_alarm_var);
    }
    // FLASH!!!
    with instance_create(0,0,flash_eff_obj)
    {
        image_blend = c_red; 
        set_alarm_scr(0,6);
        cam_id_var = -1;
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
');
// Alarm 0
object_event_add
(argument0,ev_alarm,0,'
    set_alarm_scr(1,fade_alarm_var);
    with instance_create(0,0,static_fade_obj)
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
    spr_visible_var = !irandom(2);
    image_alpha = random_range(0.3,0.6);
    set_alarm_scr(2,1);
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if spr_visible_var { draw_spr_stretch_scr(spr_var,0,0,0,2864,0,fa_center,fa_middle); }
    draw_set_alpha(image_alpha);
    draw_set_halign(fa_center); draw_set_valign(fa_middle);
    draw_str_scr(str_var,0,0,1,1,0.125,fa_center,fa_middle,0);
    draw_set_halign(fa_left); draw_set_valign(fa_top);
    draw_set_alpha(1);
');