// Builtin Variables
object_set_depth(argument0,-3);
object_set_mask(argument0,noone);
object_set_parent(argument0,echidna_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
/* Parasite / Specimen 10
state_var
    0: Closed
    1: Open
    2: Leech
state_spd_var, state_spr_var, state_spr_spd_var, state_dmg_var, state_dmg_alarm_var, state_w_var, state_h_var, state_acc_var:
    All arrays based on the current state, set when changing forms
state_dist_var: Distance to change states, arrayed variable
state_chance_var: Chance to change states, arrayed variable
state_alarm_var: How often to check state, arrayed variable
state_rm_var: Whether state should persist between rooms
state_atk_var: Whether state should persist when attacking
state_close_var: Whether state should return to close when the player is further
state_check_var: Whether to check states every frame. HD only
state_delay_var: How long to delay after hitting the player in leech form
state_dur_var: If greater than 0, the duration will be set when turning into leech form, Recode only
do_warn_var: Whether to use a warning hallucination
warn_var: Whether the warning has been sent
warn_dist_var: Distance to warn at
*/
// Create Event Begin
object_event_add
(argument0,ev_create,1,'
    // Sounds
    snd_len_var = 4;
    snd_num_var = 1;
    snd_den_var = 2;
    snd_alarm_min_var = 80;
    snd_alarm_max_var = 240;
    snd_dist_min_var = 0;
    snd_dist_max_var = 600;
    eff_snd_len_var = 4;
    // Translations
    ini_open(global.lang_var);
    name_var = translate_mon_str_scr("para",global.name_var);
    local.sub = string_replace(ini_read_string("SUB","para","SUB_para"),"@n",name_var);
    for (local.i=0; local.i<snd_len_var; local.i+=1)
    { snd_arr[local.i,1] = local.sub; snd_arr[local.i,2] = false; }
    wake_snd_var[2] = local.sub;
    ini_close();
    type_var = 1;
    dur_var = irandom_range(10,20);
    do_hurt_var = 2;
    hurt_dur_var = 1;
    delay_calc_var = true;
    do_warn_var = false;
    warn_var = false;
    warn_dist_var = 320/3;
    check_all_var = false;
    check_path_var = false;
    atk_range_var = 48;
    // Theme
    mus_prio_var = theme_mus_prio_const;
    // Delay calculations
    delay_dist_var = 64;
    delay_spd_var = 1;
    // State
    state_var = 0;
    state_rm_var = false;
    state_atk_var = true;
    state_close_var = true;
    state_check_var = false;
    state_delay_var = 0;
    state_dur_var = 0;
    state_miniboss_var = false;
    // Closed
    state_spd_var[0] = 1/3;
    state_spr_spd_var[0] = 1/12;
    state_dmg_var[0] = 40;
    state_dmg_alarm_var[0] = 120;
    state_w_var[0] = 5.5;
    state_h_var[0] = 22;
    state_dist_var[0] = 128;
    state_chance_var[0] = 6;
    state_alarm_var[0] = 12;
    state_acc_var[0] = false;
    // Open
    state_spd_var[1] = 1/3;
    state_spr_spd_var[1] = 1/12;
    state_dmg_var[1] = 40;
    state_dmg_alarm_var[1] = 120;
    state_w_var[1] = 17.8;
    state_h_var[1] = 22;
    state_dist_var[1] = 56;
    state_chance_var[1] = 6;
    state_alarm_var[1] = 12;
    state_acc_var[1] = false;
    // Leech
    state_spd_var[2] = 7/3;
    state_spr_spd_var[2] = 1/3;
    state_dmg_var[2] = 15;
    state_dmg_alarm_var[2] = 120;
    state_w_var[2] = 7.5;
    state_h_var[2] = 10;
    state_dist_var[2] = 240;
    state_chance_var[2] = 2;
    state_alarm_var[2] = 60;
    state_acc_var[2] = false;
    // Effect
    eff_min_var = 30;
    eff_max_var = 60;
    state_eff_min_var = 30;
    state_eff_max_var = 60;
    // Assets
        // Search for existing assets to save memory
    local.loaded = false;
    with object_index
    {
        if id != other.id && object_index == other.object_index
        {
            other.state_spr_var[0] = state_spr_var[0];
            other.state_spr_var[1] = state_spr_var[1];
            other.state_spr_var[2] = state_spr_var[2];
            other.spr_eff_var = spr_eff_var;
            other.spr_overlay_var = spr_overlay_var;
            for (local.i=0; local.i<snd_len_var; local.i+=1;)
            { other.snd_arr[local.i,0] = snd_arr[local.i,0]; }
            for (local.i=0; local.i<eff_snd_len_var; local.i+=1;)
            { other.eff_snd_arr[local.i] = eff_snd_arr[local.i]; }
            other.wake_snd_var[1] = wake_snd_var[1];
            other.main_mus_snd_var = main_mus_snd_var;
            other.leech_mus_snd_var = leech_mus_snd_var;
            local.loaded = true;
            break;
        }
    }
        // If no existing assets were found, load them
    if !local.loaded
    {
        state_spr_var[0] = sprite_add(vanilla_directory_const+"\TEX\sprites\MS8_01_spr.png",6,false,false,0,0);
        state_spr_var[1] = sprite_add(vanilla_directory_const+"\TEX\sprites\MS8_02_spr.png",6,false,false,0,0);
        state_spr_var[2] = sprite_add(vanilla_directory_const+"\TEX\sprites\MS8_03_spr.png",7,false,false,0,0);
        spr_eff_var = execute_file(main_directory_const+"\SPR\MON\para_eff_spr.gml",main_directory_const+"\SPR\MON\para_eff_spr.png");
        spr_overlay_var = execute_file(main_directory_const+"\SPR\MON\para_overlay_spr.gml",main_directory_const+"\SPR\MON\para_overlay_spr.png");
        snd_arr[0,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\para_01_snd.wav",true);
        snd_arr[1,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\para_02_snd.wav",true);
        snd_arr[2,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\para_03_snd.wav",true);
        snd_arr[3,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\para_04_snd.wav",true);
        eff_snd_arr[0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\para_eff_01_snd.wav");
        eff_snd_arr[1] = fmod_snd_add_scr(main_directory_const+"\SND\MON\para_eff_02_snd.wav");
        eff_snd_arr[2] = fmod_snd_add_scr(main_directory_const+"\SND\MON\para_eff_03_snd.wav");
        eff_snd_arr[3] = fmod_snd_add_scr(main_directory_const+"\SND\MON\dl_eff_03_snd.wav");
        for (local.i=0; local.i<eff_snd_len_var; local.i+=1;)
        { fmod_snd_set_group_scr(eff_snd_arr[local.i],snd_group_mon_const); }
        wake_snd_var[1] = fmod_snd_add_scr(main_directory_const+"\SND\MON\para_wake_snd.wav",global.wake_3d_var);
        main_mus_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\MON\para_mus_snd.mp3");
        fmod_snd_set_group_scr(main_mus_snd_var,snd_group_mus_const);
        leech_mus_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\MON\para_leech_mus_snd.mp3");
        fmod_snd_set_group_scr(leech_mus_snd_var,snd_group_mus_const);
    }
    mus_snd_var = main_mus_snd_var;
    // Type
    if global.para_type_var == -1 { local.type = irandom(2); }
    else { local.type = global.para_type_var; }
    switch local.type
    {
        case 0: // Mod
        {
            delay_calc_var = false;
            delay_var = 60;
            state_spd_var[0] = 0.8;
            state_chance_var[0] = 1;
            state_spr_spd_var[0] = 1/6;
            state_dmg_var[0] = 30;
            state_spd_var[1] = 0.5;
            state_chance_var[1] = 1;
            state_dmg_var[1] = 30;
            state_spd_var[2] = 1.6; // 1.8
            state_chance_var[2] = 1;
            state_acc_var[2] = true;
            // state_dmg_alarm_var[2] = 60;
            state_dmg_var[2] = 20;
            state_rm_var = true;
            state_dur_var = 10;
            state_eff_min_var = 6;
            state_eff_max_var = 6;
            state_miniboss_var = true;
            acc_var = 0.16;
            frick_var = acc_var;
            do_hurt_var = 1;
            check_all_var = true;
            check_path_var = true;
            atk_range_var = global.mon_coll[2];
            // Autobrake
            autobrake_var = true;
            autobrake_spd_var = 1;
            autobrake_dist_var = -1;
            autobrake_dir_var = 60;
            break;
        }
        case 2: // HD
        {
            do_hurt_var = false;
            dur_var = irandom_range(10,15);
            do_warn_var = true;
            atk_range_var = 128/3; // 42.r6
            // Delay (uhh leech)
            delay_calc_var = false;
            delay_min_var = 90;
            delay_max_var = 180;
            // State Stuff
            state_delay_var = 72;
            state_rm_var = true;
            state_atk_var = false;
            state_dmg_alarm_var[0] = 180;
            state_spd_var[0] = 4/9; // 0.r4
            state_dmg_var[2] = 45;
            state_chance_var[0] = 1;
            state_acc_var[0] = true;
            state_dmg_alarm_var[1] = 180;
            state_spd_var[1] = 8/15;
            state_dmg_var[2] = 45;
            state_dist_var[1] = 64;
            state_chance_var[1] = 1;
            state_acc_var[1] = true;
            state_dmg_alarm_var[2] = 180;
            state_spd_var[2] = 16/9;
            state_dmg_var[2] = 45;
            state_dist_var[2] = 160;
            state_chance_var[2] = 1;
            state_acc_var[2] = true;
            state_close_var = false;
            state_check_var = true;
            state_eff_min_var = 6;
            state_eff_max_var = 6;
            // Movement
            acc_var = 8/225; // 0.03r5
            frick_var = acc_var;
            // Sounds
            snd_alarm_min_var = 90;
            snd_alarm_max_var = 240;
            snd_den_var = 1;
            // Autobrake (close enough)
            autobrake_var = true;
            autobrake_spd_var = 0;
            autobrake_dir_var = 60;
            break;
        }
        case 3: // Old
        {
            delay_dist_var = 128;
            delay_spd_var = 0.5;
            state_spd_var[2] = 1;
            state_alarm_var[2] = 240;
            break;
        }
    }
    // Delay calculation
    if delay_calc_var
    { delay_var = max(0,(delay_dist_var/delay_spd_var)-(32/state_spd_var[0])); }
    // Alarms
    alarm_len_var = 10;
    alarm_ini_scr();
    // Defaults
    spd_base_var = state_spd_var[0];
    spr_var = state_spr_var[0]
    spr_spd_var = state_spr_spd_var[0];
    dmg_var = state_dmg_var[0];
    dmg_alarm_var = state_dmg_alarm_var[0];
    w_var = state_w_var[0];
    h_var = state_h_var[0];
    do_acc_var = state_acc_var[0];
');
// Destroy Event
object_event_add
(argument0,ev_destroy,0,'
    event_inherited();
    local.bool = false;
    with object_index { if id != other.id && object_index == other.object_index { local.bool = true; break; }}
    if !local.bool
    {
        fmod_snd_free_scr(main_mus_snd_var);
        fmod_snd_free_scr(leech_mus_snd_var);
        sprite_delete(spr_eff_var);
        sprite_delete(state_spr_var[0]);
        sprite_delete(state_spr_var[1]);
        sprite_delete(state_spr_var[2]);
        sprite_delete(spr_overlay_var);
        for (local.i=0; local.i<snd_len_var; local.i+=1;)
        { fmod_snd_free_scr(snd_arr[local.i,0]); }
        if wake_snd_var[0] { fmod_snd_free_scr(wake_snd_var[1]); }
        for (local.i=0; local.i<eff_snd_len_var; local.i+=1;)
        { fmod_snd_free_scr(eff_snd_arr[local.i]); }
    }
    with spr_flash_eff_obj
    { if par_var == other.id { instance_destroy(); }}
    with para_eff_obj
    { if par_var == other.id { instance_destroy(); }}
');
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,'
    // Change forms
    if (state_close_var && state_var < 2) || !state_rm_var
    {
        state_var = 0;
        event_user(15);
    }
    // Recalculate delay
    else if delay_calc_var // Delay calculation
    {
        delay_min_var = max(0,32-(32/(spd_base_var*spd_mult_var)));
        delay_max_var = delay_min_var;
    }
    // Create overlay
    if !instance_exists(para_eff_obj)
    {
        local.para = id;
        with player_obj
        {
            local.play = id;
            with instance_create(0,0,para_eff_obj)
            {
                par_var = local.para;
                spr_var = local.para.spr_overlay_var;
                play_var = local.play;
                cam_id_var = local.play.cam_id_var;
            }
        }
    }
    // Reset variables
    warn_var = false;
    // Inherit
    event_inherited();
');
// Delay
object_event_add
(argument0,ev_alarm,0,'
    if !state_check_var && state_var < 2
    {
        set_alarm_scr(8,state_alarm_var[!state_var]);
        set_alarm_scr(9,state_alarm_var[2]);
    }
    // Inherit
    event_inherited();
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if on_var && state_var < 2
    {
        if state_check_var
        {
            event_perform(ev_alarm,8);
            event_perform(ev_alarm,9);
        }
        if do_warn_var && !warn_var && target_dist_var >= warn_dist_var
        {
            warn_var = true;
            with instance_create(0,0,spr_flash_eff_obj)
            {
                par_var= other.id;
                spr_var = other.spr_eff_var;
                spr_id_var = irandom(sprite_get_number(spr_var)-1);
                do_snd_var = true;
                snd_var = fmod_snd_play_scr(other.eff_snd_arr[irandom(other.eff_snd_len_var-1)]);
                spr_spd_var = 1;
                rand_rate_var = 15;
                set_alarm_scr(0,irandom_range(other.eff_min_var,other.eff_max_var));
                // Set camera to everyone
                cam_id_var = -1;
            }
        }
    }
    event_inherited();
');
// Check State 1
object_event_add
(argument0,ev_alarm,8,'
    if state_close_var { local.maxstate = 2; }
    else { local.maxstate = 1; }
    if state_var < local.maxstate
    {
        local.check = !state_var;
        if !enter_var
        {
            if local.check { local.bool = (target_dist_var <= state_dist_var[local.check]); }
            else { local.bool = (target_dist_var >= state_dist_var[local.check]); }
            if local.bool && frac_chance_scr(1,state_chance_var[local.check])
            {
                state_var = local.check;
                with instance_create(0,0,spr_flash_eff_obj)
                {
                    par_var= other.id;
                    spr_var = other.spr_eff_var;
                    spr_id_var = irandom(sprite_get_number(spr_var)-1);
                    spr_spd_var = 1;
                    do_snd_var = true;
                    snd_var = fmod_snd_play_scr(other.eff_snd_arr[irandom(other.eff_snd_len_var-1)]);
                    rand_rate_var = 15;
                    set_alarm_scr(0,irandom_range(other.state_eff_min_var,other.state_eff_max_var));
                    // Set camera to everyone
                    cam_id_var = -1;
                }
                event_user(15);
            }
        }
        if !state_check_var
        { set_alarm_scr(8,state_alarm_var[local.check]); }
    }
');
// Check State 2
object_event_add
(argument0,ev_alarm,9,'
    if state_var < 2
    {
        // Technically doesnt check for if they entered in OG, but Im lazy
        if !enter_var
        {
            if check_path_var && mp_grid_path(grid_var,path_var,x,y,target_x_var,target_y_var,true)
            { local.target_dist = max(target_dist_var,path_get_length(path_var)); }
            else { local.target_dist = target_dist_var; }
            if check_all_var
            {
                with (echidna_obj)
                {
                    if on_var && !enter_var
                    {
                        if other.check_path_var && type_var > 0 
                        { local.dist = max(target_dist_var,path_get_length(path_var)); }
                        else { local.dist = target_dist_var; }
                        if local.dist < local.target_dist && local.dist > 0 { local.target_dist = local.dist; }
                    }
                }
            }
            if local.target_dist >= state_dist_var[2] && frac_chance_scr(1,state_chance_var[2])
            {
                state_var = 2;
                with instance_create(0,0,spr_flash_eff_obj)
                {
                    par_var= other.id;
                    spr_var = other.spr_eff_var;
                    spr_id_var = irandom(sprite_get_number(spr_var)-1);
                    spr_spd_var = 1;
                    do_snd_var = true;
                    snd_var = fmod_snd_play_scr(other.eff_snd_arr[irandom(other.eff_snd_len_var-1)]);
                    rand_rate_var = 15;
                    set_alarm_scr(0,irandom_range(other.state_eff_min_var,other.state_eff_max_var));
                    // Set camera to everyone
                    cam_id_var = -1;
                }
                event_user(15);
                if state_dur_var > 0 && dur_var > state_dur_var
                {
                    dur_var = state_dur_var;
                    dur_start_var = dur_var;
                }
                if state_miniboss_var
                {
                    mus_prio_var = mb_mus_prio_const;
                    mus_snd_var = leech_mus_snd_var;
                    with mus_control_obj { event_user(0); }
                }
                exit;
            }
        }
        if !state_check_var
        { set_alarm_scr(9,state_alarm_var[2]); }
    }
');
// Attack Success
object_event_add
(argument0,ev_other,ev_user3,'
    event_inherited();
    with atk_target_var
    {
        hp_infect_var = median(0,hp_max_var-hp_var,hp_infect_var+other.dmg_var);
    }
    with instance_create(0,0,spr_flash_eff_obj)
    {
        par_var= other.id;
        spr_var = other.spr_eff_var;
        spr_id_var = irandom(sprite_get_number(spr_var)-1);
        spr_spd_var = 1;
        do_snd_var = true;
        snd_var = fmod_snd_play_scr(other.eff_snd_arr[irandom(other.eff_snd_len_var-1)]);
        rand_rate_var = 15;
        set_alarm_scr(0,min(other.dmg_alarm_var/2,irandom_range(other.eff_min_var,other.eff_max_var)));
        // Set camera to player
        cam_id_var = other.atk_target_var.cam_id_var;
    }
    if state_var >= 2 && !state_atk_var
    {
        state_var = 0;
        event_user(15);
        if state_delay_var > 0
        {
            set_motion_scr(0,true,yaw_var,false);
            move_var = false;
            anim_var = false;
            atk_var = false;
            set_alarm_scr(1,state_delay_var);
            set_alarm_scr(2,state_delay_var);
            set_alarm_scr(4,state_delay_var);
        }
    }
');
// Hurt
object_event_add
(argument0,ev_other,ev_user4,'
    if !enter_var && state_var < 2 && (!state_miniboss_var || instance_number(mon_par_obj) <= 1)
    {
        event_inherited();
        state_var = 2;
        with instance_create(0,0,spr_flash_eff_obj)
        {
            par_var= other.id;
            spr_var = other.spr_eff_var;
            spr_id_var = irandom(sprite_get_number(spr_var)-1);
            spr_spd_var = 1;
            do_snd_var = true;
            snd_var = fmod_snd_play_scr(other.eff_snd_arr[irandom(other.eff_snd_len_var-1)]);
            rand_rate_var = 15;
            set_alarm_scr(0,irandom_range(other.state_eff_min_var,other.state_eff_max_var));
            // Set camera to player
            cam_id_var = other.hurt_target_var.cam_id_var;
        }
        event_user(15);
        if state_dur_var > 0 && dur_var > state_dur_var
        {
            dur_var = state_dur_var;
            dur_start_var = dur_var;
        }
        if state_miniboss_var
        {
            mus_prio_var = mb_mus_prio_const;
            mus_snd_var = leech_mus_snd_var;
            with mus_control_obj { event_user(0); }
        }
    }
');
// Change state
object_event_add
(argument0,ev_other,ev_user15,'
    spd_base_var = state_spd_var[state_var];
    spr_var = state_spr_var[state_var]
    spr_spd_var = state_spr_spd_var[state_var];
    dmg_var = state_dmg_var[state_var];
    dmg_alarm_var = state_dmg_alarm_var[state_var];
    w_var = state_w_var[state_var];
    h_var = state_h_var[state_var];
    do_acc_var = state_acc_var[state_var];
    spr_id_var = 0;
    tex_var = sprite_get_texture(spr_var,0);
');