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
    store_tex_var = choose(wire_01_bg_tex,wire_02_bg_tex,wire_03_bg_tex);
    event_inherited();
    solid_var = false;
    type_var = 6; // Double Plane
    w_var = 32;
    h_var = 32;
    dist_var = 0.1;
');