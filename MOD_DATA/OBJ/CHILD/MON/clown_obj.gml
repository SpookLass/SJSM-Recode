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
    name_var = 'Clown';
    type_var = 1;
    spd_base_var = 1; // Technically 1.r3 in DH due to a bug
    spr_spd_var = 1;
    dur_var = irandom_range(15,20);
    delay_var = 0;
    w_var = 24.7;
    h_var = 25.3;
    z_off_var = -0.3;
    // Special
    do_attack_var = -1;
    do_seen_var = true;
    seen_yaw_var = 30;
    seen_pitch_var = 30;
    // Assets
        // Search for existing assets to save memory
    with object_index
    {
        if id != other.id
        {
            other.spr_var = spr_var;
            local.loaded = true;
            break;
        }
    }
        // If no existing assets were found, load them
    if !local.loaded
    {
        spr_var = sprite_add(dh_directory_const+'\TEX\sprites\CLWN_SPR1.png',6,false,false,0,0);
    }
    // Sounds
    snd_len_var = 4;
    snd_arr[0,0] = caster_load(main_directory_const+'\SND\MON\ringu_01_snd.ogg');
    snd_arr[1,0] = caster_load(main_directory_const+'\SND\MON\ringu_02_snd.ogg');
    snd_arr[2,0] = caster_load(main_directory_const+'\SND\MON\ringu_03_snd.ogg');
    snd_arr[3,0] = caster_load(main_directory_const+'\SND\MON\ringu_04_snd.ogg');
    snd_num_var = 1;
    snd_den_var = 1;
    snd_alarm_min_var = 300;
    snd_alarm_max_var = 360;
    snd_dist_var = 768; // Kinda, maybe 512
    // Behavior
    if global.clown_type_var == -1 { local.type = irandom(3); }
    else { local.type = global.clown_type_var; }
    switch local.type
    {
        case 2: // HD
        {
            spd_base_var = 8/9; // 0.r8
            do_acc_var = true;
            acc_var = 16/675; // 0.02r370
            frick_var = acc_var;
            break;
        }
        case 3: // Evil Clown
        {
            do_attack_var = true;
            dmg_var = 30;
            dmg_alarm_var = 120;
            break;
        }
    }
");
// Destroy Event
object_event_add
(argument0,ev_destroy,0,"
    event_inherited();
    if instance_number(object_index) <= 1
    { sprite_delete(spr_var); }
");
// Step event
object_event_add
(argument0,ev_step,ev_step_normal,"
    event_inherited();
    // Seem stuff
    if seen_var == 1
    {
        if spd_var > 0 { set_motion_3d_scr(0,true); }
        move_var = false;
        anim_var = false;
        if alarm_arr[6,0] > 0 { set_alarm_scr(6,-1); }
    }
    else
    {
        move_var = do_move_var
        anim_var = do_anim_var;
        if alarm_arr[6,0] <= 0 { set_alarm_scr(6,irandom_range(snd_alarm_min_var,snd_alarm_max_var)); }
    }
");