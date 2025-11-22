// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Prop collisions
global.table_coll[0] = prop_to_coll_scr(0,table_mdl_path);
// Create event
object_event_add
(argument0,ev_create,0,'
    store_tex_var = wood_03_bg_tex;
    event_inherited();
    solid_var = true;
    mdl_var = table_mdl;
    mdl_path_var = table_mdl_path;
    // For grid (I dont really know how wide it is)
    w_var = 16;
    l_var = w_var;
    h_var = 9.5;
    // Collisions
    coll_var[0] = global.table_coll[0];
');