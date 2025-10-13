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
(argument0,ev_create,1,"
    ini_open(global.lang_var);
    switch global.name_var
    {
        case name_og_const:
        case name_num_og_const:
        {
            name_var = ini_read_string('NAME','real_ringu_og','NAME_real_ringu_og');
            break;
        }
        case name_hd_const:
        case name_fanon_const:
        {
            name_var = ini_read_string('NAME','real_ringu_hd','NAME_real_ringu_hd');
            break;
        }
        case name_num_hd_const:
        {
            name_var = ini_read_string('NAME','real_ringu_num','NAME_real_ringu_num');
            break;
        }
    }
    type_var = 0;
    dur_var = 25;
    delay_var = 173;
    dmg_var = 45;
    dmg_alarm_var = 120;
    h_var = 20;
    z_off_var = 2;
    // Assets
        // Search for existing assets to save memory
    with object_index
    {
        if id != other.id
        {
            other.state_spr_var[0] = state_spr_var[0];
            other.state_spr_var[1] = state_spr_var[1];
            local.loaded = true;
            break;
        }
    }
        // If no existing assets were found, load them
    if !local.loaded
    {
        state_spr_var[0] = sprite_add(vanilla_directory_const+'\TEX\sprites\MS3_03_spr.png',6,false,false,0,0);
        state_spr_var[1] = sprite_add(vanilla_directory_const+'\TEX\sprites\MS3_04_spr.png',6,false,false,0,0);
    }
    // Laugh
    do_hurt_var = true;
    violence_var = 3;
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
    // State
    state_var = 0;
    state_chance_num_var = 175;
    state_chance_den_var = 256;
    state_spd_var[0] = 0.8;
    state_seen_spd_var[0] = 0.4;
    state_spr_spd_var[0] = 1/6;
    state_w_var[0] = 11.2;
    state_spd_var[1] = 1.1;
    state_seen_spd_var[1] = 0.4;
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
    spr_spd_02_var = 1;
    // Behavior
    if global.real_ringu_type_var == -1 { local.type = irandom(3); }
    else { local.type = global.real_ringu_type_var; }
    switch local.type
    {
        case 0: // Mod
        {
            seen_pitch_var = 30;
            dmg_var = 40;
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
    alarm_len_var = 9;
    alarm_arr[8,2] = '';
    // Stuff
    event_perform(ev_other,ev_user14);
");
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,"
    event_inherited();
    if !instance_exists(ringu_static_eff_obj)
    {
        with instance_create(0,0,ringu_static_eff_obj) 
        {
            par_var = other.id;
            fog_var = other.eff_fog_var;
            fog_max_start_var = other.eff_fog_start_var;
            fog_max_end_var = other.eff_fog_end_var;
            fog_start_var = fog_max_start_var;
            fog_end_var = fog_max_end_var;
            per_var = other.eff_per_var;
            alarm_var = other.eff_alarm_var;
            set_alarm_scr(0,alarm_var);
            if fog_var { depth = 99; }
            else { depth = -99; }
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
    if instance_number(object_index) <= 1
    {
        sprite_delete(state_spr_var[0]);
        sprite_delete(state_spr_var[1]);
    }
    with ringu_static_eff_obj
    { if par_var == other.id { instance_destroy(); }}
");
// Delay
object_event_add
(argument0,ev_alarm,0,"
    set_alarm_scr(8,rand_alarm_var);
    event_inherited();
");
// Step event
object_event_add
(argument0,ev_step,ev_step_normal,"
    if on_var
    {
        if seen_var == 1 { spd_base_var = state_seen_spd_var[state_var]; }
        else { spd_base_var = state_spd_var[state_var]; }
    }
    event_inherited();
");
// Animation
object_event_add
(argument0,ev_other,ev_user1,"
    event_inherited();
    if state_var == 1
    {
        spr_prog_var -= spr_spd_02_var*global.delta_time_var;
        if spr_prog_var <= 0
        {
            spr_prog_var = 1;
            image_alpha = random_range(0.2,1);
        }
    }
");
// Random anim
object_event_add
(argument0,ev_alarm,8,"
    if state_var == 1 && frac_chance_scr(1,rand_chance_var)
    { spr_id_var = irandom(sprite_get_number(spr_var)-1); }
    set_alarm_scr(8,rand_alarm_var);
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