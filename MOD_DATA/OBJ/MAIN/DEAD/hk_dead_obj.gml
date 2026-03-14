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
    // Path
    path_var = path_add();
    path_set_kind(path_var,1); // Smooth
    path_set_closed(path_var,false);
    path_set_precision(path_var,4);
    path_add_point(path_var,0,0,30);
    path_add_point(path_var,0,32,80);
    path_add_point(path_var,0,-160,120);
    path_add_point(path_var,0,-720,160);
    path_add_point(path_var,0,-688,80);
    path_spd_var = 8;
    fall_var = false;
    // String
    ini_open(global.lang_var);
    str_var = string_replace_all(ini_read_string("DEAD","hk","DEAD_hk"),"@l","
");
    ini_close();
    str_alpha_var = 0.4;
    str_visible_var = true;
    str_xscale_var = 0.6;
    str_yscale_var = 0.6; // Height equals 576 times scale
    // Sprites
    spr_01_var = sprite_add(dh_directory_const+"\TEX\sprites\HK_SPR3.png",11,false,false,0,0);
    sprite_set_offset(spr_01_var,sprite_get_width(spr_01_var)*0.5,sprite_get_height(spr_01_var)*0.5);
    spr_02_var = sprite_add(dh_directory_const+"\TEX\sprites\HK_SPR4.png",9,false,false,0,0);
    sprite_set_offset(spr_02_var,sprite_get_width(spr_02_var)*0.5,sprite_get_height(spr_02_var)*0.5);
    spr_spd_01_var = 0.6;
    spr_alpha_01_var = 0.5;
    spr_id_01_var = 0;
    spr_id_02_var = 0;
    spr_yscale_01_var = 720;
    spr_yscale_02_var = 720;
    spr_xscale_base_02_var = sprite_get_width(spr_02_var)*spr_yscale_02_var/sprite_get_height(spr_02_var);
    spr_xscale_02_var = spr_xscale_base_02_var;
    spr_x_02_var = 0;
    // Backgrounds
    bg_var = background_add(dh_directory_const+"\TEX\sprites\HK_SPR5.png",false,false);
    static_bg_var = background_add(main_directory_const+"\BG\DH\tile_static_bg.png",false,false);
    bg_yscale_var = 1440;
    x = 0;
    y = -32;
    static_alpha_var = 0.1;
    static_xscale_var = 128;
    static_yscale_var = 128;
    static_x_var = random(static_xscale_var);
    static_y_var = random(static_yscale_var);
    // Sound
    snd_var = fmod_snd_add_scr(main_directory_const+"\SND\DH\hk_dead_snd.mp3");
    atk_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\DH\hk_atk_snd.wav");
    fmod_snd_loop_scr(snd_var);
    inst_var = noone;
    // Red
    red_alpha_var = 0;
    // State Handling
    state_var = 0;
    state_len_var = 10;
    substate_var = 0;
    alarm_var[0] = 90; // Wait
    alarm_var[1] = 90; // Hooked Doll
    alarm_var[2] = 28; // Hook 1
    alarm_var[3] = 60; // Damage
    alarm_var[4] = 28; // Hook 2
    alarm_var[5] = 30; // Damage
    alarm_var[6] = 28; // Hook 3
    alarm_var[7] = 60; // Damage
    alarm_var[8] = 90; // Fall
    alarm_var[9] = 30; // Fade Out
    substate_arr_var[0] = 0; // Nothing
    substate_arr_var[1] = 1; // Hooked Doll
    substate_arr_var[2] = 2; // Hook 1
    substate_arr_var[3] = 3; // Damage 1
    substate_arr_var[4] = 2; // Hook 2
    substate_arr_var[5] = 3; // Damage 2
    substate_arr_var[6] = 2; // Hook 3
    substate_arr_var[7] = 3; // Damage 3
    substate_arr_var[8] = 4; // Fall
    substate_arr_var[9] = 5; // Fade Out
    spr_x_02_arr_var[0] = 0;
    spr_x_02_arr_var[1] = 0;
    spr_x_02_arr_var[2] = 0;
    spr_x_02_arr_var[3] = 0;
    spr_x_02_arr_var[4] = 250;
    spr_x_02_arr_var[5] = 250;
    spr_x_02_arr_var[6] = -128;
    spr_x_02_arr_var[7] = -128;
    spr_x_02_arr_var[8] = 0;
    spr_x_02_arr_var[9] = 0;
    spr_xscale_02_arr_var[0] = 1;
    spr_xscale_02_arr_var[1] = 1;
    spr_xscale_02_arr_var[2] = 1;
    spr_xscale_02_arr_var[3] = 1;
    spr_xscale_02_arr_var[4] = -1;
    spr_xscale_02_arr_var[5] = -1;
    spr_xscale_02_arr_var[6] = 1.1;
    spr_xscale_02_arr_var[7] = 1.1;
    spr_xscale_02_arr_var[8] = 1;
    spr_xscale_02_arr_var[9] = 1;
    // Alarm
    alarm_len_var = 2;
    alarm_ini_scr();
    set_alarm_scr(0,alarm_var[state_var]);
    if !global.reduce_flash_var { set_alarm_scr(1,1); }
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
        background_delete(bg_var);
        background_delete(static_bg_var);
        sprite_delete(spr_01_var);
        sprite_delete(spr_02_var);
        fmod_snd_free_scr(snd_var);
        fmod_snd_free_scr(atk_snd_var);
        load_var = false;
    }
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if global.input_press_arr[confirm_input_const,global.menu_player_var] == 1
    || global.input_press_arr[back_input_const,global.menu_player_var] == 1
    { rm_goto_menu_scr(dead_rm,true); }
    switch substate_var
    {
        // Hooked Doll
        case 1:
        {
            spr_id_01_var += spr_spd_01_var*global.delta_time_var;
            if spr_id_01_var >= sprite_get_number(spr_01_var) { substate_var = 0; }
            break;
        }
        // Hook
        case 2:
        {
            if alarm_arr[0,0] > 0
            {
                local.per = alarm_arr[0,0]/alarm_arr[0,1];
                spr_id_02_var = lerp_scr(sprite_get_number(spr_02_var),0,local.per);
            }
            break;
        }
        // Fall
        case 4: { path_speed = path_spd_var*global.delta_time_var; break; }
    }
