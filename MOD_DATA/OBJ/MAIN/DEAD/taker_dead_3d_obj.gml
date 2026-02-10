// Builtin Variables
object_set_depth(argument0,-100);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    spot_alarm_var = 221.4; // 240
    inst_var = fmod_snd_loop_scr(taker_mus_snd);
    spot_bg_var = background_add(vanilla_directory_const+"\TEX\mobile\MB5_20_tex.png",false,false);
    spot_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\DEAD\taker_spot_snd.wav",true);
    fmod_snd_set_minmax_dist_scr(spot_snd_var,0,600)
    load_var = true;
    // Alarm
    alarm_len_var = 2;
    set_alarm_scr(0,spot_alarm_var);
');
// Room start event
object_event_add
(argument0,ev_other,ev_room_start,'
    event_inherited();
    spot_len_var = 0;
    with taker_dead_spot_obj { if spot_id_var+1 > other.spot_len_var { other.spot_len_var = spot_id_var+1; }}
');
// Destroy
object_event_add
(argument0,ev_destroy,0,'
    event_user(0);
');
// Room end event
object_event_add
(argument0,ev_other,ev_room_end,'
    event_user(0);
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if global.input_press_arr[confirm_input_const,global.dead_player_var] == 1
    || global.input_press_arr[back_input_const,global.dead_player_var] == 1
    { rm_goto_menu_scr(taker_dead_rm,true); }
');
// Delete background
object_event_add
(argument0,ev_other,ev_user0,'
    fmod_inst_stop_scr(inst_var);
    if load_var
    {
        background_delete(spot_bg_var);
        fmod_snd_free_scr(spot_snd_var);
        load_var = false;
    }
');
// Alarm 0
object_event_add
(argument0,ev_alarm,0,'
    with taker_dead_spot_obj
    { if spot_id_var == other.spot_id_var { event_user(0); break; }}
    if spot_id_var == spot_len_var-1
    {
        with taker_dead_door_obj
        { visible = true; }
    }
    spot_id_var += 1;
    if spot_id_var < spot_len_var { set_alarm_scr(0,spot_alarm_var); }
    else { set_alarm_scr(1,spot_alarm_var); }
');
// Alarm 1
object_event_add
(argument0,ev_alarm,1,'
    with taker_dead_door_obj
    { event_user(0); }
    instance_create(taker_dead_door_obj.x,taker_dead_door_obj.y,dead_taker_obj);
');