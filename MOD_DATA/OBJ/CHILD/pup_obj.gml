// Builtin Variables
object_set_depth(argument0,0);
object_set_mask(argument0,noone);
object_set_parent(argument0,echidna_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_other,ev_user7,"
    type_var = 0;
    spd_base_var = 5;
    spr_var = sprite_add(vanilla_directory_const+'\TEX\sprites\MS5_01_spr.png',4,false,false,0,0);
    spr_spd_var = 1/30;
    dur_var = irandom_range(15,25);
    delay_var = 240;
    dmg_var = 45;
    dmg_alarm_var = 120;
    w_var = 10;
    h_var = 20;
    // Sounds
    snd_len_var = 4;
    snd_arr[0,0] = caster_load(main_directory_const+'\SND\MON\pup_01_snd.wav');
    snd_arr[1,0] = caster_load(main_directory_const+'\SND\MON\pup_02_snd.wav');
    snd_arr[2,0] = caster_load(main_directory_const+'\SND\MON\pup_03_snd.wav');
    snd_arr[3,0] = caster_load(main_directory_const+'\SND\MON\pup_04_snd.wav');
    snd_num_var = 1;
    snd_den_var = 3;
    snd_alarm_min_var = 30;
    snd_alarm_max_var = 30;
    snd_dist_var = 600;
    // Anim
    anim_type_var = 3; // Random
    // Seen
    do_seen_var = true;
    seen_yaw_var = 30;
    seen_pitch_var = 30;
    seen_delay_var = 60;
    seen_start_delay_var = 0;
    // TP
    tp_alarm_var = 480;
    tp_dist_min_var = 128;
    tp_dist_max_var = 512;
    // Behavior
    switch global.pup_type_var
    {
        case 0: // Mod
        {
            delay_var = 90;
            break;
        }
        case 3: // Hellgate
        {
            spd_base_var = 4;
            seen_delay_var = 15;
            seen_start_delay_var = 120;
            delay_var = 60;
            tp_alarm_var = 530;
            break;
        }
        case 4: // 'True' Hellgate
        {
            seen_delay_var = 15;
            seen_start_delay_var = 120;
            delay_var = 60;
            dmg_var = 8;
            tp_alarm_var = 530;
            break;
        }
    }
    // Alarms
    alarm_len_var = 8;
    alarm_arr[7,2] = '';
    // Inherit
    event_inherited();
");
// Room start
object_event_add
(argument0,ev_other,ev_room_start,"
    event_inherited();
    x = global.spawn_arr[0,0];
    y = global.spawn_arr[0,1];
    move_var = false;
    anim_var = false;
");
// Destroy Event
object_event_add
(argument0,ev_destroy,0,"
    event_inherited();
    sprite_delete(spr_var);
");
// Delay Alarm
object_event_add
(argument0,ev_alarm,0,"
    event_inherited();
    if seen_start_delay_var
    {
        set_alarm_scr(1,seen_start_delay_var);
        set_alarm_scr(2,seen_start_delay_var);
        set_alarm_scr(6,seen_start_delay_var);
    }
    else
    {
        move_var = do_move_var;
        anim_var = do_anim_var;
    }
");
// Step event
object_event_add
(argument0,ev_step,ev_step_normal,"
    // Based on speed until I can find a better solution
    if seen_var != 1 || target_var.spd_var > 0
    { set_alarm_scr(7,tp_alarm_var); }
    if seen_var != 0
    {
        if spd_var > 0 { set_motion_3d_scr(0,true); }
        move_var = false;
        anim_var = false;
        set_alarm_scr(1,seen_delay_var);
        set_alarm_scr(2,seen_delay_var);
    }
    event_inherited();
");
// Attack Success
// Uses attack_target_var as an argument, usually the player.
object_event_add
(argument0,ev_other,ev_user3,"
    event_inherited();
    move_var = false;
    anim_var = false;
    set_alarm_scr(1,seen_delay_var);
    set_alarm_scr(2,seen_delay_var);
    set_alarm_scr(6,seen_delay_var);
    set_alarm_scr(7,tp_alarm_var);
");

// Teleport alarm
object_event_add
(argument0,ev_alarm,7,"
    event_perform(ev_other,ev_user15);
    set_alarm_scr(7,tp_alarm_var);
");
// Teleport
object_event_add
(argument0,ev_other,ev_user15,"
    // Originally anywhere in the room (0-1280 x 0-720 y)
    local.dir = random_range(target_eye_yaw_var+seen_yaw_var,target_eye_yaw_var+360-seen_yaw_var);
    local.dist = random_range(tp_dist_min_var,tp_dist_max_var);
    x = target_x_var+lengthdir_x(local.dist,local.dir);
    y = target_y_var+lengthdir_x(local.dist,local.dir);
");