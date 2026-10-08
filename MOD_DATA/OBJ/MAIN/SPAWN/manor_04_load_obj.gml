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
    bg_arr_var[0,1] = manor_pass_03_bg_path;
    bg_arr_var[0,2] = false;
    bg_arr_var[0,3] = false;
    // Room
    rm_len_var = 1;
    rm_arr_var[0,1] = manor_04_rm_path;
    rm_arr_var[0,2] = -1;
    rm_arr_var[0,3] = 0;
    obj_len_var = 2;
    obj_arr_var[0,1] = manor_pass_obj_path;
    obj_arr_var[0,2] = -1;
    obj_arr_var[0,3] = 1;
    obj_arr_var[0,4] = 0;
    obj_arr_var[1,1] = spooky_04_obj_path;
    obj_arr_var[1,2] = -1;
    obj_arr_var[1,3] = 0;
    rm_var = 0;
    event_inherited();
');