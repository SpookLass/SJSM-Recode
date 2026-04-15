// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Prop collision
globalvar chair_coll;
global.chair_coll[1] = 6;
global.chair_coll[2] = 6;
global.chair_coll[3] = 6;
global.chair_coll[0] = prop_to_coll_scr(2,chair_mdl_path,global.chair_coll[2],global.chair_coll[3],global.chair_coll[1],true,0,0);
// Create event
object_event_add
(argument0,ev_create,0,'
    store_tex_var = wood_03_bg_tex;
    event_inherited();
    solid_var = true;
    mdl_var = chair_mdl;
    mdl_path_var = chair_mdl_path;
    // For grid
    w_var = 7;
    l_var = w_var;
    h_var = 12; // Not sure
    // Collisions
    coll_var[0] = global.chair_coll[0];
    coll_var[1] = global.chair_coll[1];
    coll_var[2] = global.chair_coll[2];
    coll_var[3] = global.chair_coll[3];
');