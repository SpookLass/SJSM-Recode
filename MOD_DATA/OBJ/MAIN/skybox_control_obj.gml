// Builtin Variables
object_set_depth(argument0,98);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    // Day
    if current_hour <= 5 || current_hour >= 19 || global.rm_count_var < 100 { instance_create(0,0,skybox_obj); } // Night
    else if current_hour > 6 || current_hour < 18 { instance_create(0,0,skybox_fake_obj); } // Day
    else { instance_create(0,0,skybox_dh_obj); } // Sunrise / Sunset
');