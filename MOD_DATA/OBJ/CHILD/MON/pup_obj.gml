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
    wake_snd_var[0] = true;
    snd_num_var = 1;
    snd_den_var = 3;
    snd_alarm_min_var = 30;
    snd_alarm_max_var = 30;
    snd_delay_min_var = -1;
    snd_delay_max_var = -1;
    snd_dist_min_var = 0;
    snd_dist_max_var = 600;
    // Translations
    ini_open(global.lang_var);
    name_var = translate_mon_str_scr("pup",global.name_var);
    local.sub = string_replace(ini_read_string("SUB","pup","SUB_pup"),"@n",name_var);
    for (local.i=0; local.i<snd_len_var; local.i+=1)
    { snd_arr[local.i,1] = local.sub; snd_arr[local.i,2] = false; }
    wake_snd_var[2] = string_replace(ini_read_string("SUB","pup_laugh","SUB_pup_laugh"),"@n",name_var); wake_snd_var[3] = false;
    laugh_snd_var[1] = wake_snd_var[2]; laugh_snd_var[2] = false;
    ini_close();
    // Variables
    type_var = 0;
    spd_base_var = 5;
    spr_spd_var = 1/30;
    dur_var = irandom_range(15,25);
    delay_var = 240;
    dmg_var = 45;
    dmg_alarm_var = 120;
    w_base_var = 10;
    h_base_var = 20;
    eye_h_var = 17.7;
    hd_var = false;
    hd_snd_var = false;
    terrible_var = false;
    do_ascend_var = false;
    temp_hd_var = false;
    atk_range_var = 33.6;
    dead_rm_var = pup_dead_rm;
    // Anim
    anim_type_var = 3; // Random
    // Seen
    do_seen_var = true;
    seen_yaw_var = 30;
    seen_delay_var = 60;
    seen_start_delay_var = 0;
    seen_type_var = 1;
    unseen_atk_var = false;
    // TP
    tp_sight_var = false;
    tp_alarm_var = 480;
    tp_dist_min_var = 128;
    tp_dist_max_var = 512;
    // Knock Em Down!
    do_hurt_var = 1;
    hurt_dur_base_var = 0;
    hurt_snd_var = 1;
    violence_var = 3;
    hurt_tp_var = true;
    hurt_tp_num_var = 1;
    hurt_tp_den_var = 4;
    hurt_multi_var = false;
    hurt_dur_multi_var = false;
    hurt_eff_var = false;
    // Down
    hurt_w_var = 20;
    hurt_h_var = 10;
    hurt_anim_alarm_var = 15;
    hurt_up_var = false;
    hurt_alarm_min_var = 240;
    hurt_alarm_max_var = 480;
    // HD Stuff
    ascend_z_var = 128;
    ascend_alarm_var = 36;
    descend_alarm_var = 36;
    descend_start_alarm_var = 18;
    start_dist_var = 32;
    start_alarm_var = 600;
    seen_agg_max_var = 600;
    unseen_agg_max_var = 90;
    unseen_agg_var = 0;
    seen_agg_var = 0;
    // Theme
    mus_prio_var = theme_mus_prio_const;
    // Assets
        // Search for existing assets to save memory
    local.loaded = false;
    with object_index
    {
        if id != other.id && object_index == other.object_index
        {
            other.spr_base_var = spr_base_var;
            other.hurt_spr_var = hurt_spr_var;
            for (local.i=0; local.i<snd_len_var; local.i+=1;)
            { other.snd_arr[local.i,0] = snd_arr[local.i,0]; }
            other.wake_snd_var[1] = wake_snd_var[1];
            other.laugh_snd_var[0] = laugh_snd_var[0];
            other.mus_snd_var = mus_snd_var;
            local.loaded = true;
            break;
        }
    }
        // If no existing assets were found, load them
    if !local.loaded
    {
        spr_base_var = sprite_add(vanilla_directory_const+"\TEX\sprites\MS5_01_spr.png",4,false,false,0,0);
        hurt_spr_var = sprite_add(vanilla_directory_const+"\TEX\sprites\MS5_02_spr.png",2,false,false,0,0);
        snd_arr[0,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\pup_01_snd.wav",true);
        snd_arr[1,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\pup_02_snd.wav",true);
        snd_arr[2,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\pup_03_snd.wav",true);
        snd_arr[3,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\pup_04_snd.wav",true);
        wake_snd_var[1] = fmod_snd_add_scr(main_directory_const+"\SND\MON\pup_wake_snd.wav",global.wake_3d_var);
        laugh_snd_var[0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\pup_wake_snd.wav",true);
        switch global.old_theme_var
        {
            case 2: { mus_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\MON\ROMM\pup_rom_mus_snd.ogg"); break; }
            default:
            {
                mus_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\MON\pup_mus_snd.mp3");
                fmod_snd_set_loop_point_scr(mus_snd_var,3/144,137/144); // Not exact
                break;
            }
        }
        fmod_snd_set_group_scr(mus_snd_var,snd_group_mus_const);
        
    }
    spr_var = spr_base_var;
    tex_var = sprite_get_texture(spr_var,irandom(sprite_get_number(spr_var)));
    // Behavior
    if global.pup_type_var == -1 { local.type = irandom(5); }
    else { local.type = global.pup_type_var; }
    local.set = false;
    switch local.type
    {
        case 0: // Mod
        {
            spd_base_var = 4;
            do_ascend_var = true;
            temp_hd_var = true;
            tp_sight_var = true;
            type_var = 2;
            delay_var = 60;
            dmg_var = 30;
            seen_yaw_var = 60;
            seen_pitch_var = 60;
            visible_var = true;
            unseen_atk_var = true;
            // hurt_tp_var = false;
            // hurt_multi_var = true;
            tp_dist_min_var = 0;
            tp_dist_max_var = 16;
            ascend_alarm_var = 60;
            descend_alarm_var = 30;
            descend_start_alarm_var = 30;
            atk_range_var = global.mon_coll[2];
            break;
        }
        case 5: // HD Hellgate
        {
            do_hurt_var = 1;
            start_alarm_var = -1;
            hurt_up_var = true;
            local.set = true;
        }
        case 2: // HD
        {
            hd_var = true;
            hd_snd_var = true;
            hurt_eff_var = true;
            terrible_var = true;
            delay_var = 0;
            do_anim_var = false;
            do_move_var = -1;
            snd_alarm_min_var = -1;
            snd_alarm_max_var = -1;
            seen_yaw_var = 60;
            dmg_alarm_var = 180;
            atk_range_var = 32;
            tp_dist_min_var = 0;
            tp_dist_max_var = 32/3; // 10.r6
            violence_var = 2;
            hurt_tp_var = false;
            hurt_multi_var = true;
            hurt_die_var = 0;
            hurt_alarm_max_var = 240;
            if !local.set
            {
                do_hurt_var = 2;
                hurt_dur_base_var = 1;
            }
            break;
        }
        case 3: // Old
        {
            tp_alarm_var = -1;
            delay_var = 60;
            break;
        }
        case 4: // Hellgate
        {
            hurt_tp_den_var = 2;
            spd_base_var = 4;
            seen_delay_var = 15;
            seen_start_delay_var = 120;
            delay_var = 60;
            tp_alarm_var = 530;
            hurt_up_var = true;
            break;
        }
    }
    // Base
    w_var = w_base_var;
    h_var = h_base_var;
    // Alarms
    alarm_len_var = 11;
    alarm_ini_scr();
');
// Room start
object_event_add
(argument0,ev_other,ev_room_start,'
    event_inherited();
    enter_var = false;
    x = global.spawn_arr[0,0];
    y = global.spawn_arr[0,1];
    z = global.spawn_arr[0,2];
    move_var = false;
    anim_var = false;
    if type_var > 0 { do_coll_var = true; }
    if unseen_atk_var || temp_hd_var || hd_var
    { atk_var = false; }
    anim_type_var = 3;
    w_var = w_base_var;
    h_var = h_base_var;
    spr_var = spr_base_var;
    spr_id_var = irandom(sprite_get_number(spr_var));
    tex_var = sprite_get_texture(spr_var,spr_id_var);
    down_var = false;
    visible_var = (do_ascend_var && !temp_hd_var);
    hurt_dur_var = hurt_dur_base_var;
');
// Destroy Event
object_event_add
(argument0,ev_destroy,0,'
    event_inherited();
    local.bool = false;
    with object_index { if id != other.id && object_index == other.object_index { local.bool = true; break; }}
    if !local.bool
    {
        sprite_delete(spr_base_var);
        sprite_delete(hurt_spr_var);
        fmod_snd_free_scr(mus_snd_var);
        fmod_snd_free_scr(wake_snd_var[1]);
        fmod_snd_free_scr(laugh_snd_var[0]);
        for (local.i=0; local.i<snd_len_var; local.i+=1;)
        { fmod_snd_free_scr(snd_arr[local.i,0]); }
    }
');
// Delay Alarm
object_event_add
(argument0,ev_alarm,0,'
    event_inherited();
    if temp_hd_var { hd_var = true; }
    if hd_var
    {
        state_var = 3;
        if start_alarm_var > 0
        {
            set_alarm_scr(4,start_alarm_var);
            set_alarm_scr(8,start_alarm_var);
        }
    }
    else if do_ascend_var
    {
        ascend_agg_var = 0;
        z_off_var = 0;
        state_var = false;
        if unseen_atk_var
        { atk_var = false; }
    }
    else if seen_start_delay_var > 0
    {
        set_alarm_scr(1,seen_start_delay_var);
        set_alarm_scr(2,seen_start_delay_var);
        set_alarm_scr(6,seen_start_delay_var);
        if unseen_atk_var
        { set_alarm_scr(4,seen_start_delay_var); }
        state_var = 2;
    }
    else
    {
        move_var = do_move_var;
        anim_var = do_anim_var;
        if unseen_atk_var
        { atk_var = do_atk_var; }
        state_var = false;
    }
');
// Step event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if !down_var
    {
        if on_var
        {
            if hd_var // Basically an entirely different entity
            {
                local.tp = false;
                switch state_var
                {
                    case 0: // Normal
                    {
                        z_off_var = 0;
                        switch is_seen_var
                        {
                            case 1:
                            {
                                unseen_agg_var = 0;
                                seen_agg_var += global.delta_time_var;
                                local.tp = (seen_agg_var >= seen_agg_max_var);
                                break;
                            }
                            case 0:
                            {
                                unseen_agg_var += global.delta_time_var;
                                local.tp = (unseen_agg_var >= unseen_agg_max_var);
                                break;
                            }
                            default:
                            {
                                unseen_agg_var = 0;
                                seen_agg_var = 0;
                                break;
                            }
                        }
                        if local.tp
                        {
                            // Reset
                            unseen_agg_var = 0;
                            seen_agg_var = 0;
                            // Ascend
                            state_var = 1;
                            atk_var = false;
                            set_alarm_scr(4,ascend_alarm_var);
                            set_alarm_scr(8,ascend_alarm_var);
                        }
                        break;
                    }
                    case 1: // Ascending
                    {
                        z_off_var = lerp_scr(ascend_z_var,0,alarm_arr[8,0]/alarm_arr[8,1]);
                        break;
                    }
                    case 2: // Descending
                    {
                        z_off_var = lerp_scr(0,ascend_z_var,alarm_arr[9,0]/alarm_arr[9,1]);
                        // Oh GOD
                        if is_seen_var == 0 && terrible_var && instance_exists(target_var)
                        {
                            local.xvel = -lengthdir_x(1,target_var.yaw_var);
                            local.yvel = -lengthdir_y(1,target_var.yaw_var);
                            local.dist = median(check_ray_scr(target_x_var,target_y_var,target_z_var+(target_var.coll_var[1]/2),local.xvel,local.yvel,0)-(coll_var[2]/2),tp_dist_min_var,tp_dist_max_var);
                            x = target_x_var+(local.xvel*local.dist);
                            y = target_y_var+(local.yvel*local.dist);
                            z = target_z_var;                         
                        }
                        break;
                    }
                    case 3: // Waiting
                    {
                        z_off_var = ascend_z_var;
                        local.start = true;
                        with player_obj
                        {
                            if on_var && !dead_var && !in_door_var
                            {
                                if point_distance_3d_scr(x,y,z,global.spawn_arr[0,0],global.spawn_arr[0,1],global.spawn_arr[0,2]) < other.start_dist_var
                                { local.start = false; }
                            }
                        }
                        if local.start
                        {
                            set_alarm_scr(8,-1);
                            // Descend
                            atk_var = false;
                            set_alarm_scr(4,descend_start_alarm_var);
                            set_alarm_scr(9,descend_start_alarm_var);
                            z_off_var = ascend_z_var;
                            state_var = 2;
                        }
                        break;
                    }
                }
            }
            else // Normal
            {
                // Seen stuff
                if is_seen_var == 1
                {
                    local.active = false;
                    with player_obj { if on_var && !dead_var && !in_door_var && active_var { local.active = true; }}
                    if state_var > 0
                    {
                        move_var = false;
                        anim_var = false;
                        if unseen_atk_var
                        { atk_var = false; }
                        set_motion_scr(0,true);
                        set_alarm_scr(6,-1);
                        if do_ascend_var
                        {
                            ascend_agg_var -= global.delta_time_var/descend_alarm_var;
                            state_var = 1;
                            if ascend_agg_var <= 0
                            {
                                z_off_var = 0;
                                ascend_agg_var = 0;
                                state_var = false;
                            }
                        }
                        else
                        {
                            set_alarm_scr(1,-1);
                            set_alarm_scr(2,-1);
                            set_alarm_scr(6,-1);
                            if unseen_atk_var
                            { set_alarm_scr(4,-1); }
                            state_var = false;
                        }
                    }
                }
                else
                {
                    local.active = true;
                    if state_var < 2
                    {
                        if do_ascend_var
                        {
                            ascend_agg_var += global.delta_time_var/ascend_alarm_var;
                            state_var = 1;
                            if ascend_agg_var >= 1
                            {
                                move_var = true;
                                anim_var = true;
                                event_perform(ev_alarm,6);
                                z_off_var = ascend_z_var;
                                ascend_agg_var = 1;
                                if unseen_atk_var
                                { atk_var = do_atk_var; }
                                state_var = 2;
                            }
                        }
                        else
                        {
                            set_alarm_scr(1,seen_delay_var);
                            set_alarm_scr(2,seen_delay_var);
                            set_alarm_scr(6,seen_delay_var);
                            if unseen_atk_var
                            { set_alarm_scr(4,seen_delay_var); }
                            state_var = 2;
                        }
                    }
                }
                // Animate
                if do_ascend_var && state_var == 1
                { z_off_var = lerp_scr(0,ascend_z_var,ascend_agg_var); }
                // Teleport
                if tp_alarm_var > 0
                {
                    if !local.active { if alarm_arr[8,0] <= 0 { set_alarm_scr(8,tp_alarm_var); }}
                    else if alarm_arr[8,0] > 0 { set_alarm_scr(8,-1); }
                }
            }
        }
        else if do_ascend_var && !hd_var && alarm_arr[0,0] > 0
        { z_off_var = lerp_scr(0,ascend_z_var,alarm_arr[0,0]/alarm_arr[0,1]); }
    }
    event_inherited();
');
// Attack Success
object_event_add
(argument0,ev_other,ev_user3,'
    event_inherited();
    // Freeze
    if !hd_var
    {
        move_var = false;
        anim_var = false;
        atk_var = false;
        set_alarm_scr(6,-1);
        set_motion_scr(0,true);
        state_var = false;
        if do_ascend_var
        {
            ascend_agg_var = 0;
            z_off_var = 0;
        }
        else
        {
            set_alarm_scr(1,-1);
            set_alarm_scr(2,-1);
            set_alarm_scr(4,-1);
        }
    }
');
// Teleport alarm
object_event_add
(argument0,ev_alarm,8,'
    if temp_hd_var && !hd_var
    {
        // I hope this works
        hd_var = true;
        set_motion_3d_scr(0,true);
        move_var = false;
        anim_var = false;
        set_alarm_scr(6,-1);
        // Ascend
        state_var = 1;
        atk_var = false;
        set_alarm_scr(4,ascend_alarm_var);
        set_alarm_scr(8,ascend_alarm_var);
    }
    else { event_user(15); }
');
// Coming Down (HD)
object_event_add
(argument0,ev_alarm,9,'
    z_off_var = 0;
    state_var = 0;
    if temp_hd_var
    {
        hd_var = false;
        ascend_agg_var = 0;
    }
    // Sound (I think? HDs code here sucks)
    if hd_snd_var
    {
        if fmod_inst_is_play_scr(snd_var) && fmod_inst_is_3d_scr(snd_var)
        { fmod_inst_stop_scr(snd_var); }
        local.snd = irandom(snd_len_var-1);
        snd_var = fmod_snd_3d_play_scr(snd_arr[local.snd,0]);
        sub_var[0] = snd_arr[local.snd,1];
        sub_var[1] = snd_arr[local.snd,2];
    }
');
// GET UP
object_event_add
(argument0,ev_alarm,10,'
    w_var = w_base_var;
    h_var = h_base_var;
    spr_var = spr_base_var;
    spr_id_var = irandom(sprite_get_number(spr_var));
    tex_var = sprite_get_texture(spr_var,spr_id_var);
    down_var = false;
    hurt_var = false;
    hurt_dur_var = hurt_dur_base_var;
    atk_var = do_atk_var;
    if hd_var
    {
        state_var = 1;
        atk_var = false;
        set_alarm_scr(4,ascend_alarm_var);
        set_alarm_scr(8,ascend_alarm_var);
    }
    else
    {
        state_var = 0;
        anim_type_var = 3;
        event_perform(ev_alarm,8);
    }
');
// Teleport
object_event_add
(argument0,ev_other,ev_user15,'
    fmod_inst_stop_scr(snd_var);
    snd_var = fmod_snd_3d_play_scr(laugh_snd_var[0]);
    sub_var[0] = laugh_snd_var[1];
    sub_var[1] = laugh_snd_var[2];
    if instance_exists(target_var)
    {
        if hd_var
        {
            local.xvel = -lengthdir_x(1,target_var.yaw_var);
            local.yvel = -lengthdir_y(1,target_var.yaw_var);
            local.dist = median(check_ray_scr(target_x_var,target_y_var,target_z_var+(target_var.coll_var[1]/2),local.xvel,local.yvel,0)-(coll_var[2]/2),tp_dist_min_var,tp_dist_max_var);
            x = target_x_var+(local.xvel*local.dist);
            y = target_y_var+(local.yvel*local.dist);
            z = target_z_var;
            // Descend
            tex_var = sprite_get_texture(spr_var,irandom(sprite_get_number(spr_var)));
            atk_var = false;
            set_alarm_scr(4,descend_alarm_var);
            set_alarm_scr(9,descend_alarm_var);
            z_off_var = ascend_z_var;
            state_var = 2;
        }
        else
        {
            // Originally anywhere in the room (0-1280 x 0-720 y)
            if tp_sight_var { local.dir = random_range(target_var.eye_yaw_var+seen_yaw_var,target_var.eye_yaw_var+360-seen_yaw_var); }
            else { local.dir = random(360); }
            local.dist = random_range(tp_dist_min_var,tp_dist_max_var);
            x = target_x_var+lengthdir_x(local.dist,local.dir);
            y = target_y_var+lengthdir_y(local.dist,local.dir);
            // Set alarm again
            set_alarm_scr(8,tp_alarm_var);
        }
    }
');
// Hurt Event
object_event_add
(argument0,ev_other,ev_user4,'
    if !enter_var
    {
        if hurt_tp_var && frac_chance_scr(hurt_tp_num_var,hurt_tp_den_var)
        {
            if down_var { event_perform(ev_alarm,10); }
            else { event_perform(ev_alarm,8); }
        }
        else
        {
            reset_alarm_scr();
            event_inherited();
            down_var = true;
            w_var = hurt_w_var;
            h_var = hurt_h_var;
            anim_type_var = 1;
            move_var = false;
            atk_var = false;
            anim_var = true;
            set_motion_3d_scr(0,true);
            visible_var = true;
            spr_var = hurt_spr_var;
            spr_id_var = 0;
            tex_var = sprite_get_texture(spr_var,spr_id_var);
            set_alarm_scr(5,hurt_anim_alarm_var);
            z_off_var = 0;
            // Hellgate
            if hurt_up_var
            { set_alarm_scr(10,irandom_range(hurt_alarm_min_var,hurt_alarm_max_var)); }
            // Can hit multiple times
            if !hurt_multi_var
            {
                hurt_var = true;
                set_alarm_scr(3,-1);
            }
            if !hurt_dur_multi_var { hurt_dur_var = 0; }
            // Sound
            if hd_snd_var
            {
                if fmod_inst_is_play_scr(snd_var) && fmod_inst_is_3d_scr(snd_var)
                { fmod_inst_stop_scr(snd_var); }
                local.snd = irandom(snd_len_var-1);
                snd_var = fmod_snd_3d_play_scr(snd_arr[local.snd,0]);
                sub_var[0] = snd_arr[local.snd,1];
                sub_var[1] = snd_arr[local.snd,2];
            }
            // Effect
            if hurt_eff_var && !global.reduce_flash_var
            {
                with instance_create(0,0,flash_eff_obj)
                {
                    image_blend = c_red;
                    cam_id_var = other.hurt_target_var.cam_id_var;
                    set_alarm_scr(0,18);
                }
            }
        }
    }
');