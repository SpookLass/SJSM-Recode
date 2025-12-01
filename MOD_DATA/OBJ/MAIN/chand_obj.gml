// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Make collisions
global.chand_coll[1] = -32;
global.chand_coll[2] = 32;
global.chand_coll[0] = prop_to_coll_scr(11,"",global.chand_coll[2],0,global.chand_coll[1]);
// Create event
object_event_add
(argument0,ev_create,0,'
    snap_var = 2; // Snap to ceiling
    store_tex_var = background_get_texture(chand_bg);
    event_inherited();
    type_var = 11;
    direction = 45;
    w_var = 32;
    h_var = -32; // Hang down
    solid_var = false;
    // Collisions
    coll_var[0] = global.chand_coll[0];
    coll_var[1] = global.chand_coll[1];
    coll_var[2] = global.chand_coll[2];
');