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
    str_var =  string_replace_all(ini_read_string("DEAD","frenzy","DEAD_frenzy"),"@l","
");
    ini_close();
    // String
    image_xscale = 0.4;
    image_yscale = 0.4;
    image_alpha = 0.8;
    // Assets
    load_var = true;
    bg_var = background_add(main_directory_const+"\BG\DH\tile_static_bg.png",false,false);
    snd_var = fmod_snd_add_scr(main_directory_const+"\SND\DH\frenzy_dead_snd.mp3",false);
    fmod_snd_play_scr(snd_var);
    // Background
    bg_xscale_min_var = 128;
    bg_xscale_max_var = 256;
    bg_yscale_min_var = 128;
    bg_yscale_max_var = 384;
    bg_alpha_min_var = 0.1;
    bg_alpha_max_var = 0.3;
    bg_xscale_var = random_range(bg_xscale_min_var,bg_xscale_max_var);
    bg_x_var = random(bg_xscale_var);
    bg_yscale_var = random_range(bg_yscale_min_var,bg_yscale_max_var);
    bg_y_var = random(bg_yscale_var);
    bg_alpha_var = random_range(bg_alpha_min_var,bg_alpha_max_var);
    // Alarm
    fade_alarm_var = 120;
    alarm_len_var = 4;
    alarm_ini_scr();
    set_alarm_scr(0,960);
    // Animate
    if !global.reduce_flash_var
    {
        set_alarm_scr(2,1);
        set_alarm_scr(3,360);
    }
    // Fade
    with instance_create(0,0,fade_eff_obj)
    {
        cam_id_var = -1;
        image_blend = c_black;
        invert_var = false;
        set_alarm_scr(0,other.fade_alarm_var);
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
        fmod_snd_free_scr(snd_var);
        background_delete(bg_var);
        load_var = false;
    }
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    if global.input_press_arr[confirm_input_const,global.menu_player_var] == 1
    || global.input_press_arr[back_input_const,global.menu_player_var] == 1
    { event_perform(ev_alarm,1); }
');
// Alarm 0 Event
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
// Alarm 1 Event
object_event_add
(argument0,ev_alarm,1,'
    rm_goto_menu_scr(dead_rm,true);
');
// Alarm 2 Event
object_event_add
(argument0,ev_alarm,2,'
    bg_xscale_var = random_range(bg_xscale_min_var,bg_xscale_max_var);
    bg_x_var = random(bg_xscale_var);
    bg_yscale_var = random_range(bg_yscale_min_var,bg_yscale_max_var);
    bg_y_var = random(bg_yscale_var);
    bg_alpha_var = random_range(bg_alpha_min_var,bg_alpha_max_var);
    set_alarm_scr(2,1);
');
// Alarm 3 Event
object_event_add
(argument0,ev_alarm,3,'
    // FLASH!!!
    if !global.reduce_flash_var
    {
        with instance_create(0,0,flash_eff_obj)
        {
            image_blend = c_red; 
            set_alarm_scr(0,6);
            cam_id_var = -1;
        }
        set_alarm_scr(3,180);
    }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    d3d_set_fog(false,c_black,0,0);
    d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
    d3d_set_hidden(false);
    draw_bg_tiled_scale_ext_scr(bg_var,bg_x_var,bg_y_var,bg_xscale_var,bg_yscale_var,2,0,c_white,bg_alpha_var);
    draw_set_color(image_blend); draw_set_alpha(image_alpha); draw_set_halign(fa_center); draw_set_valign(fa_middle);
    draw_str_scr(str_var,0,0,image_xscale,image_yscale,0.125,fa_center,fa_middle,0);
    draw_set_color(c_white); draw_set_alpha(1); draw_set_halign(fa_left); draw_set_valign(fa_top);
    d3d_set_hidden(true);
');