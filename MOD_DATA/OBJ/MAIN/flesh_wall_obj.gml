// Builtin Variables
object_set_depth(argument0,0);
object_set_mask(argument0,noone);
object_set_parent(argument0,wall_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    alarm_len_var = 1;
    alarm_ini_scr();
    alarm_min_var = 60;
    alarm_max_var = 120;
    spr_id_var = 0;
    event_perform(ev_alarm,0);
');
// Alarm
object_event_add
(argument0,ev_alarm,0,'
    spr_id_var = irandom(sprite_get_number(spr_var)-1);
    store_tex_var = sprite_get_texture(spr_var,spr_id_var);
    tex_var = store_tex_var;
    set_alarm_scr(0,irandom_range(alarm_min_var,alarm_max_var));
');