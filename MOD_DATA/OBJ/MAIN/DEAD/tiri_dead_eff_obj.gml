// Builtin Variables
object_set_depth(argument0,-100);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Create Event
object_event_add
(argument0,ev_create,0,'
    spr_var = noone;
    par_var = noone;
    y_scale_min_var = 708;
    y_scale_max_var = 778.8;
    image_yscale = y_scale_min_var;
    image_alpha = 1;
    state_var = 0;
    alarm_len_var = 2;
    alarm_ini_scr();
    set_alarm_scr(0,6);
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if state_var && alarm_arr[1,0] > 0
    {
        local.per = alarm_arr[1,0]/alarm_arr[1,1];
        image_yscale = lerp_scr(y_scale_max_var,y_scale_min_var,local.per);
        image_alpha = lerp_scr(0,1,local.per);
    }
');
// Alarm 0 Event
object_event_add
(argument0,ev_alarm,0,'
    state_var = 1;
    set_alarm_scr(1,30);
');
// Alarm 1 Event
object_event_add
(argument0,ev_alarm,1,'
    instance_destroy();
');