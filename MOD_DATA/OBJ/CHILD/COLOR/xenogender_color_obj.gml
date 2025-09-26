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
    color_len_var = 7;
    color_arr[0] = make_color_rgb(255,102,145);
    color_arr[1] = make_color_rgb(255,153,151);
    color_arr[2] = make_color_rgb(255,183,130);
    color_arr[3] = make_color_rgb(251,255,166);
    color_arr[4] = make_color_rgb(132,187,255);
    color_arr[5] = make_color_rgb(156,132,255);
    color_arr[6] = make_color_rgb(163,23,255);
    event_inherited();
");

