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
    str_var = string_replace_all(ini_read_string("DEAD","lisa","DEAD_lisa"),"@l","
");
    ini_close();
    // Load assets
    bg_var = background_add(vanilla_directory_const+"\TEX\sprites\MS25_01_spr.png",false,false);
    spr_var = execute_file(main_directory_const+"\SPR\DEAD\lisa_dead_spr.gml",main_directory_const+"\SPR\DEAD\lisa_dead_spr.png");
    snd_var = fmod_snd_add_scr(main_directory_const+"\SND\MON\lisa_wake_snd.wav");
    load_var = true;
    // Sprite
    y = random_range(-0.5,-2);
    bg_visible_var = frac_chance_scr(3,4);
    bg_y_var = y+random_range(-8,8);
    spr_id_var = irandom(sprite_get_number(spr_var)-1);
    // Sound
    fmod_snd_play_scr(snd_var);
    // String
    str_visible_var = frac_chance_scr(1,3);
    image_alpha = random_range(0.7,1);
    // Alarm
    fade_alarm_var = 30;
    alarm_len_var = 4;
    alarm_ini_scr();
    set_alarm_scr(0,270);
    set_alarm_scr(2,1);
    set_alarm_scr(3,irandom_range(3,6));
    // FLASH!!!
    with instance_create(0,0,flash_eff_obj)
    {
        image_blend = c_red; 
        set_alarm_scr(0,6);
        cam_id_var = other.attack_target_var.cam_id_var;
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
    if global.input_press_arr[confirm_input_const,global.dead_player_var] == 1
    || global.input_press_arr[back_input_const,global.dead_player_var] == 1
    { event_perform(ev_alarm,1); }
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
    spr_id_var = irandom(sprite_get_number(spr_var)-1);
    bg_visible_var = frac_chance_scr(3,4);
    str_visible_var = frac_chance_scr(1,3);
    image_alpha = random_range(0.7,1);
    bg_y_var = y+random_range(-8,8);
    set_alarm_scr(2,1);
');
// Effect Alarm
object_event_add
(argument0,ev_alarm,3,'
    y -= random_range(0.5,2);
    set_alarm_scr(3,irandom_range(3,6));
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if bg_visible_var { draw_bg_fit_scr(bg_var,0,bg_y_var)}
    if str_visible_var
    {
        draw_set_alpha(image_alpha);
        draw_str_scr(str_var,0,0,0.6,0.6,0.125,fa_center,fa_middle,0);
        draw_set_alpha(1);
    }
    draw_set_blend_mode_ext(bm_dest_color,bm_src_color);
    draw_spr_fit_scr(spr_var,spr_id_var,0,0);
    draw_set_blend_mode(bm_normal);
');