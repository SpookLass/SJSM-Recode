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
(argument0,ev_create,0,"
    type_var = 1;
    spd_base_var = 1/6; // 0.1r6
    spr_var = sprite_add(vanilla_directory_const+'\DATA\TEX\sprites\MS26_01_spr.png',3,false,false,0,0);
    spr_spd_var = 1/6;
    dur_var = 20;
    delay_var = -96;
    dmg_var = 10;
    dmg_alarm_var = 30;
    atk_stun_var = 30;
    w_var = 11;
    h_var = 24;
    switch global.otto_type_var
    {
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
            // Rough estimate based on old man
            acc_var = 8/135;
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
            // Rough estimate based on old man
            acc_var = 8/135;
            frick_var = acc_var;
            break;
        }
    }
    event_inherited();
");
// Destroy Event
object_event_add
(argument0,ev_destroy,0,"
    event_inherited();
    sprite_delete(spr_var);
");
// Attack Success
object_event_add
(argument0,ev_other,ev_user3,"
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