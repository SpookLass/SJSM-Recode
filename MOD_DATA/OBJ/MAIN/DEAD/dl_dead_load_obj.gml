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
    bg_len_var = 2;
    bg_arr_var[0,1] = woods_shrine_wall_bg_path;
    bg_arr_var[0,2] = false;
    bg_arr_var[0,3] = false;
    bg_arr_var[1,1] = dl_dead_bg_path;
    bg_arr_var[1,2] = false;
    bg_arr_var[1,3] = false;
    spr_len_var = 2;
    spr_arr_var[0,1] = dl_open_spr_path;
    spr_arr_var[0,2] = 4;
    spr_arr_var[0,3] = false;
    spr_arr_var[0,4] = false;
    spr_arr_var[0,5] = 0;
    spr_arr_var[0,6] = 0;
    spr_arr_var[1,1] = choose(dl_eff_01_spr_path,dl_eff_02_spr_path);
    spr_arr_var[1,2] = 24;
    spr_arr_var[1,3] = false;
    spr_arr_var[1,4] = false;
    spr_arr_var[1,5] = 0;
    spr_arr_var[1,6] = 0;
    snd_len_var = 2;
    snd_arr_var[0,1] = dl_dead_snd_path;
    snd_arr_var[0,2] = false;
    snd_arr_var[0,3] = snd_group_mus_const;
    snd_arr_var[0,4] = 1;
    snd_arr_var[0,5] = 0;
    snd_arr_var[0,6] = 0;
    snd_arr_var[1,1] = choose(dl_eff_01_snd_path,dl_eff_02_snd_path,dl_eff_03_snd_path,dl_eff_04_snd_path);
    snd_arr_var[1,2] = false;
    snd_arr_var[1,3] = snd_group_mon_const;
    snd_arr_var[1,4] = 1;
    snd_arr_var[1,5] = 0;
    snd_arr_var[1,6] = 0;
    mdl_len_var = 1;
    mdl_arr_var[0,1] = dl_dead_mdl_path;
    rm_var = dl_dead_3d_rm;
    global.can_pause_var = false;
    event_inherited();
    fmod_snd_set_group_scr(snd_arr_var[0,0],snd_group_mus_const);
    fmod_snd_loop_scr(snd_arr_var[0,0]);
');
// Destroy Event
object_event_add
(argument0,ev_destroy,0,'
    global.can_pause_var = true;
    event_inherited();
');