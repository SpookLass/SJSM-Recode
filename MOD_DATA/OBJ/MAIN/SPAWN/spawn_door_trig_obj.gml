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
    rm_var = noone;
    rm_count_var = 0;
    spawn_var = 0;
    event_inherited();
');
// Alarm 0 Event
object_event_add
(argument0,ev_alarm,0,'
    global.spawn_var = spawn_var;
    event_inherited();
');