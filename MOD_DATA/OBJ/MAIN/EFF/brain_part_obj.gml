// Builtin Variables
object_set_depth(argument0,-5);
object_set_mask(argument0,noone);
object_set_parent(argument0,part_par_obj);
object_set_persistent(argument0,false);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create
object_event_add
(argument0,ev_create,0,'
    event_inherited();
    image_alpha = 0.66; // 0.33
    on_var = true;
    // Bounding Box
    dist_var = 12;
    h_var = 6; // 8
    yaw_range_var = 28.65; // 38.2
    // Particles
    part_len_var = 400;
    part_ini_scr();
    part_spawn_var = 16;
    part_yaw_var = -78.75;
    part_pitch_var = -11.25;
    do_coll_var = false;
    image_blend = make_color_rgb(159,196,156);
    // Speed
    part_spd_min_var = 1.5;
    part_spd_max_var = 2.5;
    pitch_rate_var = 2.5;
    // Ring
    ring_time_var = 30;
    ring_base_w_var = 3;
    do_ring_var = true;
    // Droplet
    droplet_w_var = 4;
    droplet_h_var = 0.25;
    // Effects
    fade_dist_var = 0;
    fog_var = true;
');
// Step
object_event_add
(argument0,ev_step,ev_step_normal,'
    // Spawn 240 particles per second
    if on_var
    {
        local.spawn = part_spawn_var*global.delta_time_var;
        if local.spawn > 0
        {
            for (local.i=0; local.i<local.spawn; local.i+=1;)
            {
                local.dir = part_yaw_var+random_range(-yaw_range_var,yaw_range_var);
                local.xtmp = x+lengthdir_x(dist_var,local.dir);
                local.ytmp = y+lengthdir_y(dist_var,local.dir);
                local.ztmp = z+random_range(-h_var,h_var);
                local.spd = random_range(part_spd_min_var,part_spd_max_var);
                local.part = part_add_scr
                (
                    local.xtmp,local.ytmp,local.ztmp,
                    local.spd,part_yaw_var,part_pitch_var,
                    droplet_w_var,droplet_h_var,0,
                    image_blend,image_alpha,
                    false,white_bg_tex,
                    0,0,
                    32/local.spd
                );
                if local.part != -1 { part_arr[local.part,18] = false; }
            }
        }
    }
    local.len = min(part_len_var,global.max_part_var/instance_number(part_par_obj));
    for (local.i=0; local.i<local.len; local.i+=1;)
    {
        if part_arr[local.i,0]
        {
            if part_arr[local.i,18]
            {
                // Set alpha
                part_arr[local.i,11] = part_arr[local.i,17]*image_alpha/ring_time_var;
                // Set width and height
                part_arr[local.i,7] = ring_base_w_var*(1-(part_arr[local.i,17]/ring_time_var));
                part_arr[local.i,8] = part_arr[local.i,7];
            }
            else
            {
                part_arr[local.i,6] = max(-90,part_arr[local.i,6]-(pitch_rate_var*global.delta_time_var));
                if do_coll_var
                {
                    // Collisions (I hope this doesnt lag the game!)
                    local.coll = false;
                    local.spd = part_arr[local.i,4]*global.delta_time_var;
                    // Raycast
                    local.xvel = lengthdir_x(lengthdir_x(1,part_arr[local.i,5]),part_arr[local.i,6]);
                    local.yvel = lengthdir_x(lengthdir_y(1,part_arr[local.i,5]),part_arr[local.i,6]);
                    local.zvel = -lengthdir_y(1,part_arr[local.i,6]);
                    if check_ray_scr(part_arr[local.i,1],part_arr[local.i,2],part_arr[local.i,3],local.xvel,local.yvel,local.zvel) < local.spd+(part_arr[local.i,7]*0.5)
                    { local.coll = true; }
                    // If collided, check if collision is with floor
                    if local.coll && do_ring_var && part_arr[local.i,6] < 0
                    {
                        local.dist = check_ray_scr(part_arr[local.i,1],part_arr[local.i,2],part_arr[local.i,3],0,0,-1);
                        if local.dist < local.spd+(part_arr[local.i,7]*0.5)
                        {
                            local.coll = false;
                            // Become ring
                            part_arr[local.i,11] = 1; // Alpha
                            part_arr[local.i,7] = 0; // Width
                            part_arr[local.i,8] = 0; // Height
                            part_arr[local.i,3] = part_arr[local.i,3]-local.dist; // Z axis
                            part_arr[local.i,4] = 0; // Speed
                            part_arr[local.i,13] = rain_ring_bg_tex; // Texture
                            part_arr[local.i,17] = ring_time_var; // Time
                            part_arr[local.i,18] = true; // Ring
                        }
                    }
                    if local.coll
                    {
                        part_arr[local.i,0] = false;
                        for (local.j=0; local.j<19; local.j+=1)
                        { part[local.i,local.j] = 0; }
                    }
                }
            }
        }
    }
    event_inherited();
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    // Disable fog
    if fog_var { d3d_set_fog(false,c_black,0,0); }
    local.len = min(part_len_var,global.max_part_var/instance_number(part_par_obj));
    // Loop through particles
    for (local.i=0; local.i<local.len; local.i+=1;)
    {
        if part_arr[local.i,0]
        {
            // Become transparent when close to camera
            if fade_dist_var > 0
            {
                local.dist = point_distance_3d_scr(part_arr[local.i,1],part_arr[local.i,2],part_arr[local.i,3],global.cam_x_var[view_current],global.cam_y_var[view_current],global.cam_z_var[view_current]);
                local.alpha = part_arr[local.i,11]*median(0,1,local.dist/fade_dist_var);
            }
            else { local.alpha = part_arr[local.i,11]; }
            draw_set_color(part_arr[local.i,10]); draw_set_alpha(local.alpha);
            // Draw
            d3d_transform_set_identity();
            if part_arr[local.i,18] // Ring
            {
                d3d_transform_add_translation(part_arr[local.i,1],part_arr[local.i,2],part_arr[local.i,3]);
                d3d_draw_floor(part_arr[local.i,7]/2,part_arr[local.i,8]/2,0.1,-part_arr[local.i,7]/2,-part_arr[local.i,8]/2,0.1,part_arr[local.i,13],1,1);
            }
            else // Droplet
            {
                d3d_transform_add_rotation_x(part_arr[local.i,5]-point_direction(part_arr[local.i,1],part_arr[local.i,2],global.cam_x_var[view_current],global.cam_y_var[view_current])+90);
                d3d_transform_add_rotation_y(part_arr[local.i,6]);
                d3d_transform_add_rotation_z(part_arr[local.i,5]);
                d3d_transform_add_translation(part_arr[local.i,1],part_arr[local.i,2],part_arr[local.i,3]);
                d3d_draw_wall(part_arr[local.i,7]/2,0,part_arr[local.i,8]/2,-part_arr[local.i,7]/2,0,-part_arr[local.i,8]/2,part_arr[local.i,13],1,1);
            }
        }
    }
    // Reset everything
    d3d_transform_set_identity(); draw_set_color(c_white); draw_set_alpha(1);
    if fog_var { d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var); }
');