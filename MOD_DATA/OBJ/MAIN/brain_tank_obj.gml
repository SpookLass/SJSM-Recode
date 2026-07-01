// Builtin Variables
object_set_depth(argument0,-4);
object_set_mask(argument0,noone);
object_set_parent(argument0,prop_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Prop collisions
p3dc_set_trimask_scr(mask_metal_const);
global.brain_tank_coll[1] = 24;
global.brain_tank_coll[2] = 24;
global.brain_tank_coll[3] = 24;
global.brain_tank_coll[0] = prop_to_coll_scr(3,'',global.brain_tank_coll[2],global.brain_tank_coll[3],global.brain_tank_coll[1],true,8);
p3dc_set_trimask_scr(mask_basic_const);
// Create event
object_event_add
(argument0,ev_create,0,'
    store_tex_var = glass_bg_tex;
    event_inherited();
    solid_var = true;
    type_var = 3;
    w_var = 24;
    l_var = 24;
    h_var = 24;
    tex_w_var = 4;
    step_var = 8;
    close_var = true;
    image_alpha = 0.6;
    color_var = 3;
    // Collisions
    coll_var[0] = global.brain_tank_coll[0];
    coll_var[1] = global.brain_tank_coll[1];
    coll_var[2] = global.brain_tank_coll[2];
    coll_var[3] = global.brain_tank_coll[3];
    // Weapon
    delay_var = 180;
    weapon_var = true;
    state_var = 2;
    alarm_len_var = 1;
    alarm_ini_scr();
    // Slow
    target_spd_mult_var = 0.3;
    if global.brain_type_var < 1 && global.mode_var != 0
    { target_spd_mult_var = 0.6; }
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
    if state_var <= 0 && alarm_arr[0,0] > 0
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
        {
            fmod_snd_3d_play_scr(brain_tank_shatter_snd,x,y,z);
            fmod_snd_3d_play_scr(brain_tank_drain_snd,x,y,z);
            with instance_create(x,y,brain_part_obj)
            { z = other.z+(other.h_var*0.5); }
            set_alarm_scr(0,delay_var);
        }
        else { fmod_snd_3d_play_scr(brain_tank_crack_snd,x,y,z); }
    }
');
// Alarm
object_event_add
(argument0,ev_alarm,0,'
    with brain_part_obj { on_var = false; }
    fmod_update_take_over_when_lock_scr();
    local.tank = id;
    with brain_obj
    {
        local.brain = id;
        with instance_create(x,y,brain_chase_obj)
        {
            set_alarm_scr(0,-1);
            on_var = true;
            x = local.brain.x;
            y = local.brain.y;
            z = local.tank.z;
            z_off_time_var = local.brain.z_time_var;
            z_off_base_var = local.brain.z_base_var;
            z_off_rate_var = local.brain.z_rate_var;
            z_off_mult_var = local.brain.z_mult_var;
            z_off_var = local.brain.z;
            tex_var = local.brain.store_tex_var;
            w_var = local.brain.w_var;
            h_var = local.brain.h_var;
            if loop_snd_var[0] == 1 { loop_inst_var = fmod_snd_3d_loop_scr(loop_snd_var[1]); }
        }
        instance_destroy();
    }
    global.last_time_var = current_time;
    fmod_update_take_over_done_scr();
    if global.reset_spd_var > 0 && global.game_spd_var > 1
    { global.game_spd_var = 1; fmod_group_set_pitch_scr(0,global.game_spd_var); }
    if instance_exists(load_par_obj)
    {
        if ds_list_find_index(global.mon_list,brain_chase_obj) < 0
        { ds_list_add(global.mon_list,brain_chase_obj); }
        with door_trig_obj { lock_var = !lock_var; }
    }
    else { with door_trig_obj { save_var = false; event_user(0); }}
');