// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Subject 1
// Create event
object_event_add
(argument0,ev_create,0,'
    if instance_exists(load_par_obj) { store_tex_var = background_get_texture(load_par_obj.bg_arr_var[11,0]); }
    event_inherited();
    type_var = 10; // Single Plane
    z = 9;
    w_var = 32;
    h_var = 21;
    tex_w_var = 2;
    dist_var = 0.2;
    direction = 180;
');