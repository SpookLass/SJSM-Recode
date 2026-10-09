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
    par_var = '+string(argument2)+'
    spr_var = '+string(argument2.spr_arr_var[argument3,0])+'
    event_inherited();
    solid_var = false;
    // Draw
    type_var = 4; // Floor
    w_var = 32;
    l_var = 32;
    h_var = 32;
    dist_var = 0.15;
    store_tex_var = sprite_get_texture(spr_var,'+string(argument4)+'); // 0
');