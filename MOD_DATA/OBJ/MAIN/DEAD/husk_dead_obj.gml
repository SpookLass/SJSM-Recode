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
    load_var = true;
    // String
    ini_open(global.lang_var);
    str_var = string_replace_all(ini_read_string("DEAD","husk","DEAD_husk"),"@l","
");
    ini_close();
    str_alpha_var = 0.6;
    str_alpha_min_var = 0.2;
    str_alpha_max_var = 0.25;
    str_xscale_var = 0.5;
    str_yscale_var = 1;
    str_yscale_min_var = 1;
    str_yscale_max_var = 1.01;
    str_x_var = 0;
    str_y_var = (string_height(str_var)*str_yscale_var*0.5)-160;
    // Sprite
    spr_var = sprite_add(dh_directory_const+"\TEX\sprites\NPC1D_SPR.png",4,false,false,0,0);
    spr_rate_var = 36;
    spr_time_var = 0;
    spr_id_var = 0;
    // Sound
    snd_var = fmod_snd_add_scr(main_directory_const+"\SND\DH\husk_dead_snd.mp3",false);
    inst_var = fmod_snd_loop_scr(snd_var);
    // Path
    path_var = path_add();
    path_set_kind(path_var,1); // Smooth
    path_set_closed(path_var,true);
    path_set_precision(path_var,4);
    path_add_point(path_var,-27,-28,100); // 1 1
    path_add_point(path_var,-20,-16,100); // 8 13
    path_add_point(path_var,-12,-20,100); // 16 9
    path_add_point(path_var,-8,0,100); // 20 29
    path_add_point(path_var,-4,-16,100); // 24 13
    path_add_point(path_var,-20,-28,100); // 8 1
    path_add_point(path_var,-16,-4,100); // 12 25
    path_add_point(path_var,0,-8,100); // 28 21
    path_add_point(path_var,0,-24,100); // 28 5
    path_spd_var = 8;
    // Static
    static_spr_var = static_01_spr;
    static_xscale_var = 512;
    static_yscale_var = 512;
    static_x_var = random(static_xscale_var);
    static_y_var = random(static_yscale_var);
    // State
    state_var = 0;
    // Alpha
    alpha_time_var=0;
    alpha_rate_var=200;
    alpha_rate_min_var = 0.5;
    alpha_rate_max_var = 1;
    image_alpha = 0;
    // Sine
    unsmooth_var = false;
    // Type
    flash_alarm_var = 60;
    if global.husk_type_var == -1 { local.type = irandom(2); }
    else { local.type = global.husk_type_var; }
    switch local.type
    {
        case 1:
        {
            flash_alarm_var = 38;
            break;
        }
    }
    // Alarms
    alarm_len_var = 4;
    alarm_ini_scr();
    set_alarm_scr(0,38);
    if !global.reduce_flash_var
    {
        set_alarm_scr(2,1);
        set_alarm_scr(3,flash_alarm_var);
    }
    fade_alarm_var = 5;
    // Fade
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
        sprite_delete(spr_var);
        path_delete(path_var);
        fmod_snd_free_scr(snd_var);
        load_var = false;
    }
');
// Alarm 0
object_event_add
(argument0,ev_alarm,0,'
    if !state_var
    {
        state_var = 1;
        path_start(path_var,1,1,true);
        set_alarm_scr(0,387);
        str_alpha_var = random_range(str_alpha_min_var,str_alpha_max_var);
    }
    else
    {
        // Fade
        with instance_create(0,0,fade_eff_obj)
        {
            cam_id_var = -1;
            image_blend = c_red;
            set_alarm_scr(0,other.fade_alarm_var);
            invert_var = true;
        }
        set_alarm_scr(1,fade_alarm_var);
    }
');
// Alarm 1
object_event_add
(argument0,ev_alarm,1,'
    rm_goto_menu_scr(dead_rm,true);
');
// Alarm 2
object_event_add
(argument0,ev_alarm,2,'
    static_x_var = random(static_xscale_var);
    static_y_var = random(static_yscale_var);
    str_yscale_var = random_range(str_yscale_min_var,str_yscale_max_var);
    if state_var { str_alpha_var = random_range(str_alpha_min_var,str_alpha_max_var); }
    set_alarm_scr(2,1);
');
// Alarm 3
object_event_add
(argument0,ev_alarm,3,'
    // Flash... why is this here? Doesnt even coincide with the state change
    if !global.reduce_flash_var
    {
        with instance_create(0,0,flash_eff_obj)
        {
            image_blend = c_red; 
            set_alarm_scr(0,1);
            cam_id_var = -1;
        }
    }
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if global.input_press_arr[confirm_input_const,global.menu_player_var] == 1
    || global.input_press_arr[back_input_const,global.menu_player_var] == 1
    { event_perform(ev_alarm,1); }
    if state_var
    {
        // Alpha
        alpha_time_var = mod_scr(alpha_time_var+(random_range(alpha_rate_min_var,alpha_rate_max_var)*global.delta_time_var),alpha_rate_var);
        local.alpha = cos(2*alpha_time_var*pi/alpha_rate_var);
        if unsmooth_var { local.alpha = arccos(local.alpha)/pi; }
        else { local.alpha = (-local.alpha+1)*0.5; }
        image_alpha = local.alpha;
        // Sprite
        spr_time_var = mod_scr(spr_time_var+global.delta_time_var,spr_rate_var);
        local.sprid = cos(2*spr_time_var*pi/spr_rate_var);
        if unsmooth_var { local.sprid = arccos(local.sprid)/pi; }
        else { local.sprid = (-local.sprid+1)*0.5; }
        spr_id_var = (local.sprid*(sprite_get_number(spr_var)-1))+0.5;
    }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if state_var
    {
        local.viewscale = min(view_wview[view_current]/1280,view_hview[view_current]/720);
        local.xtmp = x*local.viewscale;
        local.ytmp = y*local.viewscale;
        draw_sprite_stretched_ext(spr_var,floor(spr_id_var),local.xtmp,local.ytmp,view_wview[view_current]-local.xtmp,view_hview[view_current]-local.ytmp,image_blend,image_alpha);
    }
    draw_set_halign(fa_center); draw_set_valign(fa_middle); draw_set_alpha(str_alpha_var);
    draw_str_scr(str_var,str_x_var,str_y_var,str_xscale_var,str_yscale_var,0.125,fa_center,fa_middle,0);
    draw_set_halign(fa_left); draw_set_valign(fa_top); draw_set_alpha(1);
    draw_spr_tiled_scale_ext_scr(static_spr_var,0,static_x_var,static_y_var,static_xscale_var,static_yscale_var,2,0,c_white,0.4);
');