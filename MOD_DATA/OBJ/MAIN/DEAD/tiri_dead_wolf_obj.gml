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
    snd_var = noone;
    inst_var = noone;
    image_yscale = 616;
    image_alpha = 0;
    state_var = 0;
    spr_id_var = 0;
    alarm_len_var = 2;
    alarm_ini_scr();
    set_alarm_scr(0,90);
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if !state_var
    {
        if alarm_arr[0,0] > 0
        { image_alpha = lerp_scr(2,0,alarm_arr[0,0]/alarm_arr[0,1]); }
    }
    else
    {
        if alarm_arr[1,0] > 0
        { spr_id_var = lerp_scr(sprite_get_number(spr_var),1,alarm_arr[1,0]/alarm_arr[1,1]); }
    }
    if fmod_inst_is_play_scr(inst_var)
    { fmod_inst_set_pan_scr(inst_var,sin(degtorad(par_var.x-x))); }
');
// Alarm 0 Event
object_event_add
(argument0,ev_alarm,0,'
    fmod_inst_stop_scr(inst_var);
    inst_var = fmod_snd_play_scr(snd_var);
    image_alpha = 1;
    state_var = 1;
    spr_id_var = 1;
    set_alarm_scr(1,12);
');
// Alarm 1 Event
object_event_add
(argument0,ev_alarm,1,'
    fmod_snd_play_scr(claw_snd);
    with instance_create(x,y-44,tiri_dead_eff_obj)
    {
        par_var = other.par_var;
        spr_var = par_var.spr_02_var;
    }
    fmod_inst_stop_scr(inst_var);
    instance_destroy();
    with par_var
    {
        hp_var -= 12.5;
        event_user(1);
    }
');