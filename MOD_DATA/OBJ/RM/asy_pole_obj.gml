// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,pole_metal_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    par_var = '+string(argument2)+'
    store_tex_var = '+string(argument2.bg_arr_var[argument3,4])+'
    tex_var = store_tex_var;
    tex_h_var = 16; // 4?
');