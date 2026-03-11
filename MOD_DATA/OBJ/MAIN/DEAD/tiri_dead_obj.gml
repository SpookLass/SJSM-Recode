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
    // Path
    path_var = path_add();
    path_set_kind(path_var,1); // Smooth
    path_set_closed(path_var,false);
    path_set_precision(path_var,4);
    path_add_point(path_var,0,0,100);
    path_add_point(path_var,0,32,50);
    path_add_point(path_var,0,-192,100);
    path_add_point(path_var,0,-160,100);
    path_add_point(path_var,0,-192,50);
    path_spd_var = 4;
    fall_var = false;
    // Sprite
    load_var = true;
    spr_01_var = sprite_add(vanilla_directory_const+"\TEX\sprites\MS24_04_spr.png",4,false,false,0,0);
    sprite_set_offset(spr_01_var,sprite_get_width(spr_01_var)/2,sprite_get_height(spr_01_var)/2);
    spr_02_var = sprite_add(vanilla_directory_const+"\TEX\sprites\MS24_05_spr.png",1,false,false,0,0);
    sprite_set_offset(spr_02_var,sprite_get_width(spr_02_var)/2,sprite_get_height(spr_02_var)/2);
    // Background
    bg_var = background_add(vanilla_directory_const+"\TEX\sprites\MS24_03_spr.png",false,false);
    dead_bg_var = background_add(vanilla_directory_const+"\TEX\sprites\MS24_06_spr.png",false,false);
    image_yscale = 920;
    image_xscale = background_get_width(bg_var)*image_yscale/background_get_height(bg_var);
    cam_mult_var = 7; // 7.r1
    yaw_mult_var = image_xscale*round(cam_mult_var*360/image_xscale)/360;
    dead_y_var = 0;
    // Sound
    snd_var = fmod_snd_add_scr(main_directory_const+"\SND\DEAD\tiri_howl_snd.wav",false);
    atk_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\DEAD\tiri_atk_snd.wav",false);
    growl_snd_len_var = 2;
    growl_snd_var[0] = fmod_snd_add_scr(main_directory_const+"\SND\DEAD\tiri_growl_01_snd.wav",false);
    growl_snd_var[1] = fmod_snd_add_scr(main_directory_const+"\SND\DEAD\tiri_growl_02_snd.wav",false);
    dead_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\DEAD\tiri_dead_snd.wav",false);
    inst_var = fmod_snd_play_scr(snd_var);
    // Static
    static_spr_var = static_01_spr;
    static_spr_id_var = 0;
    static_spr_spd_var = 0;
    image_xscale = 256;
    image_alpha = 0.5;
    if !global.reduce_flash_var { static_spr_spd_var = 0.5; }
    // Red
    hp_var = 100;
    // Alarm
    alarm_len_var = 3;
    alarm_ini_scr();
    set_alarm_scr(0,400);
    alarm_state_len_var = 8;
    alarm_var[0] = 160;
    alarm_var[1] = 60;
    alarm_var[2] = 30;
    alarm_var[3] = 50;
    alarm_var[4] = 20;
    alarm_var[5] = 80;
    alarm_var[6] = 30;
    alarm_var[7] = 170;
    alarm_state_var = 0;
    do_alarm_state_var = true;
    // State
    state_var = 0;
    // Fade
    with instance_create(0,0,fade_eff_obj)
    {
        par_var = other.id;
        cam_id_var = -1;
        image_blend = c_black;
        invert_var = false;
        set_alarm_scr(0,500);
        power_var = 2; // Genuinely not sure if Kira meant to scrap this
    }
');
// Destroy
object_event_add
(argument0,ev_destroy,0,'
    event_user(0);
    instance_create(0,0,tiri_dead_02_obj)
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
        fmod_snd_free_scr(atk_snd_var);
        fmod_snd_free_scr(dead_snd_var);
        for (local.i=0; local.i<growl_snd_len_var; local.i+=1;)
        { fmod_snd_free_scr(growl_snd_var[local.i]); }
        background_delete(bg_var);
        background_delete(dead_bg_var);
        sprite_delete(spr_01_var);
        sprite_delete(spr_02_var);
        path_delete(path_var);
        load_var = false;
    }
