// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,rail_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,"
    direction = 90;
    store_tex_var = rail_metal_bg_tex;
    event_inherited();
    coll_var[0] = global.rail_metal_coll[0];
");