// Builtin Variables
object_set_depth(argument0,-3);
object_set_mask(argument0,noone);
object_set_parent(argument0,echidna_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
/*
charge_var
    -1: Charge not ready
    0: Charge ready
    1: Charging
*/
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
    // Text
    name_var = "Gurgle";
    local.sub = "("+name_var+" buzzes)";
    for (local.i=0; local.i<snd_len_var; local.i+=1)
    { snd_arr[local.i,1] = local.sub; snd_arr[local.i,2] = false; }
    wake_snd_var[2] = local.sub; wake_snd_var[3] = false;
    charge_snd_var[1] = "("+name_var+" charges)"; charge_snd_var[2] = false;
    // Variables
    type_var = 0;
    spd_base_var = 0.8;
    spr_spd_var = 1/6;
    spr_num_var = 4;
    anim_type_var = 4;
    dur_var = irandom_range(10,20);
    delay_var = 80;
    dmg_var = 45;
    dmg_alarm_var = 120;
    w_var = 16;
    h_var = 23;
    eye_h_var = 11;
    mus_prio_var = theme_mus_prio_const;
    dead_rm_var = gurgle_dead_01_rm;
    // Music
    drum_inst_var = noone;
    // Alarms
    alarm_len_var = 10;
    alarm_ini_scr();
    // Charge
    do_atk_var = false;
    charge_var = -1;
    charge_spd_var = 3;
    charge_alarm_var = 30;
    charge_delay_var = 180;
    charge_start_var = 40;
    charge_dist_var = 64;
    // Attack variables
    blood_spr_var = blood_spr;
    atk_type_var = 0;
    atk_flash_var = true;
    atk_snd_var = 0;
    kill_var = true;
    atk_range_var = 48;
    // Yoo what if it was like the NES
    res_var = false;
    res_w_var = 256;
    res_h_var = 240;
    // Behavior
    if global.gurgle_type_var == -1 { local.type = irandom(2); }
    else { local.type = global.gurgle_type_var; }
    switch local.type
    {
        case 0: // Recode
        {
            dmg_var = 40;
            atk_range_var = global.mon_coll[2];
            break;
        }
        case 2: //HD GURGLE REAL?
        {
            dur_var = irandom_range(10,15);
            dmg_alarm_var = 180;
            delay_min_var = 90;
            delay_max_var = 180;
            do_enter_var = true;
            atk_range_var = 32;
            // Sound
            snd_alarm_min_var = 90;
            snd_alarm_max_var = 240;
            snd_den_var = 1;
            snd_dist_max_var = 500;
            break;
        }
    }
    // Assets
        // Search for existing assets to save memory
    local.loaded = false;
    with object_index
    {
        if id != other.id && object_index == other.object_index
        {
            other.spr_var = spr_var;
            for (local.i=0; local.i<snd_len_var; local.i+=1;)
            { other.snd_arr[local.i,0] = snd_arr[local.i,0]; }
            other.wake_snd_var[1] = wake_snd_var[1];
            other.mus_snd_var = mus_snd_var;
            other.drum_snd_var = drum_snd_var;
            local.loaded = true;
            break;
        }
    }
        // If no existing assets were found, load them
    if !local.loaded
    {
        spr_var = sprite_add(example_directory_const+"\SPR\MON\gurgle_spr.png",5,false,false,0,0);
        snd_arr[0,0] = fmod_snd_add_scr(example_directory_const+"\SND\MON\gurgle_01_snd.wav",true);
        snd_arr[1,0] = fmod_snd_add_scr(example_directory_const+"\SND\MON\gurgle_02_snd.wav",true);
        snd_arr[2,0] = fmod_snd_add_scr(example_directory_const+"\SND\MON\gurgle_03_snd.wav",true);
        snd_arr[3,0] = fmod_snd_add_scr(example_directory_const+"\SND\MON\gurgle_04_snd.wav",true);
        wake_snd_var[1] = fmod_snd_add_scr(example_directory_const+"\SND\MON\gurgle_wake_snd.wav");
        charge_snd_var[0] = fmod_snd_add_scr(example_directory_const+"\SND\MON\gurgle_charge_snd.wav",true);
        fmod_snd_set_group_scr(charge_snd_var[0],snd_group_mon_const);
        fmod_snd_set_minmax_dist_scr(charge_snd_var[0],snd_dist_min_var,snd_dist_max_var);
        // Music
        mus_snd_var = fmod_snd_add_scr(example_directory_const+"\SND\MON\gurgle_mus_snd.ogg");
        drum_snd_var = fmod_snd_add_scr(example_directory_const+"\SND\MON\gurgle_drum_snd.ogg");
        fmod_snd_set_group_scr(mus_snd_var,snd_group_mus_const);
        fmod_snd_set_group_scr(drum_snd_var,snd_group_mon_const); // Workaround
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
        for (local.i=0; local.i<snd_len_var; local.i+=1;)
        { fmod_snd_free_scr(snd_arr[local.i,0]); }
        fmod_snd_free_scr(wake_snd_var[1]);
        fmod_snd_free_scr(charge_snd_var[0]);
        fmod_snd_free_scr(mus_snd_var);
        fmod_snd_free_scr(drum_snd_var);
    }
    if res_var
    {
        global.res_override_var = false;
        global.res_override_w_var = global.res_w_var;
        global.res_override_h_var = global.res_h_var;
    }
');
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,'
    event_inherited();
    charge_var = -1;
    // Effect
    if res_var
    {
        global.res_override_var = res_var;
        global.res_override_w_var = res_w_var;
        global.res_override_h_var = res_h_var;
    }
    // Music
    local.bool = false;
    with mus_control_obj { if snd_var == other.mus_snd_var { local.bool = true; break; }}
    if local.bool
    {
        local.bool = true;
        with object_index { if fmod_inst_is_play_scr(drum_inst_var) { local.bool = false; break; }}
        if local.bool { drum_inst_var = fmod_snd_loop_scr(drum_snd_var); }
        if fmod_inst_is_play_scr(drum_inst_var) { fmod_inst_set_pos_scr(drum_inst_var,fmod_inst_get_pos_scr(mus_control_obj.inst_var)); }
    }
    else { fmod_inst_stop_scr(drum_inst_var); }
');
// Delay Alarm
object_event_add
(argument0,ev_alarm,0,'
    event_inherited();
    set_alarm_scr(9,charge_start_var);
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    // Charge!
    if on_var && charge_var == false
    {
        local.bool = false;
        if possess_var
        {
            local.bool = (global.input_press_arr[interact_input_const,player_id_var] == 1);
            if local.bool
            {
                local.yaw = eye_yaw_var;
                local.pitch = eye_pitch_var;
            }
        }
        else
        {
            local.bool = instance_exists(target_var) && target_dist_var < charge_dist_var;
            if local.bool
            {
                sight_type_var = 1; // Only center
                event_user(8);
                if !target_visible_var { local.bool = false; }
                else
                {
                    local.yaw = point_direction(x,y,target_x_var,target_y_var);
                    local.pitch = point_direction_3d_scr(x,y,z,target_x_var,target_y_var,target_z_var);
                }
            }
        }
        if local.bool
        {
            // Charge!
            set_motion_3d_scr(charge_spd_var,true,local.yaw,true,local.pitch,true);
            spr_id_var = 0;
            tex_var = sprite_get_texture(spr_var,sprite_get_number(spr_var)-1);
            charge_var = true;
            move_var = false;
            atk_var = true;
            anim_var = false;
            set_alarm_scr(1,charge_alarm_var);
            set_alarm_scr(2,charge_alarm_var);
            set_alarm_scr(4,charge_alarm_var);
            set_alarm_scr(8,charge_alarm_var);
            // Sound
            fmod_inst_stop_scr(inst_var);
            inst_var = fmod_snd_3d_play_scr(charge_snd_var[0]);
            sub_var[0] = charge_snd_var[1];
            sub_var[1] = charge_snd_var[2];
            set_alarm_scr(6,irandom_range(snd_alarm_min_var,snd_alarm_max_var))
        }
    }
    // Music
    if fmod_inst_is_play_scr(drum_inst_var)
    {
        if fmod_inst_is_play_scr(inst_var) != fmod_inst_get_mute_scr(drum_inst_var)
        { fmod_inst_set_mute_scr(drum_inst_var,fmod_inst_is_play_scr(inst_var)); }
        if fmod_inst_get_pause_scr(mus_control_obj.inst_var) != fmod_inst_get_pause_scr(drum_inst_var)
        { fmod_inst_set_pause_scr(drum_inst_var,fmod_inst_get_pause_scr(mus_control_obj.inst_var)); }
    }
    event_inherited();
');
// Stop charging
object_event_add
(argument0,ev_alarm,8,'
    charge_var = -1;
    set_alarm_scr(9,charge_delay_var);
');
// Ready charge
object_event_add
(argument0,ev_alarm,9,'
    charge_var = false;
');
// Animation
object_event_add
(argument0,ev_other,ev_user1,'
    if anim_type_var == 4
    { spr_id_var = (spr_id_var+(spr_spd_var*global.delta_time_var)) mod spr_num_var; }
    event_inherited();
');