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
    if ds_list_find_index(global.mon_list,ringu_obj) < 0
    { ds_list_add(global.mon_list,ringu_obj); }
    with spawn_door_trig_obj { lock_var = true; }
    instance_create(0,0,ringu_obj);
    global.last_time_var = current_time;
    fmod_update_take_over_done_scr();
    if global.reset_spd_var > 0 && global.game_spd_var > 1
    { global.game_spd_var = 1; fmod_group_set_pitch_scr(0,global.game_spd_var); }
');