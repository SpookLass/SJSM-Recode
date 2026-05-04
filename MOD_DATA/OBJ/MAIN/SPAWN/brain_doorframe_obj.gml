// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,door_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    if instance_exists(load_par_obj)
    {
        store_tex_var = background_get_texture(load_par_obj.bg_arr_var[4,0]);
        mdl_var = load_par_obj.mdl_arr_var[3,0];
    }
    tex_var = store_tex_var;
    type_var = 0; // Model
    //type_var = 10; // Single Plane
    w_var = 20.75;
    h_var = 24;
    dist_var = 0.1;
    open_var = true;
');