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
    bg_len_var = 1;
    bg_arr_var[0,1] = wf_body_bg_path;
    bg_arr_var[0,2] = false;
    bg_arr_var[0,3] = false;
    spr_len_var = 1;
    spr_arr_var[0,1] = killer_static_02_spr_path;
    spr_arr_var[0,2] = 6;
    spr_arr_var[0,3] = false;
    spr_arr_var[0,4] = false;
    spr_arr_var[0,5] = 0;
    spr_arr_var[0,6] = 0;
    snd_len_var = 6;
    snd_arr_var[0,1] = wf_txt_01_snd_path;
    snd_arr_var[0,2] = false;
    snd_arr_var[0,3] = snd_group_sfx_const;
    snd_arr_var[0,4] = 1;
    snd_arr_var[0,5] = 0;
    snd_arr_var[0,6] = 0;
    snd_arr_var[1,1] = wf_txt_02_snd_path;
    snd_arr_var[1,2] = false;
    snd_arr_var[1,3] = snd_group_sfx_const;
    snd_arr_var[1,4] = 1;
    snd_arr_var[1,5] = 0;
    snd_arr_var[1,6] = 0;
    snd_arr_var[2,1] = wf_txt_03_snd_path;
    snd_arr_var[2,2] = false;
    snd_arr_var[2,3] = snd_group_sfx_const;
    snd_arr_var[2,4] = 1;
    snd_arr_var[2,5] = 0;
    snd_arr_var[2,6] = 0;
    snd_arr_var[3,1] = wf_txt_04_snd_path;
    snd_arr_var[3,2] = false;
    snd_arr_var[3,3] = snd_group_sfx_const;
    snd_arr_var[3,4] = 1;
    snd_arr_var[3,5] = 0;
    snd_arr_var[4,6] = 0;
    snd_arr_var[4,1] = wf_txt_05_snd_path;
    snd_arr_var[4,2] = false;
    snd_arr_var[4,3] = snd_group_sfx_const;
    snd_arr_var[4,4] = 1;
    snd_arr_var[4,5] = 0;
    snd_arr_var[4,6] = 0;
    snd_arr_var[5,1] = wf_txt_06_snd_path;
    snd_arr_var[5,2] = false;
    snd_arr_var[5,3] = snd_group_sfx_const;
    snd_arr_var[5,4] = 1;
    snd_arr_var[5,5] = 0;
    snd_arr_var[5,6] = 0;
    rm_var = wf_dead_3d_rm;
    global.can_pause_var = false;
    event_inherited();
');
// Destroy Event
object_event_add
(argument0,ev_destroy,0,'
    global.can_pause_var = true;
    event_inherited();
');