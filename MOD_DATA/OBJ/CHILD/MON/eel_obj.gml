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
    snd_den_var = 2;
    snd_alarm_min_var = 80;
    snd_alarm_max_var = 240;
    snd_dist_min_var = 0;
    snd_dist_max_var = 600;
    hurt_snd_var = 4;
    // Translations
    ini_open(global.lang_var);
    name_var = translate_mon_str_scr("eel",global.name_var);
    local.sub = string_replace(ini_read_string("SUB","eel","SUB_eel"),"@n",name_var);
    for (local.i=0; local.i<snd_len_var; local.i+=1)
    { snd_arr[local.i,1] = local.sub; snd_arr[local.i,2] = false; }
    wake_snd_var[2] = local.sub; wake_snd_var[3] = false;
    hurt_snd_var[2] = local.sub; hurt_snd_var[3] = false;
    ini_close();
    // Variables
    type_var = 1;
    spd_base_var = 17/30; // 0.5r6
    spr_var = sprite_add(main_directory_const+"\SPR\MON\eel_spr.png",9,false,false,0,0);
    spr_spd_var = 1/3; // 0.r3
    dur_var = irandom_range(15,25);
    delay_var = 72;
    dmg_var = 30;
    dmg_alarm_var = 120;
    w_var = 16;
    h_var = 12;
    eye_h_var = 12.765625;
    z_off_var = 4;
    dupe_var = dupe_canon_const;
    atk_range_var = 48;
    dead_rm_var = eel_dead_rm;
    // Scream
    do_hurt_var = true;
    violence_var = 3;
    // Theme
    mus_prio_var = mon_mus_prio_const;
    // Assets
        // Search for existing assets to save memory
    local.loaded = false;
    with object_index
    {
        if id != other.id && object_index == other.object_index
        {
            other.spr_var = spr_var;
            other.bod_spr_var = bod_spr_var;
            for (local.i=0; local.i<snd_len_var; local.i+=1;)
            { other.snd_arr[local.i,0] = snd_arr[local.i,0]; }
            other.wake_snd_var[1] = wake_snd_var[1];
            other.hurt_snd_var[1] = hurt_snd_var[1];
            other.mus_snd_var = mus_snd_var;
            local.loaded = true;
            break;
        }
    }
        // If no existing assets were found, load them
    if !local.loaded
    {
        spr_var = sprite_add(main_directory_const+"\SPR\MON\eel_spr.png",9,false,false,0,0);
        bod_spr_var = sprite_add(main_directory_const+"\SPR\MON\eel_bod_spr.png",4,false,false,0,0);
        snd_arr[0,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\eel_01_snd.wav",true);
        snd_arr[1,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\eel_02_snd.wav",true);
        snd_arr[2,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\eel_03_snd.wav",true);
        snd_arr[3,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\eel_04_snd.wav",true);
        wake_snd_var[1] = fmod_snd_add_scr(main_directory_const+"\SND\MON\eel_wake_snd.wav",global.wake_3d_var);
        hurt_snd_var[1] = fmod_snd_add_scr(main_directory_const+"\SND\MON\eel_hurt_snd.wav",true);
        fmod_snd_set_minmax_dist_scr(hurt_snd_var[1],0,snd_dist_max_var);
        fmod_snd_set_group_scr(hurt_snd_var[1],snd_group_mon_const);
        if global.old_theme_var
        {
            mus_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\MON\bug_mus_snd.mp3");
            fmod_snd_set_loop_point_scr(mus_snd_var,1/12,1);
        }
        else
        {
            mus_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\MON\eel_mus_snd.ogg");
            fmod_snd_set_loop_point_scr(mus_snd_var,24/88,1);
        }
        fmod_snd_set_group_scr(mus_snd_var,snd_group_mus_const);
    }
    // Body
    bod_len_var = 6;
    bod_taper_var = 3;
    bod_dist_var = 12;
    bod_scale_var = 0.875;
    bod_form_var = false;
    bod_spr_spd_var = 1/6; // 0.1r6
    bod_w_var[0] = 16;
    bod_h_var[0] = 12;
    bod_z_off_var[0] = 4;
    bod_w_var[1] = 16;
    bod_h_var[1] = 12;
    bod_z_off_var[1] = 4;
    bod_w_var[2] = 16;
    bod_h_var[2] = 12;
    bod_z_off_var[2] = 4;
    bod_w_var[3] = 14;
    bod_h_var[3] = 12;
    bod_z_off_var[3] = 3;
    bod_w_var[4] = 12;
    bod_h_var[4] = 12;
    bod_z_off_var[4] = 2;
    bod_w_var[5] = 10;
    bod_h_var[5] = 10;
    bod_z_off_var[5] = 2;
    // Behavior
    if global.eel_type_var == -1 { local.type = irandom(3); }
    else { local.type = global.eel_type_var; }
    switch local.type
    {
        case 0: // Recode
        {
            bod_form_var = true;
            atk_range_var = global.mon_coll[2];
            break;
        }
        case 2: // HD (Pretend)
        {
            dur_var = irandom_range(10,15);
            atk_range_var = 32;
            // Alarms
            delay_min_var = 90;
            delay_max_var = 180;
            dmg_alarm_var = 180;
            // Sound
            snd_alarm_min_var = 90;
            snd_alarm_max_var = 240;
            snd_den_var = 1;
            snd_dist_max_var = 500;
            // Acceleration (HD Moment)
            spd_var = 16/45; // 0.3r5
            do_acc_var = true;
            acc_var = 8/225; // 0.03r5
            frick_var = acc_var;
            // Autobrake (close enough)
            autobrake_var = true;
            autobrake_spd_var = 0;
            autobrake_dir_var = 60;
            break;
        }
        case 3: // Remodeled
        {
            delay_var = 112;
            spd_base_var = 2;
            break;
        }
    }
    if bod_form_var
    {
        for (local.i=0; local.i<bod_len_var; local.i+=1;)
        {
            if local.i >= bod_len_var-bod_taper_var
            {
                bod_w_var[local.i] = bod_w_var[local.i-1]*bod_scale_var;
                bod_h_var[local.i] = bod_h_var[local.i-1]*bod_scale_var;
                bod_z_off_var[local.i] = bod_z_off_var[local.i-1]*bod_scale_var;
            }
            else
            {
                bod_w_var[local.i] = bod_w_var[0];
                bod_h_var[local.i] = bod_h_var[0];
                bod_z_off_var[local.i] = bod_z_off_var[0];
            }
        }
    }
    local.follow = id;
    for (local.i=0; local.i<bod_len_var; local.i+=1;)
    {
        with instance_create(0,0,bod_obj)
        {
            bod_id_var = local.i;
            par_var = other.id;
            follow_var = local.follow;
            dist_var = other.bod_dist_var;
            spr_var = other.bod_spr_var;
            spr_spd_var = other.bod_spr_spd_var;
            tex_var = sprite_get_texture(spr_var,0);
            w_var = other.bod_w_var[local.i];
            h_var = other.bod_h_var[local.i];
            z_off_var = other.bod_z_off_var[local.i];
            local.follow = id;
        }
    }
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
        sprite_delete(bod_spr_var);
        fmod_snd_free_scr(hurt_snd_var[1]);
        fmod_snd_free_scr(mus_snd_var);
        for (local.i=0; local.i<snd_len_var; local.i+=1;)
        { fmod_snd_free_scr(snd_arr[local.i,0]); }
    }
    with bod_obj
    {
        if par_var == other.id
        { instance_destroy(); }
    }
');
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,'
    event_inherited();
    with bod_obj
    {
        if par_var == other.id
        {
            on_var = false;
            x = other.x-lengthdir_x(dist_var*(bod_id_var+1),other.yaw_var);
            y = other.y-lengthdir_y(dist_var*(bod_id_var+1),other.yaw_var);
            z = other.z;
        }
    }
');
// Delay Alarm
object_event_add
(argument0,ev_alarm,0,'
    event_inherited();
    with bod_obj
    {
        if par_var == other.id
        { on_var = true; }
    }
');
// Hurt
object_event_add
(argument0,ev_other,ev_user4,'
    if !enter_var
    {
        if hurt_snd_var
        { fmod_snd_play_scr(choose(axe_hit_01_snd,axe_hit_02_snd)); }
        event_inherited();
    }
');