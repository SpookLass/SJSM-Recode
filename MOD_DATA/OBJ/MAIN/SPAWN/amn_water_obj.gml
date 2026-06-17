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
    color_var = true;
    event_inherited();
    z_base_var = 10;
    deep_per_var = 1;
    grav_mult_var = 1;
    // Calculate height
    local.floorz = noone;
    local.ceilz = noone;
    with floor_par_obj { if (z < local.floorz || local.floorz == noone) && solid_var == 1 { local.floorz = z; }}
    with ceil_par_obj { if (z < local.ceilz || local.ceilz == noone) && solid_var == 1 { local.ceilz = z; }}
    if local.floorz != noone { z_base_var += local.floorz; }
    if local.ceilz != noone { z_base_var = min(z_base_var,local.ceilz-22); }
    z = z_base_var;
    z_mult_var = 0.2;
    spd_base_var = 0.02;
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    path_speed = spd_base_var*global.delta_time_var;
    if z_mult_var > 0
    { z = z_base_var+(x*z_mult_var); } // I guess, jank as hell
');