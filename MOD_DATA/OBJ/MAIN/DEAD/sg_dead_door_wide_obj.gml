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
        store_tex_var = background_get_texture(load_par_obj.bg_arr_var[6,0]);
        store_tex_02_var = background_get_texture(load_par_obj.bg_arr_var[7,0]);
        mdl_var = load_par_obj.mdl_arr_var[2,0];
        mdl_path_var = load_par_obj.mdl_arr_var[2,1];
    }
    event_inherited();
    solid_var = false;
    // For grid (I dont really know how wide it is)
    w_var = 32;
    l_var = 0;
    h_var = 24;
    dist_var = 0.5;
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    type_var = 10; // Single Plane
    tex_var = store_tex_var;
    event_inherited();
    type_var = 0; // Model
    tex_var = store_tex_02_var;
    event_inherited();
');