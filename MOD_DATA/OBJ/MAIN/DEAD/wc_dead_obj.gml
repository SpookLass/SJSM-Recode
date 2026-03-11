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
    str_var = ini_read_string("DEAD","wc","DEAD_wc");
    ini_close();
    // Load assets
    bg_var = background_add(dh_directory_const+"\TEX\sprites\WD_SPR6.png",false,false);
    spr_var = sprite_add(dh_directory_const+"\TEX\sprites\WD_SPR7.png",1,false,false,0,0);
    sprite_set_offset(spr_var,sprite_get_width(spr_var),sprite_get_height(spr_var));
    snd_var = fmod_snd_add_scr(main_directory_const+"\SND\DH\wc_dead_snd.mp3");
    load_var = true;
    // Background
    image_alpha = random_range(0.5,0.7);
    // Sprite
    spr_visible_var = true;
    x = 346.8; // 986.8-640
    y = 158.6; // 518.6-360
    spr_xscale_min_var = 499.8; // 375 frames
    spr_xscale_max_var = 764.4;
    spr_yscale_min_var = 93.6;
    spr_yscale_max_var = 90.675;
    image_xscale = spr_xscale_min_var;
    image_yscale = spr_yscale_max_var;
    // Static
    static_spr_var = static_01_spr;
    static_xscale_var = 512;
    static_yscale_var = 512;
    static_x_var = random(static_xscale_var);
    static_y_var = random(static_yscale_var);
    // String
    str_alpha_var = random_range(0.4,0.6);
    str_xscale_var = 0.5;
    str_yscale_var = 0.5;
    // Sound
    fmod_snd_play_scr(snd_var);
    // Alarm
    alarm_len_var = 2;
    alarm_ini_scr();
    set_alarm_scr(0,340); // 330 / 375 originally
    if !global.reduce_flash_var { set_alarm_scr(1,1); }
    // Static Fade
    with instance_create(0,0,fade_eff_obj)
    {
        cam_id_var = -1;
        image_blend = c_red;
        set_alarm_scr(0,20);
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
        background_delete(bg_var);
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
    { event_perform(ev_alarm,0); }
    if alarm_arr[0,0] > 0
    {
        local.per = alarm_arr[0,0]/alarm_arr[0,1];
        image_xscale = lerp_scr(spr_xscale_max_var,spr_xscale_min_var,local.per);
        image_yscale = lerp_scr(spr_yscale_min_var,spr_yscale_max_var,local.per);
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
    spr_visible_var = frac_chance_scr(5,9);
    image_alpha = random_range(0.5,0.7);
    str_alpha_var = random_range(0.4,0.6);
    str_yscale_var = random_range(0.4,0.5); // Sorry, I need text wrapping to be good
    static_x_var = random(static_xscale_var);
    static_y_var = random(static_yscale_var);
    set_alarm_scr(1,1);
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    draw_bg_fit_ext_scr(bg_var,0,0,image_angle,image_blend,image_alpha);
    if spr_visible_var { draw_spr_scale_scr(spr_var,0,x,y,image_xscale,image_yscale,fa_center,fa_middle); }
    draw_set_halign(fa_center); draw_set_valign(fa_middle); draw_set_alpha(str_alpha_var);
    draw_str_ext_scr(str_var,0,-120,str_xscale_var,str_yscale_var,0.125,fa_center,fa_middle,-1,320,0);
    draw_set_halign(fa_left); draw_set_valign(fa_top); draw_set_alpha(1);
    draw_spr_tiled_scale_ext_scr(static_spr_var,0,static_x_var,static_y_var,static_xscale_var,static_yscale_var,2,0,c_white,0.3);
');