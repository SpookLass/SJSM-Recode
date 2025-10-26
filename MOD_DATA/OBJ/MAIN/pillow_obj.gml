// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Make collisions
global.pillow_coll[1] = 1;
global.pillow_coll[2] = 5;
global.pillow_coll[3] = 16;
global.pillow_coll[0] = prop_to_coll_scr(2,"",global.pillow_coll[2],global.pillow_coll[3],global.pillow_coll[1]);
// Create event
object_event_add
(argument0,ev_create,0,'
    store_tex_var = basic_bg_tex;
    event_inherited();
    solid_var = false;
    type_var = 2; // Box
    w_var = 5;
    l_var = 16;
    h_var = 1;
    // Collisions
    coll_var[0] = global.pillow_coll[0];
    coll_var[1] = global.pillow_coll[1];
    coll_var[2] = global.pillow_coll[2];
    coll_var[3] = global.pillow_coll[3];
');