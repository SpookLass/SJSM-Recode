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
    menu_bg_var = background_add(vanilla_directory_const+"\TEX\menu\menu4_tex.png",false,false);
    bg_var = background_add(main_directory_const+"\BG\DEAD\dead_bg.png",false,false);
    fade_spr_var = execute_file(main_directory_const+"\SPR\UI\static_fade_spr.gml",main_directory_const+"\SPR\UI\static_fade_spr.png");
    snd_var = fmod_snd_add_scr(main_directory_const+"\SND\DEAD\dead_snd.wav");
    fake_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\DEAD\wf_static_snd.wav");
    load_var = true;
    // Translation
    ini_open(global.lang_var);
    str_var = ini_read_string("DEAD","fake","DEAD_fake");
    ini_close();
    // Fade in
    fade_spr_spd_var = 0.1;
    fade_spr_id_var = 0;
    // String
    do_str_var = false;
    str_scale_var = 1;
    margin_var = 64;
    // Alarms
    alarm_len_var = 2;
    alarm_ini_scr();
    set_alarm_scr(0,74);
    // Main
    x_spd_var = 80;
    y_spd_var = -2;
    image_xscale = 256;
    image_yscale = 1024;
    image_alpha = 0.3;
    // Sound
    inst_var = fmod_snd_play_scr(snd_var);
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    if global.input_press_arr[interact_input_const,global.menu_player_var] == 1
    || global.input_press_arr[back_input_const,global.menu_player_var] == 1
    || global.input_press_arr[pause_input_const,global.menu_player_var] == 1
    { event_perform(ev_alarm,1); }
    if do_str_var && alarm_arr[1,0] > 0 { str_prog_var = 1-(alarm_arr[1,0]/alarm_arr[1,1]); }
    if fade_spr_id_var < sprite_get_number(fade_spr_var) { fade_spr_id_var += fade_spr_spd_var*global.delta_time_var; }
    x = mod_scr(x+x_spd_var,image_xscale);
    y = mod_scr(y+y_spd_var,image_yscale);
');
// Alarm 0
object_event_add
(argument0,ev_alarm,0,'
    fmod_inst_stop_scr(inst_var);
    fmod_snd_play_scr(fake_snd_var);
    do_str_var = true;
    global.rm_name_var = str_var;
    set_alarm_scr(1,40);
');
// Alarm 0
object_event_add
(argument0,ev_alarm,1,'
    global.res_override_var = true;
    global.res_override_w_var = 640;
    global.res_override_h_var = 480;
    rm_goto_menu_scr(wf_dead_load_rm);
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
        background_delete(menu_bg_var);
        background_delete(bg_var);
        sprite_delete(fade_spr_var);
        fmod_snd_free_scr(snd_var);
        fmod_snd_free_scr(fake_snd_var);
        load_var = false;
    }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    d3d_set_fog(false,c_black,0,0);
    d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
    d3d_set_hidden(false);
    if do_str_var
    {
        draw_set_halign(fa_center); draw_set_valign(fa_middle);
        draw_str_ext_outline_scr(str_var,0,0,str_scale_var,str_scale_var,0.125,fa_center,fa_middle,-1,margin_var,4,4,c_black,c_red,1,8);
        draw_set_halign(fa_left); draw_set_valign(fa_top);
    }
    else
    {
        draw_bg_fit_scr(menu_bg_var,0,0);
        draw_bg_tiled_scale_ext_scr(bg_var,x,y,image_xscale,image_yscale,2,image_angle,image_blend,image_alpha);
        if fade_spr_id_var < sprite_get_number(fade_spr_var) { draw_spr_tiled_scale_scr(fade_spr_var,floor(fade_spr_id_var),0,0,64,192,2); }
    }
    d3d_set_hidden(true);
');