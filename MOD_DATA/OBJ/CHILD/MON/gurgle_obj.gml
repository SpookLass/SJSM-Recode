// Builtin Variables
object_set_depth(argument0,0);
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
(argument0,ev_create,1,"
    name_var = 'Gurgle';
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
    // Sounds
    snd_len_var = 4;
    wake_snd_var[0] = true; // Has a wake sound, otherwise it'll use a normal sound
    snd_num_var = 1;
    snd_den_var = 2;
    snd_alarm_min_var = 80;
    snd_alarm_max_var = 240;
    snd_dist_var = 600;
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
            local.loaded = true;
            break;
        }
    }
        // If no existing assets were found, load them
    if !local.loaded
    {
        spr_var = sprite_add(main_directory_const+'\SPR\MON\gurgle_spr.png',5,false,false,0,0);
        snd_arr[0,0] = fmod_snd_add_scr(main_directory_const+'\SND\MON\gurgle_01_snd.wav',true);
        snd_arr[1,0] = fmod_snd_add_scr(main_directory_const+'\SND\MON\gurgle_02_snd.wav',true);
        snd_arr[2,0] = fmod_snd_add_scr(main_directory_const+'\SND\MON\gurgle_03_snd.wav',true);
        snd_arr[3,0] = fmod_snd_add_scr(main_directory_const+'\SND\MON\gurgle_04_snd.wav',true);
        wake_snd_var[1] = fmod_snd_add_scr(main_directory_const+'\SND\MON\gurgle_wake_snd.wav');
        charge_snd_var[0] = fmod_snd_add_scr(main_directory_const+'\SND\MON\gurgle_charge_snd.wav',true);
    }
    // Alarms
    alarm_len_var = 10;
    // Charge
    do_attack_var = -1;
    charge_var = -1;
    charge_spd_var = 3;
    charge_alarm_var = 30;
    charge_delay_var = 180;
    charge_start_var = 40;
    charge_dist_var = 64;
    // Yoo what if it was like the NES
    res_var = true;
    res_w_var = 256;
    res_h_var = 240;
");
// Destroy Event
object_event_add
(argument0,ev_destroy,0,"
    event_inherited();
    if instance_number(object_index) <= 1
    { sprite_delete(spr_var); }
    fmod_snd_free_scr(charge_snd_var[0]);
    if res_var
    {
        global.res_override_var = false;
        global.res_override_w_var = global.res_w_var;
        global.res_override_h_var = global.res_h_var;
    }
");
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,"
    event_inherited();
    charge_var = -1;
    // Effect
    if res_var
    {
        global.res_override_var = res_var;
        global.res_override_w_var = res_w_var;
        global.res_override_h_var = res_h_var;
    }
");
// Delay Alarm
object_event_add
(argument0,ev_alarm,0,"
    event_inherited();
    set_alarm_scr(9,charge_start_var);
");
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,"
    if on_var && charge_var == false 
    && instance_exists(target_var) && target_dist_var < charge_dist_var
    {
        sight_type_var = 1; // Only center
        event_perform(ev_other,ev_user8);
        if target_visible_var
        {
            // Charge!
            local.yaw = point_direction(x,y,target_x_var,target_y_var);
            local.pitch = point_direction_3d_scr(x,y,z,target_x_var,target_y_var,target_z_var);
            set_motion_3d_scr(charge_spd_var,true,local.yaw,true,local.pitch,true);
            spr_id_var = 0;
            tex_var = sprite_get_texture(spr_var,sprite_get_number(spr_var)-1);
            charge_var = true;
            move_var = false;
            attack_var = true;
            anim_var = false;
            set_alarm_scr(1,charge_alarm_var);
            set_alarm_scr(2,charge_alarm_var);
            set_alarm_scr(4,charge_alarm_var);
            set_alarm_scr(8,charge_alarm_var);
            // Sound
            fmod_inst_stop_scr(snd_var);
            if snd_dist_var { snd_vol_var = global.vol_var*(1-(target_dist/snd_dist_var)); }
            else { snd_vol_var = global.vol_var; }
            snd_var = fmod_snd_3d_play_scr(charge_snd_var[0]);
            sub_var = charge_snd_var[1];
            set_alarm_scr(6,irandom_range(snd_alarm_min_var,snd_alarm_max_var))
        }
    }
    event_inherited();
");
// Stop charging
object_event_add
(argument0,ev_alarm,8,"
    charge_var = -1;
    set_alarm_scr(9,charge_delay_var);
");
// Ready charge
object_event_add
(argument0,ev_alarm,9,"
    charge_var = false;
");
// Animation
object_event_add
(argument0,ev_other,ev_user1,"
    if anim_type_var == 4
    { spr_id_var = (spr_id_var+(spr_spd_var*global.delta_time_var)) mod spr_num_var; }
    event_inherited();
");