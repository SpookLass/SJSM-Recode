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
    store_tex_02_var = '+string(argument2.bg_arr_var[argument4,4])+'
    mdl_var = '+string(argument2.bg_arr_var[argument5,0])+'
    event_inherited();
    solid_var = false;
    // For grid (I dont really know how wide it is)
    w_var = 32;
    l_var = 0;
    h_var = 24;
    dist_var = 0.5;
    mdl_path_var = par_var.bg_arr_var['+string(argument5)+',1];
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