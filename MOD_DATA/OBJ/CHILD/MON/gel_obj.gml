// Builtin Variables
object_set_depth(argument0,-3);
object_set_mask(argument0,noone);
object_set_parent(argument0,echidna_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,1,'
    // Sounds
    snd_len_var = 4;
    wake_snd_var[0] = true; // Has a wake sound, otherwise itll use a normal sound
    snd_num_var = 1;
    snd_den_var = 2;
    snd_alarm_min_var = 80;
    snd_alarm_max_var = 240;
    snd_dist_min_var = 0;
    snd_dist_max_var = 600;
    // Translations
    ini_open(global.lang_var);
    name_var = translate_mon_str_scr("gel",global.name_var);
    local.sub = string_replace(ini_read_string("SUB","gel","SUB_gel"),"@n",name_var);
    for (local.i=0; local.i<snd_len_var; local.i+=1)
    { snd_arr[local.i,1] = local.sub; snd_arr[local.i,2] = false; }
    wake_snd_var[2] = local.sub; wake_snd_var[3] = false;
    slime_snd_var[2] = local.sub; slime_snd_var[3] = false;
    ini_close();
    // Variables
    type_var = 0;
    spd_base_var = 0.6;
    spr_spd_var = 1/6;
    dur_var = irandom_range(10,20);
    delay_var = 160;
    dmg_var = 45;
    dmg_alarm_var = 120;
    w_var = 10;
    h_var = 20;
    eye_h_var = 18.5;
    z_off_var = 2;
    dupe_var = dupe_canon_const;
    atk_range_var = 48;
    dead_rm_var = gel_dead_rm;
    // Coward
    do_hurt_var = 2; // Reduces duration
    hurt_die_var = 0;
    coward_var = true;
    coward_spd_var = 4/3; // 1.r3x
    hurt_alarm_var = 180;
    hurt_dur_var = 3;
    violence_var = 3;
    hurt_eff_var = false;
    // Slime
    slime_var = true;
    do_slime_spawn_var = false;
    slime_spawn_var = false;
    slime_alarm_var = 60;
    slime_anim_var = 0;
    slime_angle_var = random(360);
    slime_z_off_var = 0.15;
    slime_alpha_var = 0.8;
    slime_w_base_var = 28;
    slime_spawn_spd_mult_var = 1;
    slime_spd_mult_var = 2/3; // 0.r6x
    slime_num_var = 1;
    slime_den_var = 3;
    h_base_var = 20;
    z_off_base_var = 2;
    z_off_start_var = -h_base_var;
    // Theme
    mus_prio_var = mon_mus_prio_const;
    // Abuse
    abuse_var = 0;
    abuse_max_var = 3;
    do_abuse_var = false;
    // Assets
        // Search for existing assets to save memory
    local.loaded = false;
    with object_index
    {
        if id != other.id && object_index == other.object_index
        {
            other.spr_var = spr_var;
            other.slime_bg_var = slime_bg_var;
            other.overlay_bg_var = overlay_bg_var;
            for (local.i=0; local.i<snd_len_var; local.i+=1;)
            { other.snd_arr[local.i,0] = snd_arr[local.i,0]; }
            other.wake_snd_var[1] = wake_snd_var[1];
            other.slime_snd_var[1] = slime_snd_var[1];
            other.mus_snd_var = mus_snd_var;
            local.loaded = true;
            break;
        }
    }
        // If no existing assets were found, load them
    if !local.loaded
    {
        spr_var = sprite_add(vanilla_directory_const+"\TEX\sprites\MS_01_spr.png",5,false,false,0,0);
        slime_bg_var = background_add(main_directory_const+"\BG\MON\gel_slime_bg.png",false,false);
        overlay_bg_var = background_add(vanilla_directory_const+"\TEX\sprites\MS_02_spr.png",false,false);
        snd_arr[0,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\gel_01_snd.wav",true);
        snd_arr[1,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\gel_02_snd.wav",true);
        snd_arr[2,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\gel_03_snd.wav",true);
        snd_arr[3,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\gel_04_snd.wav",true);
        wake_snd_var[1] = fmod_snd_add_scr(main_directory_const+"\SND\MON\gel_wake_snd.wav",global.wake_3d_var);
        slime_snd_var[1] = fmod_snd_add_scr(main_directory_const+"\SND\MON\gel_wake_snd.wav",true);
        mus_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\MON\gel_mus_snd.mp3");
        fmod_snd_set_group_scr(mus_snd_var,snd_group_mus_const);
    }
    slime_tex_var = background_get_texture(slime_bg_var);
    // Behavior
    if global.gel_type_var == -1 { local.type = irandom(2); }
    else { local.type = global.gel_type_var; }
    switch local.type
    {
        case 0:
        {
            type_var = 2;
            dmg_var = 40;
            z_off_start_var = 0;
            slime_anim_var = 2;
            slime_spd_mult_var = 0.5;
            atk_range_var = global.mon_coll[2];
            // Move slower dangit
            slime_spawn_spd_mult_var = 0.5; // 0.5r3 for full accuracy
            delay_var = 0;
            // More Slime
            slime_num_var = 2;
            slime_den_var = 3;
            // Bools
            hurt_snd_var = 1;
            coward_var = false;
            do_slime_spawn_var = true;
            stun_var = 2;
            do_hurt_var = 1;
            // Abuse
            do_abuse_var = true;
            break;
        }
        case 2: // HD
        {
            dur_var = irandom_range(10,15);
            dmg_alarm_var = 180;
            delay_min_var = 60;
            delay_max_var = 180;
            slime_spd_mult_var = 0.3;
            slime_num_var = 2;
            slime_den_var = 3;
            // Movement
            type_var = 2;
            spd_base_var = 8/9; // 0.r8
            do_acc_var = true;
            acc_var = 16/675; // 0.02r370
            frick_var = acc_var;
            // Attack (I Hope)
            atk_type_var = 2;
            atk_delay_var = 30;
            atk_range_var = 32; // 16 radius
            atk_end_delay_var = dmg_alarm_var;
            atk_dist_var = 15;
            // Sound
            snd_alarm_min_var = 90;
            snd_alarm_max_var = 240;
            snd_den_var = 1;
            snd_dist_max_var = 500;
            // Bools
            hurt_snd_var = 2;
            coward_var = false;
            do_slime_spawn_var = true;
            stun_var = 2;
            do_hurt_var = 1;
            violence_var = 2;
            hurt_eff_var = true;
            slime_snd_var[0] = true;
            // Autobrake (close enough)
            autobrake_var = true;
            autobrake_spd_var = 0;
            autobrake_dir_var = 60;
            break;
        }
    }
    alarm_len_var = 9;
    alarm_ini_scr();
');
// Destroy Event
object_event_add
(argument0,ev_destroy,0,'
    event_inherited();
    local.bool = false;
    with object_index { if id != other.id && object_index == other.object_index { local.bool = true; break; }}
    if !local.bool
    {
        sprite_delete(spr_var);
        background_delete(slime_bg_var);
        background_delete(overlay_bg_var);
        for (local.i=0; local.i<snd_len_var; local.i+=1;)
        { fmod_snd_free_scr(snd_arr[local.i,0]); }
        fmod_snd_free_scr(wake_snd_var[1]);
        fmod_snd_free_scr(slime_snd_var[1]);
        fmod_snd_free_scr(mus_snd_var);
    }
    with slime_obj { if par_var == other.id { instance_destroy(); }}
');
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,'
    event_inherited();
    if do_slime_spawn_var && enter_var
    {
        slime_spawn_var = 2;
        if slime_anim_var > 0
        { h_var = 0; }
        z_off_var = z_off_start_var;
        slime_w_var = slime_w_base_var;
        slime_angle_var = random(360);
    }
    if slime_var
    {
        for (local.i=0; local.i<global.mark_len_var; local.i+=1;)
        {
            if !global.mark_arr[local.i,3] && frac_chance_scr(slime_num_var,slime_den_var)
            {
                with instance_create(global.mark_arr[local.i,0],global.mark_arr[local.i,1],slime_obj)
                {
                    par_var = other.id;
                    tex_var = other.slime_tex_var;
                    image_alpha = other.slime_alpha_var;
                    w_var = other.slime_w_base_var;
                    z_off_var = other.slime_z_off_var;
                    spd_mult_var = other.slime_spd_mult_var;
                    z = global.mark_arr[local.i,2];
                }
                global.mark_arr[local.i,3] = true;
            }
        }
    }
');
// Slime alarm
object_event_add
(argument0,ev_alarm,8,'
    slime_spawn_var = false;
    h_var = h_base_var;
    z_off_var = z_off_base_var;
    slime_w_var = 0;
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    switch slime_spawn_var
    {
        case 1:
        {
            local.per = alarm_arr[8,0]/alarm_arr[8,1];
            if slime_anim_var > 0
            {
                h_var = h_base_var*(1-local.per);
                if slime_anim_var == 2
                { z_off_start_var = -h_var; }
            }
            z_off_var = lerp_scr(z_off_base_var,z_off_start_var,local.per);
            slime_w_var = slime_w_base_var*local.per;
            break;
        }
        case 2:
        {
            if slime_spawn_spd_mult_var != 1 { spd_mult_var *= slime_spawn_spd_mult_var; }
            break;
        }
    }
');
// Movement
object_event_add
(argument0,ev_other,ev_user0,'
    if enter_var && do_slime_spawn_var && target_dist_var <= spd_base_var*spd_mult_var
    {
        enter_var = false;
        x = target_x_var;
        y = target_y_var;
        z = target_z_var;
        if type_var > 0 { do_coll_var = true; }
        slime_spawn_var = 1;
        move_var = false;
        atk_var = false;
        set_alarm_scr(8,slime_alarm_var);
        set_alarm_scr(1,slime_alarm_var);
        set_alarm_scr(4,slime_alarm_var);
        set_motion_scr(0,true);
        // Stupid wake sound
        if slime_snd_var[0]
        {
            if fmod_inst_is_play_scr(snd_var) && fmod_inst_is_3d_scr(snd_var)
            { fmod_inst_stop_scr(snd_var); }
            snd_var = fmod_snd_3d_play_scr(slime_snd_var[1]);
            sub_var[0] = slime_snd_var[2];
            sub_var[1] = slime_snd_var[3];
            set_alarm_scr(6,irandom_range(snd_delay_min_var,snd_delay_max_var));
        }
        // Slime Spawning
        event_user(6);
        local.bestdist = target_dist_var;
        local.slime = noone;
        with slime_obj
        {
            if par_var == other.id && tp_var
            {
                local.dist = point_distance_3d_scr(x,y,z,other.target_x_var,other.target_y_var,other.target_z_var);
                if local.dist < local.bestdist && (touch_var || other.do_slime_spawn_var != 1)
                {
                    local.slime = id;
                    local.bestdist = local.dist
                }
            }
        }
        if instance_exists(local.slime)
        {
            with local.slime
            {
                local.xtmp = x;
                local.ytmp = y;
                local.ztmp = z;
                local.dir = direction;
                // local.zoff = z_off_var;
                // local.alpha = image_alpha;
                // local.width = w_var;
                x = other.x;
                y = other.y;
                z = other.z;
                direction = other.slime_angle_var;
                // z_off_var = other.slime_z_off_var;
                // image_alpha = other.slime_alpha_var;
                // w_var = other.slime_w_base_var;
                other.x = local.xtmp;
                other.y = local.ytmp;
                other.z = local.ztmp;
                other.slime_angle_var = local.dir;
                // other.slime_z_off_var = local.zoff;
                // other.slime_alpha_var = local.alpha;
                // other.slime_w_base_var = local.width;
            }
        }
        exit;
    }
    if coward_var && hurt_var { spd_mult_var *= -coward_spd_var; }
    event_inherited();
');
// Hurt Event
object_event_add
(argument0,ev_other,ev_user4,'
    if !enter_var
    {
        event_inherited();
        if do_slime_spawn_var && stun_var == 2
        {
            if hurt_eff_var && !global.reduce_flash_var
            {
                with instance_create(0,0,flash_eff_obj)
                {
                    image_blend = c_red;
                    cam_id_var = other.hurt_target_var.cam_id_var;
                    set_alarm_scr(0,18);
                }
            }
            set_motion_3d_scr(0,true);
            local.dist = check_ray_scr(x,y,z+(coll_var[2]/2),0,0,-1);
            if local.dist < 10000000
            {
                slime_spawn_var = 3;
                if slime_anim_var > 0
                { h_var = 0; }
                z_off_var = z_off_start_var;
                slime_w_var = slime_w_base_var;
                slime_angle_var = random(360);
                // Snap to floor
                z = local.dist-(coll_var[2]/2);
                // Stun
                move_var = false;
                atk_var = false;
                // Stop the alarms!
                set_alarm_scr(1,-1);
                set_alarm_scr(4,-1);
                set_alarm_scr(8,-1);
                set_alarm_scr(6,hurt_alarm_var+irandom_range(snd_delay_min_var,snd_delay_min_var));
                // Abuse Prevention
                if do_abuse_var
                {
                    abuse_var += 1;
                    if abuse_var > abuse_max_var
                    {
                        // Slime Spawning
                        event_user(6);
                        local.bestdist = target_dist_var;
                        local.slime_len = 0;
                        with slime_obj
                        {
                            if par_var == other.id && tp_var
                            {
                                local.slime[local.slime_len] = id;
                                local.slime_len += 1;
                            }
                        }
                        if local.slime_len > 0
                        {
                            with local.slime[irandom(local.slime_len-1)]
                            {
                                local.xtmp = x;
                                local.ytmp = y;
                                local.ztmp = z;
                                local.dir = direction;
                                x = other.x;
                                y = other.y;
                                z = other.z;
                                direction = other.slime_angle_var;
                                other.x = local.xtmp;
                                other.y = local.ytmp;
                                other.z = local.ztmp;
                                other.slime_angle_var = local.dir;
                            }
                        }
                    }
                }
            }
            else
            {
                on_var = false;
                reset_alarm_scr();
            }
        }
        else
        {
            if fmod_inst_is_play_scr(snd_var) && fmod_inst_is_3d_scr(snd_var)
            { fmod_inst_stop_scr(snd_var); }
            local.snd = irandom(snd_len_var-1);
            snd_var = fmod_snd_3d_play_scr(snd_arr[local.snd,0]);
            sub_var[0] = snd_arr[local.snd,1];
            sub_var[1] = snd_arr[local.snd,2];
            set_alarm_scr(6,irandom_range(snd_delay_min_var,snd_delay_min_var));
        }
    }
');
// Hurt Alarm
object_event_add
(argument0,ev_alarm,3,'
    event_inherited();
    if do_slime_spawn_var && stun_var == 2
    {
        slime_spawn_var = 1;
        set_alarm_scr(1,slime_alarm_var);
        set_alarm_scr(4,slime_alarm_var);
        set_alarm_scr(8,slime_alarm_var);
        // Stupid wake sound
        if slime_snd_var[0]
        {
            if fmod_inst_is_play_scr(snd_var) && fmod_inst_is_3d_scr(snd_var)
            { fmod_inst_stop_scr(snd_var); }
            snd_var = fmod_snd_3d_play_scr(slime_snd_var[1]);
            sub_var[0] = slime_snd_var[2];
            sub_var[1] = slime_snd_var[3];
            set_alarm_scr(6,irandom_range(snd_delay_min_var,snd_delay_max_var));
        }
    }
');
// Draw
object_event_add
(argument0,ev_draw,0,'
    if slime_spawn_var > 0
    {
        draw_set_color(image_blend); draw_set_alpha(slime_alpha_var);
        d3d_transform_set_identity();
        d3d_transform_set_rotation_z(slime_angle_var);
        d3d_transform_add_translation(x,y,z+slime_z_off_var);
        local.radius = slime_w_var/2;
        d3d_draw_floor(-local.radius,-local.radius,0,local.radius,local.radius,0,slime_tex_var,1,1);
        d3d_transform_set_identity();
        draw_set_color(c_white); draw_set_alpha(1);
    }
    event_inherited();
');