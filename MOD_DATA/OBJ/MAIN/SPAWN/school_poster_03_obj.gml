// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Doodles
// Create event
object_event_add
(argument0,ev_create,0,'
    if instance_exists(load_par_obj) { store_tex_var = sprite_get_texture(load_par_obj.spr_arr_var[0,0],4); }
    event_inherited();
    type_var = 10; // Single Plane
    z = 10;
    w_var = 12;
    h_var = 12;
    dist_var = 0.2;
    direction = 180;
');