');
// Alarm 0
object_event_add
(argument0,ev_alarm,0,'
    state_var += 1;
    if state_var < state_len_var
    {
        substate_var = substate_arr_var[state_var];
        switch substate_var
        {
            // Hooked Doll
            case 1:
            {
                spr_id_01_var = 0;
                break;
            }
            // Hook
            case 2:
            {
                spr_id_02_var = 0;
                spr_x_02_var = spr_x_02_arr_var[state_var];
                spr_xscale_02_var = spr_xscale_base_02_var*spr_xscale_02_arr_var[state_var];
                inst_var = fmod_snd_play_scr(atk_snd_var);
                break;
            }
            // Damage
            case 3: 
            {
                spr_id_02_var = sprite_get_number(spr_02_var)-1;
                if !global.reduce_flash_var
                {
                    with instance_create(0,0,flash_eff_obj)
                    {
                        image_blend = c_red;
                        set_alarm_scr(0,1);
                        cam_id_var = -1;
                    }
                }
                red_alpha_var += 0.18;
                fmod_inst_stop_scr(inst_var);
                fmod_snd_play_scr(claw_snd);
                break;
            }
            // Fall
            case 4:
            {
                path_start(path_var,path_spd_var*global.delta_time_var,false,false);
                break;
            }
            // Fade
            case 5:
            {
                with instance_create(0,0,fade_eff_obj)
                {
                    cam_id_var = -1;
                    image_blend = c_black;
                    invert_var = true;
                    set_alarm_scr(0,other.alarm_var[other.state_var]);
                }
                break;
            }
        }
        set_alarm_scr(0,alarm_var[state_var]);
    }
    else { rm_goto_menu_scr(dead_rm,true); }
');
// Alarm 1
object_event_add
(argument0,ev_alarm,1,'
    if substate_var == 2
    {
        str_visible_var = frac_chance_scr(5,19);
        str_alpha_var = random(0.4);
        str_yscale_var = random_range(0.6,1);
    }
    static_x_var = random(static_xscale_var);
    static_y_var = random(static_yscale_var);
    set_alarm_scr(1,1);
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    draw_bg_stretch_scr(bg_var,x,y,bg_yscale_var,1);
    switch substate_var
    {
        // Hooked Doll
        case 1: { draw_spr_stretch_ext_scr(spr_01_var,floor(spr_id_01_var),0,0,spr_yscale_01_var,1,fa_center,fa_middle,0,c_white,spr_alpha_01_var); break; }
        // Hook
        case 2:
        {
            if str_visible_var // String
            {
                draw_set_halign(fa_center); draw_set_valign(fa_middle); draw_set_alpha(str_alpha_var);
                draw_str_scr(str_var,0,-59.2,str_xscale_var,str_yscale_var,0.125,fa_center,fa_middle,0);
                draw_set_halign(fa_left); draw_set_valign(fa_top); draw_set_alpha(1);
            }
            // Hook
            draw_spr_scale_scr(spr_02_var,floor(spr_id_02_var),spr_x_02_var,0,spr_xscale_02_var,spr_yscale_02_var,fa_center,fa_middle);
            break;
        }
    }
    draw_set_color(c_red) draw_set_alpha(red_alpha_var);
    draw_rectangle(0,0,view_wview[view_current],view_hview[view_current],false);
    draw_set_color(c_white) draw_set_alpha(1);
    draw_bg_tiled_scale_ext_scr(static_bg_var,static_x_var,static_y_var,static_xscale_var,static_yscale_var,2,0,c_white,static_alpha_var);
');