// Builtin Variables
object_set_depth(argument0,-4);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_3d_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    // Splash
    if frac_chance_scr(1,2) { splash_tex_w_var = -1; }
    else { splash_tex_w_var = 1; }
    splash_w_var = random_range(6.4,9.6);
    splash_h_var = 6;
    splash_spr_id_var = 0;
    // Ring
    ring_w_min_var = 8;
    ring_w_max_var = 14;
    ring_alpha_start_var = 2/3;
    ring_w_var = ring_w_min_var;
    ring_alpha_var = 1;
    ring_angle_var = random(360);
    // Particle
    part_w_min_var = 4;
    part_w_max_var = 16;
    part_z_min_var = -3;
    part_z_max_var = 0;
    part_z_var = part_z_min_var;
    part_alpha_start_var = 1/3;
    part_alpha_var = 1;
    part_w_var = part_w_min_var;
    // Alarms
    alarm_len_var = 3;
    alarm_ini_scr();
    set_alarm_scr(0,32); // Splash animation
    set_alarm_scr(1,200); // Ring
    set_alarm_scr(2,30); // Particle
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if instance_exists(water_obj) { z = water_obj.z; }
    else { instance_destroy(); exit; }
    event_inherited();
    if alarm_arr[0,0] > 0
    {
        splash_spr_id_var = floor(lerp_scr(sprite_get_number(splash_spr_var),0,alarm_arr[0,0]/alarm_arr[0,1]));
        splash_tex_var = sprite_get_texture(splash_spr_var,splash_spr_id_var);
    }
    if alarm_arr[1,0] > 0
    {
        local.per = 1-(alarm_arr[1,0]/alarm_arr[1,1]);
        ring_w_var = lerp_scr(ring_w_min_var,ring_w_max_var,local.per);
        ring_alpha_var = 1-anti_lerp_scr(ring_alpha_start_var,1,local.per);
    }
    if alarm_arr[2,0] > 0
    {
        local.per = 1-(alarm_arr[2,0]/alarm_arr[2,1]);
        part_w_var = lerp_scr(part_w_min_var,part_w_max_var,local.per);
        part_z_var = lerp_scr(part_z_min_var,part_z_max_var,local.per);
        part_alpha_var = 1-anti_lerp_scr(part_alpha_start_var,1,local.per);
    }
');
// Alarms
object_event_add
(argument0,ev_alarm,0,'
    splash_tex_var = sprite_get_texture(splash_spr_var,sprite_get_number(splash_spr_var)-1);
');
object_event_add
(argument0,ev_alarm,1,'
    ring_w_var = ring_w_max_var;
    ring_alpha_var = 0;
    instance_destroy(); 
');
object_event_add
(argument0,ev_alarm,2,'
    part_w_var = part_w_max_var;
    part_z_var = part_z_max_var
    part_alpha_var = 0;
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    // Set
    draw_set_alpha(image_alpha); draw_set_color(image_blend);
    d3d_transform_set_identity();
    // Reflection handling (more complex for billboarded sprites)
    local.xtmp = x;
    local.ytmp = y;
    local.ztmp = z;
    if global.reflect_var
    {
        switch (global.reflect_axis_var)
        {
            case 0: { local.xtmp = global.reflect_pos_var-local.xtmp; d3d_transform_add_scaling(-1,1,1); break; }
            case 1: { local.ytmp = global.reflect_pos_var-local.ytmp; d3d_transform_add_scaling(1,-1,1); break; }
            case 2: { local.ztmp = global.reflect_pos_var-local.ztmp; d3d_transform_add_scaling(1,1,-1); break; }
        }
    }
    // Transformations
    d3d_transform_add_rotation_z(point_direction(local.xtmp,local.ytmp,global.cam_x_var[view_current],global.cam_y_var[view_current]));
    d3d_transform_add_translation(local.xtmp,local.ytmp,local.ztmp);
    // Splash
    if alarm_arr[0,0] > 0
    { d3d_draw_wall(0,splash_w_var*0.5,splash_h_var,0,-splash_w_var*0.5,0,splash_tex_var,splash_tex_w_var,1); }
    // Particle
    if alarm_arr[2,0] > 0
    {
        draw_set_alpha(part_alpha_var);
        d3d_draw_wall(0,part_w_var*0.5,part_w_var*0.5,0,-part_w_var*0.5,-part_w_var*0.5,part_tex_var,1,1);
    }
    // Ring
    if alarm_arr[1,0] > 0
    {
        d3d_transform_set_identity();
        d3d_transform_add_rotation_z(ring_angle_var);
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
        draw_set_alpha(ring_alpha_var);
        d3d_draw_floor(-ring_w_var*0.5,-ring_w_var*0.5,0.1,ring_w_var*0.5,ring_w_var*0.5,0.1,ring_tex_var,1,1);
    }
    // Reset
    d3d_transform_set_identity();
    draw_set_color(c_white); draw_set_alpha(1);
');