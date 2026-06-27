// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    // Texture
    if instance_exists(load_par_obj)
    { store_tex_var = background_get_texture(load_par_obj.bg_arr_var[12,0]); }
    event_inherited();
    w_var = 20;
    h_var = 20;
    z = 16.6667; // 16.r6
    dist_var = 0.05;
    direction = 180;
    type_var = 10;
');