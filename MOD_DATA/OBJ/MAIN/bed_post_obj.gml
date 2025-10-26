// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Prop collisions
global.bed_post_coll[0] = prop_to_coll_scr(0,bed_post_mdl_path);
// Create event
object_event_add
(argument0,ev_create,0,"
    store_tex_var = wood_01_bg_tex;
    event_inherited();
    solid_var = true;
    mdl_var = bed_post_mdl;
    mdl_path_var = bed_post_mdl_path;
    // For grid (I don't really know how wide it is)
    w_var = 30;
    l_var = 20;
    // Collisions
    coll_var[0] = global.bed_post_coll[0];
");