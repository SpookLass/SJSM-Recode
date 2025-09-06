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
    spd_base_var = 0.8;
    spr_var = sprite_add(vanilla_directory_const+'\TEX\sprites\MS3_01_spr.png',6,false,false,0,0);
    spr_spd_var = 1/6;
    dur_var = irandom_range(10,20);
    delay_var = 173;
    dmg_var = 45;
    dmg_alarm_var = 120;
    w_var = 10;
    h_var = 20;
    switch global.ringu_type_var
    {
        case 3: // Old HD
        {
            spd_base_var = 44/45; // 0.9r7
        }
        case 2: // HD
        {
            dur_var = irandom_range(10,15);
            dmg_alarm_var = 180;
            delay_min_var = 90;
            delay_max_var = 180;
            break;
        }
    }
    event_inherited();
    z_off_var = 2;
");
// Destroy Event
object_event_add
(argument0,ev_destroy,0,"
    event_inherited();
    sprite_delete(spr_var);
");