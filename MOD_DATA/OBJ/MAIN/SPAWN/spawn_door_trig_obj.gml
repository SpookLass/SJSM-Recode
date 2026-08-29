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
    rm_spawn_var = 0;
    zone_var = -2; // To make sure others dont copy
    event_inherited();
    auto_var = false;
');
// Alarm 0 Event
object_event_add
(argument0,ev_alarm,0,'
    global.spawn_var = rm_spawn_var;
    event_inherited();
');