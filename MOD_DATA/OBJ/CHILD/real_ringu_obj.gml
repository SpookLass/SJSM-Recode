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
    dur_var = 25;
    delay_var = 173;
    dmg_var = 45;
    dmg_alarm_var = 120;
    h_var = 20;
    z_off_var = 2;
    // Sounds
    snd_len_var = 4;
    snd_arr[0,0] = caster_load(main_directory_const+'\SND\MON\ringu_01_snd.ogg');
    snd_arr[1,0] = caster_load(main_directory_const+'\SND\MON\ringu_02_snd.ogg');
    snd_arr[2,0] = caster_load(main_directory_const+'\SND\MON\ringu_03_snd.ogg');
    snd_arr[3,0] = caster_load(main_directory_const+'\SND\MON\ringu_04_snd.ogg');
    snd_num_var = 1;
    snd_den_var = 2;
    snd_alarm_min_var = 80;
    snd_alarm_max_var = 240;
    snd_dist_var = 600;
    // Seen
    do_seen_var = true;
    seen_yaw_var = 30;
    seen_pitch_var = 30;
    // State
    state_var = 0;
    state_chance_num_var = 175;
    state_chance_den_var = 256;
    state_spd_var[0] = 0.8;
    state_seen_spd_var[0] = 0.4;
    state_spr_var[0] = sprite_add(vanilla_directory_const+'\TEX\sprites\MS3_03_spr.png',6,false,false,0,0);
    state_spr_spd_var[0] = 1/6;
    state_w_var[0] = 11.2;
    state_spd_var[1] = 1.1;
    state_seen_spd_var[1] = 0.4;
    state_spr_var[1] = sprite_add(vanilla_directory_const+'\TEX\sprites\MS3_04_spr.png',6,false,false,0,0);
    state_spr_spd_var[1] = 1/3;
    state_w_var[1] = 13.6;
    // Effect
    eff_fog_var = false;
    eff_fog_start_var = 128;
    eff_fog_end_var = 256;
    eff_alarm_var = 250;
    eff_per_var = false;
    // Random
    rand_alarm_var = 3;
    rand_chance_var = 2;
    // Behavior
    switch global.real_ringu_type_var
    {
        case 0: // Mod
        {
            eff_fog_var = true;
            eff_alarm_var = 256;
            eff_per_var = false;
            state_spd_var[0] = 0.85;
            state_seen_spd_var[0] = 0.4;
            state_spd_var[1] = state_spd_var[0];
            state_seen_spd_var[1] = 1.1;
            state_chance_num_var = 2;
            state_chance_den_var = 3;
            break;
        }
        case 3: // Old HD
        {
            seen_yaw_var = 60;
            seen_pitch_var = 60;
            eff_fog_var = true;
            eff_fog_start_var = 560/3; // 186.r6
            eff_fog_end_var = 1120/3; // 373.r3
            eff_alarm_var = 420;
            eff_per_var = true;
            state_chance_num_var = 1;
            state_chance_den_var = 3;
            delay_min_var = 90;
            delay_max_var = 180;
            state_spd_var[0] = 286/225; // 1.27r1
            state_seen_spd_var[0] = 44/45; // 0.9r7 WHAT
            state_spd_var[1] = state_spd_var[0];
            state_seen_spd_var[1] = state_seen_spd_var[0];
            break;
        }
        case 2: // HD
        {
            seen_yaw_var = 60;
            seen_pitch_var = 60;
            eff_fog_var = true;
            eff_fog_start_var = 560/3; // 186.r6
            eff_fog_end_var = 1120/3; // 373.r3
            eff_alarm_var = 420;
            eff_per_var = true;
            state_chance_num_var = 1;
            state_chance_den_var = 3;
            delay_min_var = 90;
            delay_max_var = 180;
            state_spd_var[0] = 1222/1125; // 1.086r2
            state_seen_spd_var[0] = 188/225; // 0.83r5
            state_spd_var[1] = state_spd_var[0];
            state_seen_spd_var[1] = state_seen_spd_var[0]
            break;
        }
    }
    // Alarms
    alarm_len_var = 8;
    alarm_arr[7,2] = '';
    // Stuff
    event_perform(ev_other,ev_user14);
    event_inherited();
    
");
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,"
    event_inherited();
    if !instance_exists(ringu_static_eff_obj)
    {
        with instance_create(0,0,ringu_static_eff_obj) 
        {
            fog_var = other.eff_fog_var;
            fog_max_start_var = other.eff_fog_start_var;
            fog_max_end_var = other.eff_fog_end_var;
            fog_start_var = fog_max_start_var;
            fog_end_var = fog_max_end_var;
            per_var = other.eff_per_var;
            set_alarm_scr(0,alarm_var);
            if fog_var { depth = 99; }
            event_perform(ev_other,ev_room_start);
        } 
    }
    if eff_fog_var && !destroy_var // stupid bug
    { with (fog_par_obj) { instance_destroy(); }}
    state_var = 0;
    event_perform(ev_other,ev_user14);
");
// Destroy Event
object_event_add
(argument0,ev_destroy,0,"
    event_inherited();
    sprite_delete(state_spr_var[0]);
    sprite_delete(state_spr_var[1]);
    with ringu_static_eff_obj
    { instance_destroy(); }
");
// Delay
object_event_add
(argument0,ev_alarm,0,"
    set_alarm_scr(7,rand_alarm_var);
    event_inherited();
");
// Step event
object_event_add
(argument0,ev_step,ev_step_normal,"
    if seen_var == 1 { spd_base_var = state_seen_spd_var[state_var]; }
    else { spd_base_var = state_spd_var[state_var]; }
    if state_var == 1 { image_alpha = random_range(0.2,1); }
    event_inherited();
");
// Random anim
object_event_add
(argument0,ev_alarm,7,"
    if state_var == 1 && frac_chance_scr(1,rand_chance_var)
    { spr_id_var = irandom(sprite_get_number(spr_var)-1); }
    set_alarm_scr(7,rand_alarm_var);
");
// Change form event
object_event_add
(argument0,ev_other,ev_user14,"
    if seen_var { spd_base_var = state_seen_spd_var[state_var]; }
    else { spd_base_var = state_spd_var[state_var]; }
    spr_var = state_spr_var[state_var];
    spr_spd_var = state_spr_spd_var[state_var];
    w_var = state_w_var[state_var];
    image_alpha = 1;
");
// Check form event
object_event_add
(argument0,ev_other,ev_user15,"
    if state_var { state_var = 0; }
    else if seen_var 
    && frac_chance_scr(state_chance_num_var,state_chance_den_var)
    { state_var = 1; }
    event_perform(ev_other,ev_user14);
");