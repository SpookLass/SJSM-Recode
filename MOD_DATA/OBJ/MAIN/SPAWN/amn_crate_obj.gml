// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Collisions
globalvar amn_crate_coll;
amn_crate_coll[1] = 12;
amn_crate_coll[2] = 32;
amn_crate_coll[3] = 32;
amn_crate_coll[0] = prop_to_coll_scr(0,main_directory_const+"\MDL\RM\amn_crate_coll_mdl.gmmod",amn_crate_coll[2],amn_crate_coll[3],amn_crate_coll[1]);
// Create event
object_event_add
(argument0,ev_create,0,'
    store_tex_var = crate_bg_tex;
    event_inherited();
    solid_var = player_solid_const;
    w_var = 12;
    h_var = 12;
    l_var = 12;
    type_var = 2;
    // Collisions
    coll_var[0] = amn_crate_coll[0];
    coll_var[1] = amn_crate_coll[1];
    coll_var[2] = amn_crate_coll[2];
    coll_var[3] = amn_crate_coll[3];
');