// Builtin Variables
object_set_depth(argument0,-2);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    store_tex_var = ds_list_find_value(art_list,irandom(ds_list_size(art_list)-1));
    event_inherited();
    solid_var = false;
    type_var = 6; // Double Plane
    w_var = 16.6;
    h_var = 9.2;
    z = 15.4;
    dist_var = 0.3;
');