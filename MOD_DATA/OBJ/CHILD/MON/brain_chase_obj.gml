// Builtin Variables
object_set_depth(argument0,0);
object_set_mask(argument0,noone);
object_set_parent(argument0,echidna_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_other,ev_user7,"
    type_var = 0;
    spd_base_var = 0.8;
    tex_var = brain_bg_tex;
    dur_var = irandom_range(10,15);
    delay_var = 180;
    dmg_var = 60;
    dmg_alarm_var = 180;
    w_var = 10;
    h_var = 10;
    spd_var = 8/15;
    target_spd_mult_var = 0.6;
    if global.mode_var == 0 || global.behavior_type_var == 2
    {
        spd_var = 8/9;
        // Originally 8/15
        dur_var = 1;
        dmg_var = 99999;
        target_spd_mult_var = 0.3;
    }
    event_inherited();
    do_snd_var = false;
    // sine
    z_off_time_var=0;
    z_off_mult_var=2;
    z_off_rate_var=480;
    z_off_base_var=5;
    z_off_var = z_off_base_var;
");
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,"
    if instance_number(mon_par_obj) < 2
    {
        with (player_obj)
        {
            if spd_mult_var > other.target_spd_mult_var
            { spd_mult_var = other.target_spd_mult_var; }
        }
    }
    event_inherited();
");
// Animation
object_event_add
(argument0,ev_other,ev_user1,"
    z_off_time_var = (z_off_time_var+global.delta_time_var) mod z_off_rate_var;
    z_off_var = z_off_base_var+(sin(2*z_off_time_var*pi/z_off_rate_var)*z_off_mult_var);
");