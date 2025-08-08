// Builtin Variables
object_set_depth(argument0,0);
object_set_mask(argument0,noone);
object_set_parent(argument0,mon_par_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,"
    // Gotta set type, delay, and duration
    enter_var = type_var;
    base_spd_var = 0.6;
    dur_star_var = dur_var;
    if delay_var != 0 && delay_min_var == 0
    {
        delay_min_var = delay_var;
        delay_max_var = delay_var;
    }
    w_var = 10;
    h_var = 20;
    dmg_var = 45;
    dmg_alarm_var=120;
");