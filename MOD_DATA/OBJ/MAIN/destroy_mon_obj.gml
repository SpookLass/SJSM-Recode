// Builtin Variables
object_set_depth(argument0,99);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    with mon_par_obj { instance_destroy(); }
    ds_list_clear(global.mon_curr_list);
    instance_destroy();
    global.mon_fail_var = 0;
');