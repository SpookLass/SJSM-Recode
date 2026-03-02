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
    str_main_var =  string_replace_all(ini_read_string("DEAD","fd","DEAD_fd"),"@l","
");
    str_binary_var = ini_read_string("DEAD","fd_binary","DEAD_fd_binary");
    ini_close();
    // String
    do_str_var = false;
    if !irandom(3)
    {
        str_var = str_binary_var;
        image_xscale = 0.5;
        image_yscale = 0.5;
    }
    else
    {
        str_var = str_main_var;
        image_xscale = 0.6;
        if !irandom(1) { image_yscale = 0.8; }
        else { image_yscale = 1.2; }
    }
    str_color_var = make_color_rgb(255,255,128);
    // Sprite
    load_var = true;
    spr_var = sprite_add(vanilla_directory_const+"\TEX\sprites\MS9_03_spr.png",19,false,false,0,0);
    spr_id_var = irandom(sprite_get_number(spr_var)-1);
    // Sound
    snd_var = fmod_snd_add_scr(main_directory_const+"\SND\RM\food_chain_snd.wav",false);
    fmod_snd_loop_scr(snd_var);
    // Alarm
    alarm_var = 3;
    fade_alarm_var = 60;
    alarm_len_var = 5;
    alarm_ini_scr();
    set_alarm_scr(0,160);
    // Animate
    if global.reduce_flash_var { spr_spd_var = 0; }
    else { spr_spd_var = 0.25; set_alarm_scr(3,alarm_var); }
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
        sprite_delete(spr_var);
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
    spr_id_var = mod_scr(spr_id_var+(spr_spd_var*global.delta_time_var),sprite_get_number(spr_var));
');
// Alarm 0 Event
object_event_add
(argument0,ev_alarm,0,'
    do_str_var = true;
    spr_spd_var = 0.1;
    image_alpha = 0.3;
    set_alarm_scr(1,666); // 660
    if !global.reduce_flash_var { set_alarm_scr(4,1); }
');
// Alarm 1 Event
object_event_add
(argument0,ev_alarm,1,'
    set_alarm_scr(2,fade_alarm_var);
    with instance_create(0,0,fade_eff_obj)
    {
        cam_id_var = -1;
        image_blend = c_black;
        invert_var = true;
        set_alarm_scr(0,other.fade_alarm_var);
    }
');
// Alarm 2 Event
object_event_add
(argument0,ev_alarm,2,'
    rm_goto_menu_scr(dead_rm,true);
');
// Alarm 3 Event
object_event_add
(argument0,ev_alarm,3,'
    if !irandom(1)
    { spr_id_var = irandom(sprite_get_number(spr_var)-1); }
    set_alarm_scr(3,alarm_var);
');
// Alarm 4 Event
object_event_add
(argument0,ev_alarm,4,'
    if !irandom(3)
    {
        str_var = str_binary_var;
        image_xscale = 0.5;
        image_yscale = 0.5;
    }
    else
    {
        str_var = str_main_var;
        image_xscale = 0.6;
        if !irandom(1) { image_yscale = 0.8; }
        else { image_yscale = 1.2; }
    }
    set_alarm_scr(4,1);
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    d3d_set_fog(false,c_black,0,0);
    d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
    d3d_set_hidden(false);
    draw_spr_fit_ext_scr(spr_var,floor(spr_id_var),0,0,image_alpha,image_blend,image_alpha);
    if do_str_var
    {
        draw_set_color(str_color_var); draw_set_halign(fa_center); draw_set_valign(fa_middle);
        draw_str_ext_scr(str_var,0,0,image_xscale,image_yscale,0.125,fa_center,fa_middle,-1,500,0);
        draw_set_color(c_white); draw_set_halign(fa_left); draw_set_valign(fa_top);
    }
    d3d_set_hidden(true);
');