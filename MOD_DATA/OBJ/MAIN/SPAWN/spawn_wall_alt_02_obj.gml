// Builtin Variables
object_set_depth(argument0,0);
object_set_mask(argument0,noone);
object_set_parent(argument0,wall_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    if instance_exists(load_par_obj)
    {
        local.bg = load_par_obj.bg_arr_var[6,0];
        store_tex_var = background_get_texture(local.bg);
        event_inherited();
        tex_h_var = background_get_width(local.bg)/background_get_height(local.bg);
    }
    else { event_inherited(); }
');