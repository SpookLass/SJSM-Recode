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
    color_len_var = 12;
    color_arr[0] = make_color_rgb(196,121,162);
    color_arr[1] = make_color_rgb(237,165,205);
    color_arr[2] = make_color_rgb(213,199,232);
    color_arr[3] = make_color_rgb(154,199,232);
    color_arr[4] = color_arr[2];
    color_arr[5] = make_color_rgb(154,199,232);
    color_arr[6] = make_color_rgb(109,130,209);
    color_arr[7] = color_arr[5];
    color_arr[8] = color_arr[2];
    color_arr[9] = color_arr[3];
    color_arr[10] = color_arr[2];
    color_arr[11] = color_arr[1];
    event_inherited();
");