');
// Damage Event
object_event_add
(argument0,ev_other,ev_user1,'
    if state_var <= 0
    {
        local.per = median(0,1,hp_var/100);
        local.cyan = lerp_scr(15,255,local.per);
        image_blend = make_color_rgb(255,local.cyan,local.cyan);
        if fall_var { event_user(2); }
        else if hp_var <= 0
        {
            fall_var = true;
            path_start(path_var,path_spd_var*global.delta_time_var,false,false);
        }
    }
');
// Change State Event
object_event_add
(argument0,ev_other,ev_user2,'
    if state_var <= 0
    {
        with tiri_dead_wolf_obj { if par_var == other.id { instance_destroy(); }}
        with tiri_dead_eff_obj { if par_var == other.id { instance_destroy(); }}
        with fade_eff_obj { if par_var == other.id { instance_destroy(); }}
        fmod_inst_stop_scr(inst_var);
        inst_var = fmod_snd_loop_scr(dead_snd_var);
        state_var = 1;
        if !global.reduce_flash_var
        { set_alarm_scr(2,1); }
        set_alarm_scr(0,-1);
        set_alarm_scr(1,240);
        with instance_create(0,0,fade_eff_obj)
        {
            par_var = other.id;
            cam_id_var = -1;
            image_blend = c_red;
            invert_var = false;
            set_alarm_scr(0,500);
            power_var = 2; // Genuinely not sure if Kira meant to scrap this
        }
    }
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    if global.input_press_arr[confirm_input_const,global.menu_player_var] == 1
    {
        if state_var <= 0 { event_user(2); }
        else { event_perform(ev_alarm,1); }
    }
    if global.input_press_arr[back_input_const,global.menu_player_var] == 1
    { event_perform(ev_alarm,1); }
    if state_var > 0 { static_spr_id_var = mod_scr(static_spr_id_var+(static_spr_spd_var*global.delta_time_var),sprite_get_number(static_spr_var)); }
    else if fall_var { path_speed = path_spd_var*global.delta_time_var; }
    else
    {
        x = deg_normal_scr(x+input_yaw_scr(global.menu_player_var));
        if global.input_cam_var[global.menu_player_var] == cam_mouse_const && !global.mouse_free_var
        { display_mouse_set(display_get_width()/2,display_get_height()/2); }
    }
    
');
// Alarm 0 Event
object_event_add
(argument0,ev_alarm,0,'
    with instance_create(x+random_range(-90,90),8,tiri_dead_wolf_obj) // 368
    {
        inst_var = fmod_snd_play_scr(other.growl_snd_var[irandom(other.growl_snd_len_var-1)]);
        par_var = other.id;
        spr_var = other.spr_01_var;
        snd_var = other.atk_snd_var;
    }
    if do_alarm_state_var
    {
        set_alarm_scr(0,alarm_var[alarm_state_var]);
        alarm_state_var = mod_scr(alarm_state_var+1,alarm_state_len_var);
    }
    else { set_alarm_scr(0,alarm_var[irandom(alarm_state_len_var-1)]); }
');
// Alarm 1 Event
object_event_add
(argument0,ev_alarm,1,'
    rm_goto_menu_scr(dead_rm);
');
// Alarm 2 Event
object_event_add
(argument0,ev_alarm,2,'
    dead_y_var = random_range(-2,2);
    set_alarm_scr(2,1);
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    d3d_set_fog(false,c_black,0,0);
    d3d_set_projection_ortho(0,0,view_wview[view_current],view_hview[view_current],0);
    d3d_set_hidden(false);
    if state_var > 0
    {
        draw_bg_fit_scr(dead_bg_var,0,dead_y_var);
        draw_spr_tiled_stretch_ext_scr(static_spr_var,floor(static_spr_id_var),0,0,image_xscale,0,2,image_angle,image_blend,image_alpha);
    }
    else
    {
        local.xtmp = x*yaw_mult_var;
        draw_bg_tiled_stretch_ext_scr(bg_var,local.xtmp,y,920,1,0,image_angle,image_blend,image_alpha);
        with tiri_dead_wolf_obj
        {
            local.xtmp = deg_normal_scr(other.x-x)*other.yaw_mult_var;
            draw_spr_stretch_ext_scr(spr_var,floor(spr_id_var),local.xtmp,y+other.y,image_yscale,1,fa_center,fa_middle,image_angle,other.image_blend,image_alpha);
        }
        with tiri_dead_eff_obj
        {
            local.xtmp = deg_normal_scr(other.x-x)*other.yaw_mult_var;
            draw_spr_stretch_ext_scr(spr_var,0,local.xtmp,y+other.y,image_yscale,1,fa_center,fa_middle,image_angle,other.image_blend,image_alpha);
        }
    }
    d3d_set_hidden(true);
');