// Builtin Variables
object_set_depth(argument0,-1);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create event
object_event_add
(argument0,ev_create,0,'
    snap_var = 1;
    event_inherited();
    type_var = 4;
    dist_var = 0.2;
    w_max_var = 20;
    w_var = 0;
    l_var = 0;
    direction = random(360);
    alarm_len_var = 1;
    set_alarm_scr(0,117);
');
// Alarm 0
object_event_add
(argument0,ev_alarm,0,'
    w_var = w_max_var;
    l_var = w_max_var;
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    if alarm_arr[0,0] > 0
    {
        w_var = w_max_var*power(1-(alarm_arr[0,0]/alarm_arr[0,1]),1/3);
        l_var = w_var;
    }
');