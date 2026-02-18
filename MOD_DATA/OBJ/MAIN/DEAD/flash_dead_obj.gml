// Builtin Variables
object_set_depth(argument0,-101);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    if global.reduce_flash_var { instance_destroy(); }
    flash_chance_var = 3;
    alarm_var = 3;
    flash_alarm_var = 1;
    alarm_len_var = 1;
    alarm_ini_scr();
    set_alarm_scr(0,alarm_var);
');
// Draw Event
object_event_add
(argument0,ev_alarm,0,'
    if frac_chance_scr(1,flash_chance_var)
    {
        with instance_create(0,0,flash_eff_obj)
        {
            cam_id_var = -1;
            image_blend = c_red;
            set_alarm_scr(0,other.flash_alarm_var);
        }
    }
    set_alarm_scr(0,alarm_var);
');