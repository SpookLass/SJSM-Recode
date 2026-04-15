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
(argument0,ev_create,0,'
    if instance_exists(load_par_obj)
    {
        store_tex_var = background_get_texture(load_par_obj.bg_arr_var[3,0]);
        mdl_var = load_par_obj.mdl_arr_var[0,0];
        mdl_path_var = load_par_obj.mdl_arr_var[0,1];
    }
    event_inherited();
    solid_var = false;
    direction = 90;
    // For grid (I dont really know how wide it is)
    w_var = 32;
    l_var = 32;
    h_var = 32;
');