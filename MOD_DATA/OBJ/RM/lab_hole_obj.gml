// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,hole_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    par_var = '+string(argument2)+'
    if global.diff_var == 0 { instance_destroy(); exit; }
    event_inherited();
    on_var = false;
    // Texture
    tex_var = '+string(argument2.bg_arr_var[argument3,4])+'
');