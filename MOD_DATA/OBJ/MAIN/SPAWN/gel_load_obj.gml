// Builtin Variables
object_set_depth(argument0,100);
object_set_mask(argument0,noone);
object_set_parent(argument0,load_par_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Create Event
object_event_add
(argument0,ev_create,0,'
    menu_var = false;
    bg_len_var = 1;
    bg_arr_var[0,1] = main_directory_const+"\BG\MON\gel_slime_bg.png";
    bg_arr_var[0,2] = false;
    bg_arr_var[0,3] = false;
    rm_var = gel_rm;
    event_inherited();
');