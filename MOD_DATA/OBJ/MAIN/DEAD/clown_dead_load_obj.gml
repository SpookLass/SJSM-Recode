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
    menu_var = true;
    bg_len_var = 8;
    bg_arr_var[0,1] = clown_wall_bg_path;
    bg_arr_var[0,2] = false;
    bg_arr_var[0,3] = false;
    bg_arr_var[1,1] = clown_floor_bg_path;
    bg_arr_var[1,2] = false;
    bg_arr_var[1,3] = false;
    bg_arr_var[2,1] = east_ceil_bg_path;
    bg_arr_var[2,2] = false;
    bg_arr_var[2,3] = false;
    bg_arr_var[3,1] = clown_cage_bg_path;
    bg_arr_var[3,2] = false;
    bg_arr_var[3,3] = false;
    bg_arr_var[4,1] = dh_door_bg_path;
    bg_arr_var[4,2] = false;
    bg_arr_var[4,3] = false;
    bg_arr_var[5,1] = gh_trim_bg_path;
    bg_arr_var[5,2] = false;
    bg_arr_var[5,3] = false;
    bg_arr_var[6,1] = dh_window_bg_path;
    bg_arr_var[6,2] = false;
    bg_arr_var[6,3] = false;
    bg_arr_var[7,1] = dh_table_bg_path;
    bg_arr_var[7,2] = false;
    bg_arr_var[7,3] = false;
    spr_len_var = 1;
    spr_arr_var[0,1] = clown_spr_path;
    spr_arr_var[0,2] = 6;
    spr_arr_var[0,3] = false;
    spr_arr_var[0,4] = false;
    spr_arr_var[0,5] = 0;
    spr_arr_var[0,6] = 0;
    snd_len_var = 1;
    snd_arr_var[0,1] = clown_dead_snd_path;
    snd_arr_var[0,2] = false;
    snd_arr_var[0,3] = snd_group_mus_const;
    snd_arr_var[0,4] = 1;
    snd_arr_var[0,5] = 0;
    snd_arr_var[0,6] = 0;
    mdl_len_var = 8;
    mdl_arr_var[0,1] = clown_cage_mdl_path;
    mdl_arr_var[1,1] = dh_door_01_mdl_path;
    mdl_arr_var[2,1] = dh_doorframe_01_mdl_path;
    mdl_arr_var[3,1] = dh_doorframe_02_mdl_path;
    mdl_arr_var[4,1] = dh_pillar_01_mdl_path;
    mdl_arr_var[5,1] = dh_window_01_mdl_path;
    mdl_arr_var[6,1] = dh_window_02_mdl_path;
    mdl_arr_var[7,1] = dh_table_01_mdl_path;
    rm_var = clown_dead_rm;
    global.can_pause_var = false;
    event_inherited();
');
// Destroy Event
object_event_add
(argument0,ev_destroy,0,'
    global.can_pause_var = true;
    event_inherited();
');