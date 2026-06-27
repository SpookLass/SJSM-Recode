// Builtin Variables
object_set_depth(argument0,-3);
object_set_mask(argument0,noone);
object_set_parent(argument0,par_3d_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    // Color
    color_var = 2;
    reflect_var = true;
    // Main
    on_var = false;
    atk_var = false;
    spd_base_var = 0.5;
    spr_spd_base_var = 1/3;
    spr_spd_var = spr_spd_base_var;
    spr_id_var = 0;
    w_var = 16;
    h_var = 13;
    x_off_var = 0;
    y_off_var = 0;
    z_off_var = 0;
    path_len_var = 0;
    path_id_var = 0;
    alarm_len_var = 1;
    // Body
    bod_len_var = 3;
    bod_dist_var = 8;
    bod_w_var = 16;
    bod_h_var = 13;
    bod_spr_spd_var = 1/3;
    bod_wiggle_off_var = 5;
    rotate_var = false;
    // Animation
    spd_anim_var = false;
    do_wiggle_var = false;
    wiggle_time_var=0;
    wiggle_mult_var=6.75; // Estimate
    wiggle_rate_var=60;
    wiggle_var = 0;
    // Sprites
    spr_var = load_par_obj.spr_arr_var[0,0];
    bod_spr_var = load_par_obj.spr_arr_var[1,0];
    tex_var = sprite_get_texture(spr_var,spr_id_var);
    // Sound
    snd_var = load_par_obj.snd_arr_var[3,0];
    inst_var = noone;
    // Assets
    // Behavior
    if global.bug_type_var == -1 { local.type = irandom(3); }
    else { local.type = global.bug_type_var; }
    switch local.type
    {
        case 0: // Recode
        {
            spd_base_var = 0.6;
            do_acc_var = true;
            acc_var = 0.1;
            frick_var = 0.05;
            bod_len_var = 10;
            spd_anim_var = true;
            // Autobrake
            autobrake_var = true;
            autobrake_spd_var = 0.5;
            autobrake_dir_var = 60;
            break;
        }
        case 2: // HD
        {
            spd_base_var = 8/pf_ms_rate_const; // 0.5r3
            do_acc_var = true;
            acc_var = 16/675; // 0.02r370
            frick_var = acc_var;
            rotate_var = true;
            bod_len_var = 10;
            spd_anim_var = true;
            // Autobrake (close enough)
            autobrake_var = true;
            autobrake_spd_var = 0;
            autobrake_dir_var = 60;
            break;
        }
        case 3: // Gone Rogue
        {
            do_acc_var = 2; // Classic
            bod_len_var = 7;
            // spd_base_var = 1.75;
            acc_var = 0.025;
            frick_var = 0.025;
            break;
        }
    }
    // Alarms
    alarm_len_var = 10;
    alarm_ini_scr();
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if on_var
    {
        if atk_var
        {
            if alarm_arr[0,0] > 0
            {
                local.per = 0.7*(1-(alarm_arr[0,0]/alarm_arr[0,1]));
                x = lerp_scr(xstart,cam_dead_obj.x,local.per);
                y = lerp_scr(ystart,cam_dead_obj.y,local.per);
                z = lerp_scr(zstart,cam_dead_obj.z,local.per);
            }
        }
        else if path_id_var+1 < path_len_var
        {
            if point_distance_3d_scr(x,y,z,path_var[path_id_var+1,0],path_var[path_id_var+1,1],path_var[path_id_var+1,2]) < spd_base_var
            {
                set_motion_3d_scr(0,true);
                x = path_var[path_id_var+1,0];
                y = path_var[path_id_var+1,1];
                z = path_var[path_id_var+1,2];
                path_id_var += 1;
                if path_id_var == path_len_var-1
                { fmod_inst_stop_scr(inst_var); }
            }
            else
            {
                local.yaw = point_direction(x,y,path_var[path_id_var+1,0],path_var[path_id_var+1,1]);
                local.pitch = point_direction_3d_scr(x,y,z,path_var[path_id_var+1,0],path_var[path_id_var+1,1],path_var[path_id_var+1,2]);
                set_motion_3d_scr(spd_base_var,true,local.yaw,true,local.pitch,true);
            }
        }
        if spd_anim_var { spr_spd_var = spr_spd_base_var*spd_var/spd_base_var; }
        spr_id_var = mod_scr(spr_id_var+(spr_spd_var*global.delta_time_var),sprite_get_number(spr_var));
        fmod_inst_set_3d_pos_scr(inst_var,x,y,z);
    }
');
// Create bodies
object_event_add
(argument0,ev_other,ev_user0,'
    local.follow = id;
    for (local.i=0; local.i<bod_len_var; local.i+=1;)
    {
        local.xtmp = x+lengthdir_x(lengthdir_x(bod_dist_var*(local.i+1),yaw_var+180),pitch_var);
        local.ytmp = y+lengthdir_x(lengthdir_y(bod_dist_var*(local.i+1),yaw_var+180),pitch_var);
        with instance_create(local.xtmp,local.ytmp,bug_bod_obj)
        {
            bod_id_var = local.i;
            par_var = other.id;
            follow_var = local.follow;
            dist_var = other.bod_dist_var;
            z = other.z+lengthdir_y(dist_var,other.pitch_var);
            spr_var = other.bod_spr_var;
            spr_spd_base_var = other.bod_spr_spd_var;
            spr_spd_var = spr_spd_base_var;
            tex_var = sprite_get_texture(spr_var,0);
            w_var = other.bod_w_var;
            h_var = other.bod_h_var;
            rotate_var = other.rotate_var;
            // Animate
            spd_anim_var = other.spd_anim_var;
            do_wiggle_var = other.do_wiggle_var;
            wiggle_mult_var = other.wiggle_mult_var;
            wiggle_rate_var = other.wiggle_rate_var;
            wiggle_off_var = other.bod_wiggle_off_var;
            // Next
            local.follow = id;
        }
    }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if on_var
    {
        draw_set_color(image_blend); draw_set_alpha(image_alpha);
        d3d_transform_set_identity();
        if rotate_var
        { d3d_transform_add_rotation_y(point_direction_3d_scr(x,y,z,global.cam_x_var[view_current],global.cam_y_var[view_current],global.cam_z_var[view_current])); }
        // Get position
        local.xtmp = x+x_off_var;
        local.ytmp = y+y_off_var;
        local.ztmp = z+z_off_var+(h_var*0.5);
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
        d3d_draw_wall(0,(w_var*0.5)+wiggle_var,h_var*0.5,0,(-w_var*0.5)+wiggle_var,-h_var*0.5,tex_var,1,1);
        d3d_transform_set_identity();
        draw_set_color(c_white); draw_set_alpha(1);
    }
');