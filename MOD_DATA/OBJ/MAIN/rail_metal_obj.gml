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
(argument0,ev_create,0,"
    stored_tex_var = rail_metal_bg_tex;
    event_inherited();
    type_var = 1;
    w_var = 32;
    h_var = 14;
    radius_var = 3;
");