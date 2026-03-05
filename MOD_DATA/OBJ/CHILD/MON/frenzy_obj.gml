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
    ini_open(global.lang_var);
    name_var = translate_mon_str_scr("frenzy",global.name_var);
    charge_snd_var[1] = string_replace(ini_read_string("SUB","frenzy","SUB_frenzy"),"@n",name_var); charge_snd_var[2] = false;
    hurt_snd_var[2] = string_replace(ini_read_string("SUB","frenzy_hurt","SUB_frenzy_hurt"),"@n",name_var); hurt_snd_var[3] = false;
    ini_close();
    // Variables
    type_var = 2;
    spd_base_var = 1.3;
    spr_spd_var = 0.65;
    dur_var = irandom_range(10,20);
    delay_var = -1;
    dmg_var = 15;
    dmg_alarm_var = -1;
    w_var = 16.8;
    h_var = 25.2;
    eye_h_var = 22.6;
    atk_range_var = 12;
    blood_spr_var = blood_kh_spr;
    dupe_var = dupe_canon_const;
    // Sounds
    do_snd_var = true;
    snd_dist_min_var = -1;
    snd_dist_max_var = -1;
    hurt_snd_var = 4;
    // Theme
    mus_prio_var = theme_mus_prio_const;
    // Special
    do_hurt_var = true;
    sight_dist_var = -1;
    anim_spd_var = 1;
    alpha_min_var = 0;
    alpha_max_var = 0.2;
    fade_alarm_var = 500;
    impatience_alarm_var = 0;
    respawn_alarm_var = 0;
    respawn_alone_var = false;
    // Spawning
    spawn_attempt_var = 30;
    spawn_dist_var = 64;
    alarm_len_var = 9;
    alarm_ini_scr();
    // Fog
    do_eff_var = false;
    fog_color_var = c_dkgray;
    fog_prio_var = 3;
    fog_start_var = 32;
    fog_end_var = 200;
    // Assets
        // Search for existing assets to save memory
    local.loaded = false;
    with object_index
    {
        if id != other.id && object_index == other.object_index
        {
            other.spr_var = spr_var;
            other.bg_var = bg_var;
            other.charge_snd_var[0] = charge_snd_var[0];
            other.mus_snd_var = mus_snd_var;
            other.hurt_snd_var[1] = hurt_snd_var[1];
            other.scare_snd_var = scare_snd_var;
            local.loaded = true;
            break;
        }
    }
        // If no existing assets were found, load them
    if !local.loaded
    {
        spr_var = sprite_add(dh_directory_const+"\TEX\sprites\frenzy2_spr.png",8,false,false,0,0); // working_directory+"\MODS\PLUS\SPR\MON\gangnam_frenzy_spr.gif"
        bg_var = background_add(dh_directory_const+"\TEX\sprites\frenzy_spr.png",false,false);
        charge_snd_var[0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\frenzy_atk_short_snd.wav",true);
        mus_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\MON\frenzy_mus_snd.mp3");
        hurt_snd_var[1] = fmod_snd_add_scr(main_directory_const+"\SND\DH\frenzy_hurt_snd.wav",true);
        scare_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\MON\scare_short_snd.wav");
        fmod_snd_set_group_scr(charge_snd_var[0],snd_group_mon_const);
        fmod_snd_set_group_scr(hurt_snd_var[1],snd_group_mon_const);
        fmod_snd_set_group_scr(mus_snd_var,snd_group_mus_const);
    }
    // Behavior
    if global.frenzy_type_var == -1 { local.type = irandom(2); }
    else { local.type = global.frenzy_type_var; }
    switch local.type
    {
        case 0: // Recode
        {
            do_eff_var = true;
            sight_dist_var = 128;
            spawn_dist_var = 160;
            respawn_alarm_var = 90;
            respawn_alone_var = true;
            dmg_var = 20;
            atk_range_var = global.mon_coll[2];
            fade_alarm_var = 60;
            alpha_min_var = 0.2;
            alpha_max_var = 0.4;
            impatience_alarm_var = 480;
            break;
        }
        case 2: // HD
        {
            fade_alarm_var = 120;
            spd_var = 16/9; // 1.r7
            atk_range_var = 64/3; // 21.r3
            // Acceleration
            do_acc_var = true;
            acc_var = 8/135; // 0.0r529
            frick_var = acc_var;
            // Autobrake (close enough)
            autobrake_var = true;
            autobrake_spd_var = 0;
            autobrake_dir_var = 60;
            break;
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
        background_delete(bg_var);
        fmod_snd_free_scr(mus_snd_var);
        fmod_snd_free_scr(charge_snd_var[0]);
        fmod_snd_free_scr(hurt_snd_var[1]);
        fmod_snd_free_scr(scare_snd_var);
    }
    if do_eff_var && gamemaker_version == 800
    { shader_set_ps_scr(-1); }
');
// Room Start
object_event_add
(argument0,ev_other,ev_room_start,'
    event_inherited();
    tex_var = background_get_texture(bg_var);
    enter_var = false;
    do_coll_var = true;
    if do_eff_var
    {
        if !instance_exists(dh_eff_obj)
        { instance_create(0,0,dh_eff_obj); }
        if gamemaker_version == 800
        { shader_set_ps_scr(orthographic_ps); }
        with fog_par_obj { if prio_var < other.fog_prio_var { instance_destroy(); }}
        if !instance_exists(fog_par_obj)
        {
            with instance_create(0,0,fog_par_obj)
            {
                prio_var = other.fog_prio_var;
                fog_var = true;
                fog_color_var = other.fog_color_var;
                fog_start_var = other.fog_start_var;
                fog_end_var = other.fog_end_var;
                fog_dark_var = false;
                event_user(0);
            }
        }
    }
');
// Delay Alarm
object_event_add
(argument0,ev_alarm,0,'
    woke_var = false;
    move_var = false;
    if do_door_var
    {
        do_door_var = false;
        event_inherited();
        do_door_var = true;
    }
    else { event_inherited(); }
    event_user(15);
    if impatience_alarm_var > 0
    { set_alarm_scr(8,impatience_alarm_var); }
');
// Impatience Alarm
object_event_add
(argument0,ev_alarm,8,'
    if !woke_var
    {
        woke_var = true;
        image_alpha = 1;
        move_var = true;
        snd_var = fmod_snd_3d_play_scr(charge_snd_var[0]);
        sub_var[0] = charge_snd_var[1];
        sub_var[1] = charge_snd_var[2];
    }
');
// Animation
object_event_add
(argument0,ev_other,ev_user1,'
    if !woke_var
    {
        spr_prog_var -= anim_spd_var*global.delta_time_var;
        if spr_prog_var <= 0
        {
            spr_prog_var = 1;
            image_alpha = random_range(alpha_min_var,alpha_max_var);
        }
    }
    else { event_inherited(); }
');
// Step event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if on_var && !woke_var
    {
        event_user(6);
        if instance_exists(target_var)
        {
            sight_type_var = 1;
            event_user(8);
            if target_visible_var && target_dist_var <= sight_dist_var || sight_dist_var <= 0
            {
                event_perform(ev_alarm,8);
                set_alarm_scr(8,-1);
            }
        }
    }
    event_inherited();
');
// Spawn Event
object_event_add
(argument0,ev_other,ev_user15,'
    for (local.i=0; local.i<spawn_attempt_var; local.i+=1;)
    {
        local.flr = instance_find(floor_par_obj,irandom(instance_number(floor_par_obj)-1));
        local.xtmp = local.flr.x;//+random_range(-local.flr.w_var/2,local.flr.w_var/2);
        local.ytmp = local.flr.y;//+random_range(-local.flr.h_var/2,local.flr.h_var/2);
        local.ztmp = local.flr.z;
        local.bestdist = -1;
        if spawn_dist_var > 0
        {
            with player_obj
            {
                local.dist = point_distance_3d_scr(local.xtmp,local.ytmp,local.ztmp,x,y,z);
                if local.dist < local.bestdist || local.bestdist == -1 { local.bestdist = local.dist; }
            }
            local.bool = local.bestdist >= spawn_dist_var;
        }
        else { local.bool = true; }
        if local.bool
        {
            x = local.xtmp;
            y = local.ytmp;
            z = local.ztmp;
            exit;
        }
    }
    on_var = false;
');
// Attack Success
object_event_add
(argument0,ev_other,ev_user3,'
    event_inherited();
    set_motion_3d_scr(0,false);
    on_var = false;
    if respawn_alarm_var > 0 && (instance_number(mon_par_obj) <= 1 || !respawn_alone_var)
    { set_alarm_scr(0,respawn_alarm_var); }
    fmod_snd_play_scr(scare_snd_var);
    with instance_create(0,0,fade_eff_obj)
    {
        cam_id_var = other.atk_target_var.cam_id_var;
        set_alarm_scr(0,other.fade_alarm_var);
    }
');
// Hurt Event
object_event_add
(argument0,ev_other,ev_user4,'
    if !enter_var
    {
        event_inherited();
        set_motion_3d_scr(0,false);
        on_var = false;
        fmod_snd_play_scr(scare_snd_var);
        with instance_create(0,0,fade_eff_obj)
        {
            cam_id_var = other.hurt_target_var.cam_id_var;
            set_alarm_scr(0,other.fade_alarm_var);
        }
    }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if !woke_var && do_eff_var && global.fog_dark_var
    {
        d3d_set_fog(global.fog_dark_var,fog_color_var,0,0);
        event_inherited();
        d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var);
    }
    else { event_inherited(); }
');