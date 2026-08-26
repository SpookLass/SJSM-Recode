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
    mon_var = stem_obj;
    bg_len_var = 3;
    bg_arr_var[0,1] = kh_basement_wall_bg_path;
    bg_arr_var[0,2] = false;
    bg_arr_var[0,3] = false;
    bg_arr_var[1,1] = kh_basement_floor_bg_path;
    bg_arr_var[1,2] = false;
    bg_arr_var[1,3] = false;
    bg_arr_var[2,1] = kh_basement_ceil_bg_path;
    bg_arr_var[2,2] = false;
    bg_arr_var[2,3] = false;
    rm_len_var = 1;
    rm_arr_var[0,1] = generic_spawn_rm_path;
    obj_len_var = 1;
    obj_arr_var[0,1] = generic_spawn_trig_obj_path;
    rm_var = 0;
    event_inherited();
');