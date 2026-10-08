// Builtin Variables
object_set_depth(argument0,object_get_depth(argument3));
object_set_mask(argument0,noone);
object_set_parent(argument0,argument3);
object_set_persistent(argument0,object_get_persistent(argument3));
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,object_get_visible(argument3));
// Create event
object_event_add
(argument0,ev_create,0,'
    direction = 270;
    event_inherited();
');