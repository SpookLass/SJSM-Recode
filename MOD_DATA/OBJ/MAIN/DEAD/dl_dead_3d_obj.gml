// Builtin Variables
object_set_depth(argument0,-3);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_3d_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    reflect_var = true;
    event_inherited();
    dist_var = 32;
    rm_var = dl_dead_rm;
    image_blend = c_red;
    // Draw
    w_var = 10;
    h_var = 24.28;
    x_off_var = 0;
    y_off_var = 0;
    z_off_var = 0;
    spr_var = load_par_obj.spr_arr_var[0,0];
    spr_id_var = 0;
    spr_spd_var = 1/6;
    tex_var = sprite_get_texture(spr_var,spr_id_var);
    // Pull
    pull_var = true;
    pull_rate_min_var = 0.8;
    pull_rate_max_var = 2;
    // Seen
    seen_var = true;
    seen_yaw_var = 16;
    seen_pitch_var = 16;
    seen_rate_var = 1;
    seen_rate_min_var = 4;
    // Behavior
    if global.dl_type_var == -1 { local.type = irandom(4); }
    else { local.type = global.dl_type_var; }
    switch local.type
    {
        case 0:
        {
            // Make bigger
            w_var = 20;
            h_var = 48.56;
            break;
        }
        case 2:
        {
            pull_var = false;
            seen_var = false;
            // Make bigger
            image_blend = c_white;
            w_var = 20;
            h_var = 48.56;
            break;
        }
    }
    // Effects
    with instance_create(0,0,dl_eff_obj)
    {
        par_var = other.id;
        slender_var = false;
    }
    with instance_create(0,0,spr_flash_eff_obj)
    {
        par_var = other.id;
        spr_var = load_par_obj.spr_arr_var[1,0];
        spr_id_var = irandom(sprite_get_number(spr_var)-1);
        spr_spd_var = 1;
        do_snd_var = true;
        snd_var = fmod_snd_play_scr(load_par_obj.snd_arr_var[1,0]);
        rand_rate_var = 15;
        set_alarm_scr(0,irandom_range(30,60));
        // Set camera to player
        cam_id_var = -1;
    }
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    // Animate
    spr_id_var = (spr_id_var+(spr_spd_var*global.delta_time_var)) mod sprite_get_number(spr_var);
    tex_var = sprite_get_texture(spr_var,floor(spr_id_var));
    // Die
    local.active = false;
    with player_obj
    {
        if point_distance_3d_scr(x,y,z,other.x,other.y,other.z) < other.dist_var { local.active = true; }
        else
        {
            if other.pull_var
            {
                local.dist = random_range(other.pull_rate_min_var,other.pull_rate_max_var)*global.delta_time_var;
                local.dir = point_direction(x,y,other.x,other.y);
                x += lengthdir_x(local.dist,local.dir);
                y += lengthdir_y(local.dist,local.dir);
            }
            if other.seen_var
            {
                local.radius = other.w_var/2;
                local.height = other.h_var/2;
                local.dist = point_distance_3d_scr(x,y,z,other.x,other.y,other.z);
                // Calculate seen
                if other.seen_yaw_var > 0
                {
                    local.diff = deg_diff_scr(point_direction(x,y,other.x,other.y),eye_yaw_var);
                    local.yaw = abs(local.diff)-radtodeg(arctan2(local.radius,local.dist));
                    if local.yaw > other.seen_yaw_var
                    {
                        local.rate = max(other.seen_rate_min_var,(local.yaw-other.seen_yaw_var)*other.seen_rate_var)*global.delta_time_var;
                        eye_yaw_var +=  min(abs(local.yaw-other.seen_yaw_var),local.rate)*sign(local.diff);
                    }
                }
                if other.seen_pitch_var > 0
                {
                    local.diff = deg_diff_scr(point_direction_3d_scr(x,y,z,other.x,other.y,other.z),eye_pitch_var);
                    local.pitch = abs(local.diff)-radtodeg(arctan2(local.height,local.dist));
                    if local.pitch > other.seen_pitch_var
                    {
                        local.rate = max(other.seen_rate_min_var,(local.pitch-other.seen_pitch_var)*other.seen_rate_var)*global.delta_time_var;
                        eye_pitch_var += min(abs(local.yaw-other.seen_yaw_var),local.rate)*sign(local.diff);
                    }
                }
            }
        }
    }
    if local.active || global.input_press_arr[confirm_input_const,global.menu_player_var] == 1
    || global.input_press_arr[back_input_const,global.menu_player_var] == 1
    {
        with load_par_obj { instance_destroy(); }
        rm_goto_menu_scr(rm_var,true);
    }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    draw_set_color(image_blend); draw_set_alpha(image_alpha);
    d3d_transform_set_identity();
    // Get position
    local.xtmp = x+x_off_var;
    local.ytmp = y+y_off_var;
    local.ztmp = z+z_off_var;
    // Reflection handling (more complex for billboarded sprites)
    if global.reflect_var
    {
        switch (global.reflect_axis_var)
        {
            case 0: { local.xtmp = global.reflect_pos_var-local.xtmp; d3d_transform_add_scaling(-1,1,1); break; }
            case 1: { local.ytmp = global.reflect_pos_var-local.ytmp; d3d_transform_add_scaling(1,-1,1); break; }
            case 2: { local.ztmp = global.reflect_pos_var-local.ztmp; d3d_transform_add_scaling(1,1,-1); break; }
        }
    }
    d3d_transform_add_rotation_z(point_direction(local.xtmp,local.ytmp,global.cam_x_var[view_current],global.cam_y_var[view_current]));
    d3d_transform_add_translation(local.xtmp,local.ytmp,local.ztmp);
    // Draw
    d3d_draw_wall(0,w_var/2,h_var,0,-w_var/2,0,tex_var,1,1);
    // Reset
    d3d_transform_set_identity();
    draw_set_color(c_white); draw_set_alpha(1);
');