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
    event_inherited();
    // Replace sunrise / sunset with night if Dollhouse not present
    if global.dh_var { local.night = (global.clock_hour_var <= 5 || global.clock_hour_var >= 19); }
    else { local.night = (global.clock_hour_var <= 6 || global.clock_hour_var >= 18); }
    // Skyboxes
    if local.night || ele_prog_scr(global.rm_count_var) <= 0 { instance_create(0,0,skybox_obj); } // Night
    else if global.clock_hour_var > 6 && global.clock_hour_var < 18 { instance_create(0,0,skybox_fake_obj); } // Day
    else { instance_create(0,0,skybox_dh_obj); } // Sunrise / Sunset
    instance_destroy();
');