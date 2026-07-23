// Builtin Variables
object_set_depth(argument0,1);
object_set_mask(argument0,noone);
object_set_parent(argument0,floor_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    if instance_exists(load_par_obj)
    { store_tex_var = background_get_texture(load_par_obj.bg_arr_var[15,0]); }
    event_inherited();
');
// Draw event
object_event_add
(argument0,ev_draw,0,'
    if global.fog_dark_var { d3d_set_fog(false,c_black,0,0); }
    event_inherited();
    if global.fog_dark_var 
    { d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var); }
');