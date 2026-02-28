// Builtin Variables
object_set_depth(argument0,-3);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Prop collisions
global.brain_coll[1] = 10;
global.brain_coll[2] = 10;
global.brain_coll[0] = prop_to_coll_scr(5,'',global.brain_coll[2],0,global.brain_coll[1],true,8);
// Create event
object_event_add
(argument0,ev_create,0,'
    store_tex_var = brain_bg_tex;
    event_inherited();
    solid_var = false;
    type_var = 5; // Billboard
    w_var = 10;
    h_var = 10;
    step_var = 8;
    color_var = 3;
    // Collisions
    coll_var[0] = global.brain_coll[0];
    coll_var[1] = global.brain_coll[1];
    coll_var[2] = global.brain_coll[2];
    // sine
    z_time_var=0;
    z_mult_var=4;
    z_rate_var=480;
    z_base_var=5;
    z = z_base_var;
    // Weapon
    delay_var = 180;
    weapon_var = true;
    state_var = 2;
    alarm_len_var = 1;
    alarm_ini_scr();
    // Slow
    target_spd_mult_var = 0.6;
    if global.mode_var == 0 || global.main_type_var == 2
    { target_spd_mult_var = 0.3; }
');
// Draw
object_event_add
(argument0,ev_draw,0,'
    if global.fog_dark_var { d3d_set_fog(false,c_black,0,0); }
    event_inherited();
    if global.fog_dark_var 
    { d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var); }
');
// Step
object_event_add
(argument0,ev_step,ev_step_normal,'
    z_time_var = (z_time_var+global.delta_time_var) mod z_rate_var;
    z = z_base_var+(sin(2*z_time_var*pi/z_rate_var)*z_mult_var/2);
    if state_var <= 0 && instance_number(mon_par_obj) < 2
    {
        with (player_obj)
        {
            if spd_mult_var > other.target_spd_mult_var
            { spd_mult_var = other.target_spd_mult_var; }
        }
    }
');
// Weapon
object_event_add
(argument0,ev_other,ev_user4,'
    if state_var > 0
    {
        state_var -= 1;
        if state_var <= 0
        { set_alarm_scr(0,delay_var); }
    }
');
// Alarm
object_event_add
(argument0,ev_alarm,0,'
    with instance_create(x,y,brain_chase_obj)
    {
        set_alarm_scr(0,-1);
        on_var = true;
        x = other.x;
        y = other.y;
        z = 0;
        z_off_time_var = other.z_time_var;
        z_off_base_var = other.z_base_var;
        z_off_rate_var = other.z_rate_var;
        z_off_mult_var = other.z_mult_var;
        z_off_var = other.z;
        tex_var = other.store_tex_var;
        w_var = other.w_var;
        h_var = other.h_var;
        if loop_snd_var[0] == 1 { loop_inst_var = fmod_snd_3d_loop_scr(loop_snd_var[1]); }
    }
    instance_destroy();
')