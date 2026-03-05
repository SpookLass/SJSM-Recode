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
    str_var = string_replace_all(ini_read_string("DEAD","dl","DEAD_dl"),"@l","
");
    ini_close();
    // Assets
    load_var = true;
    spr_01_var = execute_file(main_directory_const+"\SPR\DEAD\dl_dead_spr.gml",main_directory_const+"\SPR\DEAD\dl_dead_spr.png");
    local.spr = main_directory_const+"\SPR\MON\dl_eff_0"+string(irandom_range(1,2))+"_spr";
    spr_02_var = execute_file(local.spr+".gml",local.spr+".png");
    snd_01_var = fmod_snd_add_scr(main_directory_const+"\SND\MON\dl_mus_snd.mp3");
    local.snd = main_directory_const+"\SND\MON\dl_eff_0"+string(irandom_range(1,4))+"_snd.wav";
    snd_02_var = fmod_snd_add_scr(local.snd);
    // Sprite
    spr_id_var = 0;
    spr_spd_var = 1;
    if global.reduce_flash_var { spr_spd_var = 0; }
    // Text
    x = 100;
    y = 100;
    image_xscale = 0.6;
    image_yscale = 0.6;
    halign_var = fa_left;
    valign_var = fa_top;
    scale_min_var = 0.125;
    // Sound
    load_var = true;
    fmod_snd_loop_scr(snd_01_var);
    // Alarms
    state_var = 0;
    alarm_len_var = 4;
    alarm_ini_scr();
    fade_alarm_var = 60;
    set_alarm_scr(0,80);
    // Flash
    with instance_create(0,0,spr_flash_eff_obj)
    {
        par_var = other.id;
        spr_var = other.spr_02_var;
        spr_id_var = irandom(sprite_get_number(spr_var)-1);
        spr_spd_var = 1;
        do_snd_var = true;
        snd_var = fmod_snd_play_scr(other.snd_02_var);
        rand_rate_var = 15;
        set_alarm_scr(0,60);
        // Set camera to all
        cam_id_var = -1;
    }
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    if global.input_press_arr[confirm_input_const,global.menu_player_var] == 1
    || global.input_press_arr[back_input_const,global.menu_player_var] == 1
    { event_perform(ev_alarm,2); }
    if !state_var { spr_id_var = (spr_id_var+(spr_spd_var*global.delta_time_var)) mod sprite_get_number(spr_01_var); }
');
// Alarm 0 Event
object_event_add
(argument0,ev_alarm,0,'
    state_var = 1;
    instance_create(0,0,static_dead_obj);
    if !global.reduce_flash_var
    { set_alarm_scr(3,1); }
    set_alarm_scr(1,660);
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
    if !irandom(2) { image_blend = c_red; }
    else { image_blend = c_white; }
    set_alarm_scr(3,1);
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
        fmod_snd_free_scr(snd_01_var);
        fmod_snd_free_scr(snd_02_var);
        sprite_delete(spr_01_var);
        sprite_delete(spr_02_var);
        load_var = false;
    }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    d3d_set_fog(false,c_black,0,0);
    d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
    d3d_set_hidden(false);
    if !state_var { draw_sprite_stretched_ext(spr_01_var,floor(spr_id_var),0,0,view_wview[view_current],view_hview[view_current],c_white,1); }
    else
    {
        draw_set_alpha(image_alpha); draw_set_color(image_blend);
        draw_str_scr(str_var,x,y,image_xscale,image_yscale,scale_min_var,halign_var,valign_var,image_angle);
        draw_set_alpha(1); draw_set_color(c_white);
    }
    d3d_set_hidden(true);
');