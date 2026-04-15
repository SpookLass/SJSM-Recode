// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Prop collisions
globalvar bar_vert_coll;
global.bar_vert_coll[1] = 32;
global.bar_vert_coll[2] = 2;
global.bar_vert_coll[3] = 32;
p3dc_set_trimask_scr(mask_metal_const);
global.bar_vert_coll[0] = prop_to_coll_scr(2,bar_vert_mdl_path,global.bar_vert_coll[2],global.bar_vert_coll[3],global.bar_vert_coll[1],true,0,0);
p3dc_set_trimask_scr(mask_basic_const);
// Create event
object_event_add
(argument0,ev_create,0,'
    store_tex_var = metal_02_bg_tex;
    event_inherited();
    solid_var = true;
    mdl_var = bar_vert_mdl;
    mdl_path_var = bar_vert_mdl_path;
    // For grid
    w_var = 2;
    l_var = 32;
    h_var = 32;
    // Collisions
    coll_var[0] = global.bar_vert_coll[0];
    coll_var[1] = global.bar_vert_coll[1];
    coll_var[2] = global.bar_vert_coll[2];
    coll_var[3] = global.bar_vert_coll[3];
');