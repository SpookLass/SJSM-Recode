// Builtin Variables
object_set_depth(argument0,0);
object_set_mask(argument0,noone);
object_set_parent(argument0,echidna_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
/*
state_var
    0: Down
    1: Going down
    2: Up
    3: Going up
*/
// Create Event
object_event_add
(argument0,ev_create,1,"
    ini_open(global.lang_var);
    switch global.name_var
    {
        case name_og_const:
        {
            name_var = ini_read_string('NAME','pup_og','NAME_pup_og');
            break;
        }
        case name_hd_const:
        {
            name_var = ini_read_string('NAME','pup_hd','NAME_pup_hd');
            break;
        }
        case name_fanon_const:
        {
            name_var = ini_read_string('NAME','pup_fanon','NAME_pup_fanon');
            break;
        }
        case name_num_og_const:
        case name_num_hd_const:
        {
            name_var = ini_read_string('NAME','pup_num','NAME_pup_num');
            break;
        }
    }
    ini_close();
    type_var = 0;
    spd_base_var = 5;
    spr_spd_var = 1/30;
    dur_var = irandom_range(15,25);
    delay_var = 240;
    dmg_var = 45;
    dmg_alarm_var = 120;
    w_var = 10;
    h_var = 20;
    // Sounds
    snd_len_var = 4;
    wake_snd_var[0] = true;
    snd_num_var = 1;
    snd_den_var = 3;
    snd_alarm_min_var = 30;
    snd_alarm_max_var = 30;
    snd_dist_var = 600;
    // Theme
    mus_prio_var = theme_mus_prio_const;
    // Assets
        // Search for existing assets to save memory
    with object_index
    {
        if id != other.id
        {
            other.spr_var = spr_var;
            for (local.i=0; local.i<snd_len_var; local.i+=1;)
            { other.snd_arr[local.i,0] = snd_arr[local.i,0]; }
            other.wake_snd_var[1] = wake_snd_var[1];
            other.mus_snd_var = mus_snd_var;
            local.loaded = true;
            break;
        }
    }
        // If no existing assets were found, load them
    if !local.loaded
    {
        spr_var = sprite_add(vanilla_directory_const+'\TEX\sprites\MS5_01_spr.png',4,false,false,0,0);
        snd_arr[0,0] = fmod_snd_add_scr(main_directory_const+'\SND\MON\pup_01_snd.wav',true);
        snd_arr[1,0] = fmod_snd_add_scr(main_directory_const+'\SND\MON\pup_02_snd.wav',true);
        snd_arr[2,0] = fmod_snd_add_scr(main_directory_const+'\SND\MON\pup_03_snd.wav',true);
        snd_arr[3,0] = fmod_snd_add_scr(main_directory_const+'\SND\MON\pup_04_snd.wav',true);
        wake_snd_var[1] = fmod_snd_add_scr(main_directory_const+'\SND\MON\pup_wake_snd.wav');
        mus_snd_var = fmod_snd_add_scr(main_directory_const+'\SND\MON\pup_mus_snd.mp3');
    }
    // Anim
    anim_type_var = 3; // Random
    visible_var = true;
    // Seen
    do_seen_var = true;
    seen_yaw_var = 30;
    seen_delay_var = 60;
    seen_start_delay_var = 0;
    // TP
    tp_sight_var = false;
    tp_alarm_var = 480;
    tp_dist_min_var = 128;
    tp_dist_max_var = 512;
    // Behavior
    if global.pup_type_var == -1 { local.type = irandom(4); }
    else { local.type = global.pup_type_var; }
    switch local.type
    {
        case 0: // Mod
        {
            tp_sight_var = true;
            type_var = 2;
            delay_var = 90;
            dmg_var = 30;
            seen_pitch_var = 30;
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
    alarm_len_var = 11;
");
// Room start
object_event_add
(argument0,ev_other,ev_room_start,"
    event_inherited();
    enter_var = false;
    x = global.spawn_arr[0,0];
    y = global.spawn_arr[0,1];
    z = global.spawn_arr[0,2];
    move_var = false;
    anim_var = false;
    state_var = 2;
");
// Destroy Event
object_event_add
(argument0,ev_destroy,0,"
    event_inherited();
    if instance_number(object_index) <= 1
    {
        sprite_delete(spr_var);
        fmod_snd_free_scr(mus_snd_var);
        for (local.i=0; local.i<snd_len_var; local.i+=1;)
        { fmod_snd_free_scr(snd_arr[local.i,0]); }
    }
");
// Delay Alarm
object_event_add
(argument0,ev_alarm,0,"
    event_inherited();
    if seen_start_delay_var > 0
    {
        state_var = 1;
        set_alarm_scr(1,seen_start_delay_var);
        set_alarm_scr(2,seen_start_delay_var);
        set_alarm_scr(6,seen_start_delay_var);
        set_alarm_scr(9,seen_start_delay_var);
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
    if seen_var == 1 && target_var != noone && !target_var.active_var
    { if alarm_arr[8,0] <= 0 { set_alarm_scr(8,tp_alarm_var); }}
    else if alarm_arr[8,0] > 0 { set_alarm_scr(8,-1); }
    // Seem stuff
    if seen_var != 0
    {
        if spd_var > 0 { set_motion_3d_scr(0,true); }
        move_var = false;
        anim_var = false;
        if state_var > 1
        {
            state_var = 1;
            set_alarm_scr(1,-1);
            set_alarm_scr(2,-1);
            set_alarm_scr(6,-1);
            set_alarm_scr(9,seen_delay_var);
            // Somewhat jank way to keep the current position
            alarm_arr[9,0] -= alarm_arr[10,0];
            set_alarm_scr(10,-1);
        }
    }
    else if state_var < 2
    {
        state_var = 3;
        set_alarm_scr(1,seen_delay_var);
        set_alarm_scr(2,seen_delay_var);
        set_alarm_scr(6,seen_delay_var);
        set_alarm_scr(10,seen_delay_var);
        // Somewhat jank way to keep the current position
        alarm_arr[10,0] -= alarm_arr[9,0];
        set_alarm_scr(9,-1);
    }
    switch state_var
    {
        case 0: { z_off_var = 0; break; }
        case 1: { z_off_var = 256*alarm_arr[9,0]/alarm_arr[9,1]; break; }
        case 2: { z_off_var = 256; break; }
        case 3: { z_off_var = 256*(1-(alarm_arr[10,0]/alarm_arr[10,1])); break; }
    }
    event_inherited();
");
// Attack Success
// Uses attack_target_var as an argument, usually the player.
object_event_add
(argument0,ev_other,ev_user3,"
    event_inherited();
    if spd_var > 0 { set_motion_3d_scr(0,true); }
    move_var = false;
    anim_var = false;
    set_alarm_scr(8,-1);
    if state_var > 1
    {
        state_var = 0;
        set_alarm_scr(1,-1);
        set_alarm_scr(2,-1);
        set_alarm_scr(6,-1);
        // set_alarm_scr(9,seen_delay_var);
        set_alarm_scr(9,-1);
        set_alarm_scr(10,-1);
    }
");
// Teleport alarm
object_event_add
(argument0,ev_alarm,8,"
    event_perform(ev_other,ev_user15);
    set_alarm_scr(8,tp_alarm_var);
");
// Teleport
object_event_add
(argument0,ev_other,ev_user15,"
    // Originally anywhere in the room (0-1280 x 0-720 y)
    if tp_sight_var { local.dir = random_range(target_eye_yaw_var+seen_yaw_var,target_eye_yaw_var+360-seen_yaw_var); }
    else { local.dir = random(360); }
    local.dist = random_range(tp_dist_min_var,tp_dist_max_var);
    x = target_x_var+lengthdir_x(local.dist,local.dir);
    y = target_y_var+lengthdir_y(local.dist,local.dir);
");
// Going down
object_event_add
(argument0,ev_alarm,9,"
    state_var = 0;
");
// Going up
object_event_add
(argument0,ev_alarm,10,"
    state_var = 2;
");