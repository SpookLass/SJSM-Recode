// Builtin Variables
object_set_depth(argument0,-4);
object_set_mask(argument0,noone);
object_set_parent(argument0,water_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    store_tex_var = water_bg_tex;
    event_inherited();
    local.bestz = 0;
    with floor_par_obj { if z < local.bestz { local.bestz = z; }}
    z_base_var = local.bestz+10;
    z = z_base_var;
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    path_speed = 0.02*global.delta_time_var;
    z = z_base_var+(x*0.2); // I guess, jank as hell
');