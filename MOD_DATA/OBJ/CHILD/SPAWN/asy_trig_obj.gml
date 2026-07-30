object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,spawn_trig_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Create
object_event_add
(argument0,ev_create,0,'
    if global.diff_var == 0 { instance_destroy(); exit; }
    event_inherited();
');
// User 0
object_event_add
(argument0,ev_other,ev_user0,'
    fmod_update_take_over_when_lock_scr();
    if ds_list_find_index(mon_list,ringu_obj) < 0
    { ds_list_add(mon_list,ringu_obj); }
    with spawn_door_trig_obj { lock_var = true; }
    with instance_create(0,0,bab_obj)
    {
        x = mark_arr[0,0];
        y = mark_arr[0,1];
        z = mark_arr[0,2];
        event_perform(ev_alarm,0);
        set_alarm_scr(0,-1);
        enter_var = false;
        if type_var > 0 { do_coll_var = mon_solid_const; }
    }
    global.last_time_var = current_time;
    fmod_update_take_over_done_scr();
    if global.reset_spd_var > 0 && global.game_spd_var > 1
    { global.game_spd_var = 1; fmod_group_set_pitch_scr(0,global.game_spd_var); }
    local.len = 0; local.xtmp = 0; local.ytmp = 0; local.ztmp = 0;
    with asy_cage_fake_obj { set_alarm_scr(0,alarm_var); local.len += 1; local.xtmp += x; local.ytmp += y; local.ztmp += z; }
    if local.len > 0 && instance_exists(load_par_obj)
    {
        local.xtmp /= local.len; local.ytmp /= local.len; local.ztmp /= local.len;
        fmod_snd_3d_play_scr(load_par_obj.snd_arr_var[2,0],local.xtmp,local.ytmp,local.ztmp);
    }
');