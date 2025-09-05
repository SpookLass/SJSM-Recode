// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Prop collisions
execute_string("global.chair_coll[0] = prop_to_coll_scr(0,chair_mdl_path);");
// Create event
object_event_add
(argument0,ev_create,0,"
    stored_tex_var = table_bg_tex;
    event_inherited();
    solid_var = true;
    mdl_var = chair_mdl;
    mdl_path_var = chair_mdl_path;
    // For grid
    w_var = 8;
    l_var = w_var;
    // Collisions
    coll_var[0] = global.chair_coll[0];
");