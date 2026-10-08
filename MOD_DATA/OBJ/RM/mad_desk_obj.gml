// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,school_desk_teacher_obj);
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
        store_tex_var = background_get_texture(load_par_obj.bg_arr_var[27,0]);
        tex_var = store_tex_var;
        store_tex_02_var = background_get_texture(load_par_obj.bg_arr_var[28,0]);
        tex_02_var = store_tex_02_var;
    }
    direction = 0;
');