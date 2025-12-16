// Builtin Variables
object_set_depth(argument0,-100);
object_set_mask(argument0,noone);
object_set_parent(argument0,door_trig_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Create Event
object_event_add
(argument0,ev_create,0,'
    rm_var = -1;
    event_inherited();
    snd_len_var = 1;
    snd_arr[0] = door_m_02_snd;
');
// Alarm 0 Event
object_event_add
(argument0,ev_alarm,0,'
    tex_scr(-1);
    zone_scr(-1);
    global.rm_count_var += rm_count_var;
');