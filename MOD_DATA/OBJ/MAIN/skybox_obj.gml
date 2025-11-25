// Builtin Variables
object_set_depth(argument0,98);
object_set_mask(argument0,noone);
object_set_parent(argument0,skybox_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    side_tex_var = sky_01_bg_tex;
    top_tex_var = sky_02_bg_tex;
    dist_var = 16;
    light_delay_min_var = 60;
    light_delay_max_var = 240;
    snd_var = fmod_snd_loop_scr(rain_snd);
');
// Destroy Event
object_event_add
(argument0,ev_destroy,0,'
    event_inherited();
    fmod_inst_stop_scr(snd_var);
');
// Room End
object_event_add
(argument0,ev_other,ev_room_end,'
    fmod_inst_stop_scr(snd_var);
    event_inherited();
');