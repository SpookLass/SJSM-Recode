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
    color_len_var = 5;
    color_arr[0] = make_color_hsv(232,252,212);
    color_arr[1] = color_arr[0]
    color_arr[2] = make_color_hsv(215,125,153);
    color_arr[5] = color_arr[2];
    color_arr[3] = make_color_hsv(156,255,166);
    color_arr[4] = color_arr[3];
    event_inherited();
");

