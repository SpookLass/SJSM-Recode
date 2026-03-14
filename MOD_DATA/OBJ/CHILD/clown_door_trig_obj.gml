// Builtin Variables
object_set_depth(argument0,-100);
object_set_mask(argument0,noone);
object_set_parent(argument0,door_trig_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Create Event
object_event_add
(argument0,ev_create,0,'
    clown_delay_var = 60;
    // Inherited
    event_inherited();
    // Alarm
    temp_var = true;
    alarm_len_var = 2;
    alarm_ini_scr();
');
// Alarm 1 Event
object_event_add
(argument0,ev_alarm,1,'
    temp_var = false;
    with instance_create(0,0,fade_eff_obj)
    {
        image_blend = c_black;
        image_alpha = 0;
        set_alarm_scr(0,other.delay_var); 
        invert_var = true;
        stay_var = true;
        cam_id_var = other.interact_target_var.cam_id_var;
    }
    event_user(2);
');
// Interact Event
object_event_add
(argument0,ev_other,ev_user1,'
    local.remaining = 0;
    with player_obj { if on_var && !in_door_var && !dead_var { local.remaining += 1; }}
    if local.remaining > 0 || !instance_exists(clown_obj)
    { event_inherited(); }
');
// Open Event
object_event_add
(argument0,ev_other,ev_user2,'
    if temp_var && instance_exists(clown_obj)
    {
        with clown_obj
        {
            if dur_var == 1
            { event_user(15); }
        }
        set_alarm_scr(1,clown_delay_var);
        global.in_door_var = true;
    }
    else { event_inherited(); }
');