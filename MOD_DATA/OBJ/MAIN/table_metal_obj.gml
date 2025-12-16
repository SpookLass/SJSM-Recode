// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Prop collisions
p3dc_set_trimask_scr(mask_metal_const);
global.table_coll[0] = prop_to_coll_scr(0,table_old_mdl_path);
p3dc_set_trimask_scr(mask_basic_const);
// Create event
object_event_add
(argument0,ev_create,0,'
    store_tex_var = machine_02_bg_tex;
    event_inherited();
    solid_var = true;
    mdl_var = table_old_mdl;
    mdl_path_var = table_old_mdl_path;
    // For grid (I dont really know how wide it is)
    w_var = 16;
    l_var = w_var;
    // Collisions
    coll_var[0] = global.table_coll[0];
');