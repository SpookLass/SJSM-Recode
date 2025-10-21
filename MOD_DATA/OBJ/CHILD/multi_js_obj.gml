object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,js_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Create event
object_event_add
(argument0,ev_create,0,"
    chance_num_var = 1;
    chance_den_var = 1;
    trig_var = -1;
    event_inherited();
");