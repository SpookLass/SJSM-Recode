// Builtin Variables
object_set_depth(argument0,-99);
object_set_mask(argument0,noone);
object_set_parent(argument0,arr_color_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,"
    dist_var = 32;
    color_len_var = 8;
    color_arr[0] = make_color_rgb(25,25,25);
    color_arr[1] = make_color_rgb(153,217,234);
    color_arr[2] = make_color_rgb(0,162,232);
    color_arr[3] = make_color_rgb(181,230,29);
    color_arr[4] = c_white;
    color_arr[5] = make_color_rgb(255,201,14);
    color_arr[6] = make_color_rgb(253,102,102);
    color_arr[7] = make_color_rgb(255,174,201);
    event_inherited();
");

