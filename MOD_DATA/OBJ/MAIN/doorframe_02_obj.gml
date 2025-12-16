// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Prop collisions
global.doorframe_02_coll[0] = prop_to_coll_scr(0,doorframe_02_mdl_path);
// Create event
object_event_add
(argument0,ev_create,0,'
    store_tex_var = -1;
    event_inherited();
    solid_var = true;
    mdl_var = doorframe_02_mdl;
    mdl_path_var = doorframe_02_mdl_path;
    no_grid_var = true;
    // Collisions
    coll_var[0] = global.doorframe_02_coll[0];
');