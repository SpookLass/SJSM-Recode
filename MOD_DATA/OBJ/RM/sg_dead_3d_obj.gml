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
    store_tex_var = '+string(argument2.bg_arr_var[argument3,4])+'
    mdl_var = '+string(argument2.mdl_arr_var[argument4,0])+'
    mdl_path_var = '+string(argument2.mdl_arr_var[argument4,1])+'
    event_inherited();
    solid_var = false;
    // For grid (I dont really know how wide it is)
    w_var = 8;
    l_var = 8;
    h_var = 20;
    direction = 180;
');