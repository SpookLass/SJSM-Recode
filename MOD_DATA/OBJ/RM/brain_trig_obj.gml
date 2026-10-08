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
    par_var = '+string(argument2)+'
    if par_var.door_var { instance_destroy(); exit; }
    event_inherited();
');
// User 0
object_event_add
(argument0,ev_other,ev_user0,'
    par_var.door_var = true;
    inst_var = fmod_snd_play_scr(ele_snd); // door_m_02_snd
    fmod_inst_set_pos_scr(inst_var,0.738); // 0.420
');