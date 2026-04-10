// Builtin Variables
object_set_depth(argument0,-3);
object_set_mask(argument0,noone);
object_set_parent(argument0,echidna_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Begin Event
object_event_add
(argument0,ev_create,1,'
    ini_open(global.lang_var);
    name_var = translate_mon_str_scr("body",global.name_var);
    wake_snd_var[2] = string_replace(ini_read_string("SUB","body","SUB_body"),"@n",name_var); wake_snd_var[3] = false;
    ini_close();
    // Variables
    type_var = 1;
    spd_base_var = 0.8;
    spr_spd_var = 1;
    dur_var = irandom_range(10,15);
    delay_var = 180;
    dmg_var = 20;
    dmg_alarm_var = 60;
    w_var = 11;
    h_var = 28.9;
    eye_h_var = 24.8;
    dupe_var = dupe_canon_const;
    blood_spr_var = blood_kh_spr;
    atk_range_var = 48;
    dead_rm_var = body_dead_rm;
    // Sound
    wake_snd_var[0] = true;
    mus_prio_var = theme_mus_prio_const;
    // Assets
    // Search for existing assets to save memory
    local.loaded = false;
    with object_index
    {
        if id != other.id && object_index == other.object_index
        {
            other.mdl_var = mdl_var;
            other.bg_var = bg_var;
            other.spr_overlay_var = spr_overlay_var;
            other.spr_eff_var = spr_eff_var;
            other.eff_snd_var = eff_snd_var;
            other.mus_snd_var = mus_snd_var;
            other.wake_snd_var[1] = wake_snd_var[1];
            local.loaded = true;
            break;
        }
    }
    // If no existing assets were found, load them
    if !local.loaded
    {
        spr_overlay_var = sprite_add(kh_directory_const+"\TEX\sprites\HOS_ex6.png",4,false,false,0,0);
        spr_eff_var = sprite_add(kh_directory_const+"\TEX\sprites\HOS_ex7.png",8,false,false,0,0);
        mdl_var = d3d_model_create();
        d3d_model_load(mdl_var,main_directory_const+"\MDL\MON\bodybag_mon_mdl.gmmod");
        bg_var = background_add(main_directory_const+"\BG\MON\bodybag_bg.png",false,false);
        eff_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\MON\bodybag_eff_snd.wav");
        fmod_snd_set_group_scr(eff_snd_var,snd_group_mon_const);
        wake_snd_var[1] = fmod_snd_add_scr(main_directory_const+"\SND\MON\bodybag_wake_snd.wav");
        switch global.old_theme_var
        {
            case 1:
            {
                mus_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\MON\bodybag_mus_snd.mp3");
                fmod_snd_set_loop_point_scr(mus_snd_var,16/112,32/112);
                break;
            }
            case 2:
            {
                mus_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\MON\ROMM\body_rom_mus_snd.ogg");
                break;
            }
            default:
            {
                mus_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\MON\bodybag_mus_snd.mp3");
                fmod_snd_set_loop_point_scr(mus_snd_var,16/112,110/112);
                break;
            }
        }
        fmod_snd_set_group_scr(mus_snd_var,snd_group_mus_const);
    }
    tex_var = background_get_texture(bg_var);
    // Sounds
    snd_len_var = -1;
    // Special
    mdl_yaw_var = 0;
    mdl_pitch_var = 90;
    shake_var = 0.1;
    inf_stam_var = true;
    spin_var = false;
    spin_rate_var = 5;
    atk_spawn_delay_var = 0;
    // Effects
    eff_fade_var = false;
    eff_delay_var = 60;
    strobe_var = true;
    // Behavior
    if global.body_type_var == -1 { local.type = irandom(5); }
    else { local.type = global.body_type_var; }
    switch local.type
    {
        case 5: // Speen!!!
        { spin_var = true; }
        case 0: // Mod
        {
            spd_base_var = 1.875; // 1.25*2.5/1.66
            do_acc_var = true;
            acc_var = 0.1;
            frick_var = 0.05;
            delay_var = 90;
            atk_spawn_delay_var = 90;
            shake_var = 0.32;
            eff_fade_var = true;
            strobe_var = false;
            atk_range_var = global.mon_coll[2];
            // dmg_var = 30; // 20
            // Autobrake
            autobrake_var = true;
            autobrake_spd_var = 1;
            autobrake_dir_var = 60;
            break;
        }
        case 4: // Old HD
        { type_var = 2; }
        case 2: // HD
        {
            inf_stam_var = false;
            atk_spawn_delay_var = 90;
        }
        case 3: // KH HD
        {
            spd_base_var = 56/45; // 1.2r4
            do_acc_var = true;
            acc_var = 16/675; // 0.02r370
            frick_var = acc_var;
            dmg_var = 45;
            delay_min_var = 90;
            delay_max_var = 180;
            shake_var = 0.32;
            eff_delay_var = 0;
            strobe_var = false;
            atk_range_var = 32;
            // Autobrake (close enough)
            autobrake_var = true;
            autobrake_spd_var = 0;
            autobrake_dir_var = 60;
            break;
        }
    }
    // Alarms
    alarm_len_var = 9;
    alarm_ini_scr();
    // Bools
    do_mdl_var = true;
    do_snd_var = false;
');
// Create End Event
object_event_add
(argument0,ev_create,2,'
    event_inherited();
    if eff_delay_var > 0 { set_alarm_scr(8,eff_delay_var); }
');
// Destroy Event
object_event_add
(argument0,ev_destroy,0,'
    event_inherited();
    local.bool = false;
    with object_index { if id != other.id && object_index == other.object_index { local.bool = true; break; }}
    if !local.bool
    {
        fmod_snd_free_scr(mus_snd_var);
        background_delete(bg_var);
        d3d_model_destroy(mdl_var);
        sprite_delete(spr_eff_var);
        sprite_delete(spr_overlay_var);
        fmod_snd_free_scr(wake_snd_var[1]);
        fmod_snd_free_scr(eff_snd_var);
    }
    if inf_stam_var
    { with player_obj { if !dead_var { do_stam_var = true; }}}
    with spr_flash_eff_obj
    { if par_var == other.id { instance_destroy(); }}
    with body_eff_obj
    { if par_var == other.id { instance_destroy(); }}
');
// Effect alarm
object_event_add
(argument0,ev_alarm,8,'
    if inf_stam_var
    { with player_obj { if !dead_var { do_stam_var = false; }}}
    with instance_create(0,0,spr_flash_eff_obj)
    {
        par_var = other.id;
        spr_var = other.spr_eff_var;
        spr_id_var = irandom(sprite_get_number(spr_var)-1);
        spr_spd_var = 0.5;
        do_snd_var = true;
        inst_var = fmod_snd_play_scr(other.eff_snd_var);
        rand_rate_var = 2;
        rand_chance_var = 2;
        fade_var = other.eff_fade_var;
        set_alarm_scr(0,60);
        // Set camera to player
        cam_id_var = -1;
    }
');
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,'
    event_inherited();
    if inf_stam_var
    { with player_obj { if !dead_var { do_stam_var = false; }}}
    if !instance_exists(body_eff_obj)
    {
        with instance_create(0,0,body_eff_obj)
        {
            par_var = other.id;
            spr_var = other.spr_overlay_var;
            strobe_var = other.strobe_var;
        }
    }
');
// Animation
object_event_add
(argument0,ev_other,ev_user1,'
    if spin_var { mdl_yaw_var += spin_rate_var*global.delta_time_var; }
    else { mdl_yaw_var = yaw_var+180; }
    spr_prog_var -= spr_spd_var*global.delta_time_var;
    if spr_prog_var <= 0
    {
        spr_prog_var = 1;
        x_off_var = random_range(-shake_var,shake_var);
        y_off_var = random_range(-shake_var,shake_var);
        z_off_var = random_range(-shake_var,shake_var);
    }
');
// Attack Success
object_event_add
(argument0,ev_other,ev_user3,'
    event_inherited();
    if atk_spawn_delay_var > 0
    {
        on_var = false;
        // Reset Position
        yaw_var = global.spawn_arr[0,3];
        x = global.spawn_arr[0,0];
        y = global.spawn_arr[0,1];
        z = global.spawn_arr[0,2];
        set_motion_3d_scr(0,true,yaw_var,true,0,true);
        // Set target
        event_user(6);
        // Delay
        set_alarm_scr(0,atk_spawn_delay_var);
        // Effect
        with instance_create(0,0,spr_flash_eff_obj)
        {
            spr_var = other.spr_eff_var;
            spr_id_var = irandom(sprite_get_number(spr_var)-1);
            spr_spd_var = 0.5;
            do_snd_var = true;
            inst_var = fmod_snd_play_scr(other.eff_snd_var);
            rand_rate_var = 2;
            rand_chance_var = 2;
            fade_var = other.eff_fade_var;
            set_alarm_scr(0,60);
            // Set camera to player
            cam_id_var = other.atk_target_var.cam_id_var;
        }
    }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if (on_var || visible_var) && (!possess_var || cam_id_var != view_current || global.reflect_var)
    {
        draw_set_color(image_blend); draw_set_alpha(image_alpha);
        d3d_transform_set_identity();
        d3d_transform_add_rotation_y(mdl_pitch_var);
        d3d_transform_add_rotation_z(mdl_yaw_var);
        d3d_transform_add_translation(x+x_off_var,y+y_off_var,z+z_off_var);
        // Reflection Handing
        if global.reflect_var
        {
            switch (global.reflect_axis_var)
            {
                case 0: { d3d_transform_add_scaling(-1,1,1); d3d_transform_add_translation(global.reflect_pos_var,0,0); break; }
                case 1: { d3d_transform_add_scaling(1,-1,1); d3d_transform_add_translation(0,global.reflect_pos_var,0); break; }
                case 2: { d3d_transform_add_scaling(1,1,-1); d3d_transform_add_translation(0,0,global.reflect_pos_var); break; }
            }
        }
        d3d_model_draw(mdl_var,0,0,0,tex_var);
        d3d_transform_set_identity();
        draw_set_color(c_white); draw_set_alpha(1);
        if global.debug_var
        {
            d3d_set_hidden(false);
            if path_exists(path_var)
            { draw_path(path_var,x,y,false); }
            d3d_set_hidden(true);
            // mp_grid_draw(grid_var);
        }
    }
');