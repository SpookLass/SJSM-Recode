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
    // Seen
    do_seen_var = true;
    seen_spd_var = 0.4;
    seen_yaw_var = 30;
    // State
    state_var = 0;
    state_spd_var[0] = 0.8;
    state_spr_var[0] = sprite_add(vanilla_directory_const+'\TEX\sprites\MS3_03_spr.png',6,false,false,0,0);
    state_spr_spd_var[0] = 1/6;
    state_w_var[0] = 11.2;
    state_spd_var[1] = 1.1;
    state_spr_var[1] = sprite_add(vanilla_directory_const+'\TEX\sprites\MS3_04_spr.png',6,false,false,0,0);
    state_spr_spd_var[1] = 1/3;
    state_w_var[1] = 13.6;
    // Behavior
    switch global.ringu_type_var
    {
        case 2: // HD
        {
            break;
        }
    }
    // Stuff
    event_perform(ev_other,ev_user14);
    event_inherited();
    
");
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,"
    event_inherited();
    if !instance_exists(ringu_static_eff_obj)
    { instance_create(0,0,ringu_static_eff_obj); }
    state_var = 0;
    event_perform(ev_other,ev_user14);
");
// Step event
object_event_add
(argument0,ev_step,ev_step_normal,"
    if seen_var
    {
        spd_base_var = seen_spd_var;
        spr_var = state_spr_var[1];
    }
    else
    {
        spd_base_var = state_spd_var[state_var];
        spr_var = state_spr_var[0];
    }
    event_inherited();
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
// Change form event
object_event_add
(argument0,ev_other,ev_user14,"
    spd_base_var = state_spd_var[state_var];
    spr_var = state_spr_var[state_var];
    spr_spd_var = state_spr_spd_var[state_var];
    w_var = state_w_var[state_var];
");
// Check form event
object_event_add
(argument0,ev_other,ev_user15,"
    if state_var { state_var = 0; }
    else if seen_var && frac_chance_scr(175,256)
    { state_var = 1; }
    event_perform(ev_other,ev_user14);
");