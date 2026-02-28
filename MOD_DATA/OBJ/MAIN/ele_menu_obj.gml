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
    store_tex_var = ele_door_bg_tex; // save_ped_02_bg
    event_inherited();
    solid_var = false;
    tex_w_var = 0.05859375;
    tex_l_var = 1;
    tex_h_var = 1;
    w_var = 1;
    l_var = 16;
    hinge_var = 7;
    h_var = 24;
    store_tex_02_var = ele_door_bg_tex;
    tex_02_var = store_tex_02_var;
    // Alarms
    alarm_len_var = 4;
    alarm_ini_scr();
    // Animation
    state_var = 0;
    state_len_var = 4;
    alarm_var[0] = 20;
    alarm_var[1] = 18;
    alarm_var[2] = 22.8;
    alarm_var[3] = 43.2;
    alarm_var[4] = -1;
    open_var[0] = 0;
    open_var[1] = 0;
    open_var[2] = -20;
    open_var[3] = -85;
    open_var[4] = -85;
    open_lerp_var[0] = false;
    open_lerp_var[1] = false;
    open_lerp_var[2] = true;
    open_lerp_var[3] = 2;
    open_lerp_var[4] = false;
    prev_dir_var = direction;
    set_alarm_scr(0,alarm_var[state_var]);
    fmod_snd_play_scr(door_m_01_snd);
    with instance_create(0,0,fade_eff_obj)
    {
        image_blend = c_black; 
        set_alarm_scr(0,other.alarm_var[other.state_var]); 
        invert_var = false;
        stay_var = false;
        cam_id_var = -1;
    }
    // Old
    /*
    state_len_var = 5;
    alarm_var[0] = 60;
    alarm_var[1] = 200/7;
    alarm_var[2] = 10;
    alarm_var[3] = 100/3;
    alarm_var[4] = 43.75;
    alarm_var[5] = -1;
    open_var[0] = 0;
    open_var[1] = -20;
    open_var[2] = -20;
    open_var[3] = -70;
    open_var[4] = -85;
    open_var[5] = -85;
    open_lerp_var[0] = false;
    open_lerp_var[1] = true;
    open_lerp_var[2] = false;
    open_lerp_var[3] = true;
    open_lerp_var[4] = true;
    open_lerp_var[5] = false;
    */
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if alarm_arr[0,0] > 0
    {
        if open_lerp_var[state_var]
        {
            local.per = alarm_arr[0,0]/alarm_arr[0,1];
            if open_lerp_var[state_var] == 2 { local.per = sqr(local.per); }
            direction = lerp_scr(open_var[state_var],open_var[state_var-1],local.per);
        }
    }
');
// Alarm
object_event_add
(argument0,ev_alarm,0,'
    state_var += 1;
    if state_var < state_len_var
    { set_alarm_scr(0,alarm_var[state_var]); }
    else { with cam_ele_obj { event_user(0); }}
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    // Transformation
    d3d_transform_set_identity();
    d3d_transform_add_translation(0,-hinge_var,0);
    d3d_transform_add_rotation_z(direction);
    d3d_transform_add_translation(x,y,z);
    // Reflection handling
    if global.reflect_var
    {
        switch (global.reflect_axis_var)
        {
            case 0: { d3d_transform_add_scaling(-1,1,1); d3d_transform_add_translation(global.reflect_pos_var,0,0); break; }
            case 1: { d3d_transform_add_scaling(1,-1,1); d3d_transform_add_translation(0,global.reflect_pos_var,0); break; }
            case 2: { d3d_transform_add_scaling(1,1,-1); d3d_transform_add_translation(0,0,global.reflect_pos_var); break; }
        }
    }
    // Values
    draw_set_alpha(image_alpha);
    if tone_var >= 0
    { draw_set_color(color_mult_scr(image_blend,tone_var)); }
    else { draw_set_color(image_blend); }
    // Draw
    local.width = w_var/2;
    local.length = l_var/2;
    local.tex_height = tex_h_var*sign(h_var);
    d3d_draw_wall(-local.width,-local.length,h_var,local.width,-local.length,0,tex_var,tex_w_var,local.tex_height);
    d3d_draw_wall(-local.width,local.length,h_var,local.width,local.length,0,tex_var,tex_w_var,local.tex_height);
    d3d_draw_wall(-local.width,-local.length,h_var,-local.width,local.length,0,tex_02_var,tex_l_var,local.tex_height);
    d3d_draw_wall(local.width,-local.length,h_var,local.width,local.length,0,tex_02_var,tex_l_var,local.tex_height);
    d3d_draw_floor(-local.width,-local.length,0,local.width,local.length,0,tex_var,tex_w_var,tex_l_var);
    d3d_draw_floor(-local.width,-local.length,h_var,local.width,local.length,h_var,tex_var,tex_w_var,tex_l_var);
    // Reset
    d3d_transform_set_identity();
    draw_set_color(c_white); draw_set_alpha(1);
');