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
(argument0,ev_create,1,"
    ini_open(global.lang_var);
    switch global.name_var
    {
        case name_og_const:
        case name_num_og_const:
        {
            name_var = ini_read_string('NAME','otto_og','NAME_otto_og');
            break;
        }
        case name_hd_const:
        {
            name_var = ini_read_string('NAME','otto_hd','NAME_otto_hd');
            break;
        }
        case name_fanon_const:
        {
            name_var = ini_read_string('NAME','otto_fanon','NAME_otto_fanon');
            break;
        }
        case name_num_hd_const:
        {
            name_var = ini_read_string('NAME','otto_num','NAME_otto_num');
            break;
        }
    }
    ini_close();
    type_var = 1;
    spd_base_var = 1/6; // 0.1r6
    spr_spd_var = 1/6;
    dur_var = 20;
    delay_var = -64;
    dmg_var = 10;
    dmg_alarm_var = 30;
    atk_stun_var = 30;
    w_var = 11;
    h_var = 24;
    spr_num_var = 4;
    anim_type_var = 4;
    // Sounds
    snd_len_var = 4;
    snd_num_var = 1;
    snd_den_var = 2;
    snd_alarm_min_var = 300;
    snd_alarm_max_var = 480;
    snd_dist_var = 600;
    // Assets
        // Search for existing assets to save memory
    with object_index
    {
        if id != other.id
        {
            other.spr_var = spr_var;
            local.loaded = true;
            for (local.i=0; local.i<snd_len_var; local.i+=1;)
            { other.snd_arr[local.i,0] = snd_arr[local.i,0]; }
            break;
        }
    }
        // If no existing assets were found, load them
    if !local.loaded
    {
        spr_var = sprite_add(vanilla_directory_const+'\TEX\sprites\MS26_01_spr.png',3,false,false,0,0);
        snd_arr[0,0] = fmod_snd_add_scr(main_directory_const+'\SND\MON\otto_01_snd.wav',true);
        snd_arr[1,0] = fmod_snd_add_scr(main_directory_const+'\SND\MON\otto_02_snd.wav',true);
        snd_arr[2,0] = fmod_snd_add_scr(main_directory_const+'\SND\MON\otto_03_snd.wav',true);
        snd_arr[3,0] = fmod_snd_add_scr(main_directory_const+'\SND\MON\otto_04_snd.wav',true);
    }
    // Behavior
    if global.otto_type_var == -1 { local.type = irandom(3); }
    else { local.type = global.otto_type_var; }
    switch local.type
    {
        case 0:
        {
            griddy_var = frac_chance_scr(1,1987);
            break;
        }
        case 3: // Old HD
        {
            dmg_var = 60;
            spr_spd_var = 1/15;
            delay_min_var = 90;
            delay_max_var = 180;
            spd_base_var = 28/45; // 0.6r2
            do_acc_var = true;
            dmg_alarm_var = 180;
            atk_stun_var = 0;
            acc_var = 16/675; // 0.02r370
            frick_var = acc_var;
            break;
        }
        case 2: // HD
        {
            dmg_var = 15;
            spr_spd_var = 1/15;
            delay_min_var = 120;
            delay_max_var = 240;
            spd_base_var = 28/45; // 0.6r2
            do_acc_var = true;
            dmg_alarm_var = 180;
            atk_stun_var = 0;
            acc_var = 16/675; // 0.02r370
            frick_var = acc_var;
            break;
        }
    }
");
// Destroy Event
object_event_add
(argument0,ev_destroy,0,"
    event_inherited();
    if instance_number(object_index) <= 1
    {
        sprite_delete(spr_var);
        for (local.i=0; local.i<snd_len_var; local.i+=1;)
        { fmod_snd_free_scr(snd_arr[local.i,0]); }
    }
");
// Animation
object_event_add
(argument0,ev_other,ev_user1,"
    if anim_type_var == 4
    {
        spr_prog_var = (spr_prog_var+(spr_spd_var*global.delta_time_var)) mod spr_num_var;
        switch floor(spr_prog_var)
        {
            case 1: { spr_id_var = 1; break; }
            case 3: { spr_id_var = 2; break; }
            default: { spr_id_var = 0; break; }
        }
    }
    event_inherited();
");
// Attack Success
object_event_add
(argument0,ev_other,ev_user3,"
    event_inherited();
    if atk_stun_var > 0
    {
        set_motion_scr(0,true,yaw_var,false);
        move_var = false;
        anim_var = false;
        attack_var = false;
        set_alarm_scr(1,atk_stun_var);
        set_alarm_scr(2,atk_stun_var);
        set_alarm_scr(4,atk_stun_var);
    }
");