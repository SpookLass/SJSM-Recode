// Builtin Variables
object_set_depth(argument0,100);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Create Event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    player_var = noone;
    mult_var = 5;
    type_var = 0;
    // Alarm
    alarm_len_var = 1;
    alarm_ini_scr();
    set_alarm_scr(0,12);
');
// Alarm 0 Event
object_event_add
(argument0,ev_alarm,0,'
    with player_var // Can be singular player or player_obj
    { shake_var = 0; }
    instance_destroy();
');

// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    switch type_var
    {
        case 0: // constant
        {
            local.mult = mult_var;
            break;
        }
        case 1: // Fade out
        {
            local.mult = mult_var*alarm_arr[0,0]/alarm_arr[0,1];
            break;
        }
        case 2: // Fade in
        {
            local.mult = mult_var*(1-(alarm_arr[0,0]/alarm_arr[0,1]));
            break;
        }
    }
    with player_var // Can be singular player or player_obj
    { shake_var = local.mult; }
');