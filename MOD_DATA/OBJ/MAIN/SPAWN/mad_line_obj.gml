// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    snap_var = 1; // Snap to floor
    if instance_exists(load_par_obj)
    { store_tex_var = background_get_texture(load_par_obj.bg_arr_var[19,0]); }
    event_inherited();
    solid_var = false;
    type_var = 4; // Floor
    w_var = 4;
    l_var = 28;
    dist_var = 0.1;
');