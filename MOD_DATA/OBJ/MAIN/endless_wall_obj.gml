// Builtin Variables
object_set_depth(argument0,0);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    store_tex_var = -1;
    event_inherited();
    solid_var = true;
    type_var = 1;
    w_var = 32;
    h_var = 32;
    radius_var = 0;
    // Collisions
    coll_var[0] = fake_wall_coll[0];
    coll_var[1] = fake_wall_coll[1];
    coll_var[2] = fake_wall_coll[2];
    // Movement
    yaw_var = 0;
');