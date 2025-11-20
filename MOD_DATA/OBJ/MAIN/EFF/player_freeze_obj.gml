// Builtin Variables
object_set_depth(argument0,100);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Create Event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    player_var = noone;
    spd_mult_var = 0;
    // Alarm
    alarm_len_var = 1;
    set_alarm_scr(0,15);
');
// Alarm 0 Event
object_event_add
(argument0,ev_alarm,0,'
    instance_destroy();
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    with player_var // Can be singular player or player_obj
    { spd_mult_var = other.spd_mult_var; }
');