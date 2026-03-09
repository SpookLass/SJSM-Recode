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
    str_var = string_replace_all(ini_read_string("DEAD","body","DEAD_body"),"@l","
");
    ini_close();
    // Load assets
    spr_var = execute_file(main_directory_const+"\SPR\DEAD\body_dead_spr.gml",main_directory_const+"\SPR\DEAD\body_dead_spr.png");
    snd_var = fmod_snd_add_scr(vanilla_directory_const+"\SND\AMB\M6_AMB2.mp3");
    load_var = true;
    // Sound
    fmod_snd_loop_scr(snd_var);
    // Background
    spr_id_var = 0;
    // String
    x = 0;
    y = 0;
    image_xscale = 0.5;
    image_yscale = 0.5;
    // Animate
    if !global.reduce_flash_var
    { alarm_var = 3; }
    else { alarm_var = 30;}
    str_chance_var = 2;
    spr_chance_var = 4;
    str_color_len_var = 3;
    str_color_var[0] = c_white;
    str_color_var[1] = c_red;
    str_color_var[2] = c_yellow;
    // Alarm
    fade_alarm_var = 60;
    alarm_len_var = 3;
    alarm_ini_scr();
    set_alarm_scr(0,660);
    set_alarm_scr(2,alarm_var);
    // Static Fade
    with instance_create(0,0,static_fade_obj)
    {
        cam_id_var = -1;
        image_blend = c_black;
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
    if frac_chance_scr(1,str_chance_var) { image_blend = str_color_var[irandom(str_color_len_var-1)]; }
    if frac_chance_scr(1,spr_chance_var) { spr_id_var = irandom(sprite_get_number(spr_var)-1); }
    else { spr_id_var = mod_scr(spr_id_var+1,sprite_get_number(spr_var)); }
    image_alpha = random_range(0.4,1.2)
    set_alarm_scr(2,alarm_var);
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    draw_spr_fit_ext_scr(spr_var,floor(spr_id_var),0,0,image_angle,c_white,image_alpha);
    draw_set_halign(fa_center); draw_set_valign(fa_middle);
    draw_str_shadow_scr(str_var,x,y,image_xscale,image_yscale,0.125,fa_center,fa_middle,-2,2,c_black,image_blend,1,0);
    draw_set_halign(fa_left); draw_set_valign(fa_top);
');