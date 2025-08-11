// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,"
    event_inherited();
    mdl_var = table_mdl;
    mdl_path_var = table_mdl_path;
    stored_tex_var = table_bg_tex;
    tex_var = stored_tex_var;
");