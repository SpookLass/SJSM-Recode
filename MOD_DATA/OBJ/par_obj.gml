// Builtin Variables
object_set_depth(argument0,0);
object_set_mask(argument0,noone);
object_set_parent(argument0,noone);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Begin Step
object_event_add
(argument0,ev_step,ev_step_begin,"
    // Update alarms
    update_alarm_scr(global.delta_time_var);
");
// Room End 
object_event_add
(argument0,ev_other,ev_room_end,'
    // Reset alarms
    reset_alarm_scr();
');