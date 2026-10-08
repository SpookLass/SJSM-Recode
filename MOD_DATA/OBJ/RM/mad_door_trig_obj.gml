// Builtin Variables
object_set_depth(argument0,-100);
object_set_mask(argument0,noone);
object_set_parent(argument0,spawn_leave_door_trig_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Alarm 0 Event
object_event_add
(argument0,ev_alarm,0,'
    if global.diff_var != 0 { with mon_spawn_locale_scr(flesh_obj,0,0,0,false) { dur_var += 1; }}
    event_inherited();
');