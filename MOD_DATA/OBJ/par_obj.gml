// Builtin Variables
object_set_depth(argument0,0);
object_set_mask(argument0,noone);
object_set_parent(argument0,noone);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create
object_event_add
(argument0,ev_create,0,'
    var alarm_arr;
    alarm_len_var = 0;
    true_time_var = false;
');
// Begin Step
object_event_add
(argument0,ev_step,ev_step_begin,'
    // Update alarms
    if true_time_var { update_alarm_scr(global.true_delta_time_var); }
    else { update_alarm_scr(global.delta_time_var); }
');
// Room End 
object_event_add
(argument0,ev_other,ev_room_end,'
    // Reset alarms
    reset_alarm_scr();
');