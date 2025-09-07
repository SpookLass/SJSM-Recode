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
(argument0,ev_other,ev_user7,"
    type_var = 0;
    spd_base_var = 0.8;
    spr_var = sprite_add(main_directory_const+'\SPR\MON\gurgle_spr.png',5,false,false,0,0);
    spr_spd_var = 1/6;
    spr_num_var = 4;
    anim_type_var = 3;
    dur_var = irandom_range(10,20);
    delay_var = 80;
    dmg_var = 45;
    dmg_alarm_var = 120;
    w_var = 16;
    h_var = 23;
    // Alarms
    alarm_len_var = 8;
    alarm_arr[6,2] = '';
    alarm_arr[7,2] = '';
    // Inherit
    event_inherited();
    // Charge
    do_attack_var = false;
    charge_var = -1;
    charge_spd_var = 3;
    charge_alarm_var = 30;
    charge_delay_var = 180;
    charge_start_var = 40;
    charge_dist_var = 64;
");
// Destroy Event
object_event_add
(argument0,ev_destroy,0,"
    event_inherited();
    sprite_delete(spr_var);
");
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,"
    event_inherited();
    charge_var = -1;
");
// Delay Alarm
object_event_add
(argument0,ev_alarm,0,"
    event_inherited();
    set_alarm_scr(7,charge_start_var);
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
            set_alarm_scr(6,charge_alarm_var);
        }
    }
    event_inherited();
");
// Stop charging
object_event_add
(argument0,ev_alarm,6,"
    charge_var = -1;
    set_alarm_scr(7,charge_delay_var);
");
// Ready charge
object_event_add
(argument0,ev_alarm,7,"
    charge_var = false;
");
// Animation
object_event_add
(argument0,ev_other,ev_user1,"
    if anim_type_var == 3
    { spr_id_var = (spr_id_var+(spr_spd_var*global.delta_time_var)) mod spr_num_var; }
    event_inherited();
");