// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Prop collisions
execute_string
("
    global.runner_coll[1] = -4;
    global.runner_coll[2] = 4;
    global.runner_coll[3] = 32;
    global.runner_coll[0] = prop_to_coll_scr(7,'',global.runner_coll[2],global.runner_coll[3],global.runner_coll[1]);
");
// Create event
object_event_add
(argument0,ev_create,0,"
    store_tex_var = metal_01_bg_tex;
    snap_var = 2;
    event_inherited();
    solid_var = true;
    no_grid_var = true; // Don't stop pathfinding
    type_var = 7; // Better Block
    w_var = 4;
    l_var = 32;
    h_var = -4;
    tex_w_var = 1;
    tex_l_var = 2;
    tex_h_var = 1;
    // Collisions
    coll_var[0] = global.runner_coll[0];
    coll_var[1] = global.runner_coll[1];
    coll_var[2] = global.runner_coll[2];
    coll_var[3] = global.runner_coll[3];
");