// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,slime_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    if global.diff_var == 0 { instance_destroy(); exit; }
    par_var = '+string(argument2)+'
    event_inherited();
    tex_var = '+string(argument2.bg_arr_var[argument3,4])+'
');