// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    type_var = 10; // Single Plane
    w_var = 16;
    h_var = 24;
    dist_var = 0.1;
    z = z_start_var;
    alarm_len_var = 1;
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if alarm_arr[0,0] > 0
    { z = lerp_scr(z_end_var,z_start_var,alarm_arr[0,0]/alarm_arr[0,1]); }
');
// Alarm 0 Event
object_event_add
(argument0,ev_alarm,0,'
    z = z_end_var;
');