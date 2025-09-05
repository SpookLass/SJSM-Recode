// Builtin Variables
object_set_depth(argument0,0);
object_set_mask(argument0,noone);
object_set_parent(argument0,mon_par_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
/*
Variables
type_var
    0: Ignores walls
    1: Pathfinds normally
    2: Floats over pits
enter_var: Whether a physical monster is entering the room
dur_var: The chase duration
dur_start_var: How much duration a monster starts with, used for scripted events and boss bars
delay_var: How much time before a monster starts acting
w_var: How many pixels wide the monster is
h_var: How many pixels tall the monster is
z_off_var: How many pixels off the ground the monster is
dmg_var: How much damage a monster deals per hit
dmg_alarm_var: How much time before something can hit the player again (per player)
spd_base_var: How fast the monster moves in pixels per frame (60fps)
spd_mult_var: Multiplier for the monster's speed, mostly for monsters that have varied speeds
acc_var: How fast the monster accelerates in pixels per frame squared (60fps)
frick_var: How fast the monster decelerates in pixels per frame squared
do_move_var: Whether the specimen should move
do_anim_var: Whether the specimen should animate
do_attack_var: Whether the specimen should attack
do_hurt_var: Whether the specimen should be vulnerable
move_var: Whether the specimen can currently move
anim_var: Whether the specimen can currently animate
attack_var: Whether the specimen can currently attack
hurt_var: Whether the specimen is currently hurt
*/
// Create Event
object_event_add
(argument0,ev_create,0,"
    // Gotta set type, delay, and duration
    dur_star_var = dur_var;
    enter_var = type_var > 0;
    do_move_var = true;
    do_attack_var = true;
    do_anim_var = true;
    // Speed
    spd_mult_var = 1;
    // Delay
    if delay_var != 0 && delay_min_var == 0
    {
        delay_min_var = delay_var;
        delay_max_var = delay_var;
    }
    // Collision
    coll_var[0] = global.mon_coll[0];
    coll_var[1] = global.mon_coll[1];
    coll_var[2] = global.mon_coll[2];
    // Pathfinding
    if type_var > 0
    {
        path_var = path_add();
        switch type_var
        {
            case 1: { grid_var = global.phys_grid; break; }
            case 2: { grid_var = global.float_grid; break; }
        }
    }
    // Alarms
    if alarm_len_var == 0
    { alarm_len_var = 6; }
    alarm_arr[0,2] = '';
    alarm_arr[1,2] = '';
    alarm_arr[2,2] = '';
    alarm_arr[3,2] = '';
    alarm_arr[4,2] = '';
    alarm_arr[5,2] = '';
    // Room start
    event_perform(ev_other,ev_room_start);
");
// Destroy Event
object_event_add
(argument0,ev_destroy,0,"
    event_inherited();
    if type_var > 0 && path_exists(path_var)
    { path_delete(path_var); }
");
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,"
    event_inherited();
    // Reset Variables
    move_var = do_move_var;
    anim_var = do_anim_var;
    attack_var = do_attack_var;
    hurt_var = false;
    enter_var = type_var > 0;
    do_coll_var = false;
    // Color
    if !instance_exists(color_par_obj) 
    { image_blend = c_white; }
    // Reset Position
    yaw_var = global.spawn_arr[0,3];
    x = global.spawn_arr[0,0]-lengthdir_x(32,yaw_var);
    y = global.spawn_arr[0,1]-lengthdir_y(32,yaw_var);
    z = global.spawn_arr[0,2];
    set_motion_3d_scr(0,true,yaw_var,true,0,true);
    // Delay
    if delay_min_var > 0
    {
        on_var = false;
        set_alarm_scr(0,irandom_range(delay_min_var,delay_max_var));
    }
    else { event_perform(ev_alarm,0); }
");
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,"
    if on_var
    {
        if move_var
        {
            event_perform(ev_other,ev_user6); 
            event_perform(ev_other,ev_user0); 
        }
        if anim_var { event_perform(ev_other,ev_user1); }
        if attack_var { event_perform(ev_other,ev_user2); }
        if sight_var { event_perform(ev_other,ev_user5); }
    }
");
// Draw Event
object_event_add
(argument0,ev_draw,0,"
    if on_var || visible_var
    {
        d3d_transform_set_identity();
        d3d_transform_add_rotation_z(point_direction(x,y,global.cam_x_var[view_current],global.cam_y_var[view_current]));
        d3d_transform_add_translation(x,y,z+z_off_var);
        draw_set_color(image_blend); draw_set_alpha(image_alpha);
        d3d_draw_wall(0,w_var/2,h_var,0,-w_var/2,0,tex_var,1,1);
        d3d_transform_set_identity();
        draw_set_color(c_white); draw_set_alpha(1);
        if path_exists(path_var) && path_var != 0
        { draw_path(path_var,x,y,false); }
        // mp_grid_draw(grid_var);
    }
");
// Delay Alarm
object_event_add
(argument0,ev_alarm,0,"
    on_var = true;
");
// Unstun Alarm
object_event_add
(argument0,ev_alarm,1,"
    move_var = do_move_var;
");
// Start Anim Alarm
object_event_add
(argument0,ev_alarm,2,"
    anim_var = do_anim_var;
");
// Hurt Alarm
object_event_add
(argument0,ev_alarm,3,"
    hurt_var = false;
");
// Attack Alarm
object_event_add
(argument0,ev_alarm,4,"
    attack_var = do_attack_var;
");
// Anim Alarm (Different from Plus!!!)
object_event_add
(argument0,ev_alarm,5,"
    switch(anim_type_var)
    {
        case 0: { show_error('Animation type not set before animating.',false); }
        case 1: // End on last
        {
            spr_id_var = sprite_get_number(spr_var)-1;
            break;
        }
        case 2: // End on first
        {
            spr_id_var = 0;
            break;
        }
    }
    tex_var = sprite_get_texture(spr_var,spr_id_var);
");
// Movement
object_event_add
(argument0,ev_other,ev_user0,"
    local.spd = spd_base_var*spd_mult_var;
    if target_dist_var <= local.spd
    {
        if enter_var
        {
            x = target_x_var;
            y = target_y_var;
            z = target_z_var;
            do_coll_var = true;
            enter_var = false;
        }
        else
        {
            x = target_x_var;
            y = target_y_var;
            z = target_z_var;
            set_motion_3d_scr(0,true);
        }
    }
    else if type_var > 0
    {
        local.can_path = mp_grid_path(grid_var,path_var,x,y,target_x_var,target_y_var,true);
        // V3
        local.dist = 10000000;
        local.radius = coll_var[2]/2;
        local.ztmp = z+(coll_var[1]/2);
        local.xvec = (target_x_var-x)/target_dist_var;
        local.yvec = (target_y_var-y)/target_dist_var;
        local.zvec = (target_z_var-z)/target_dist_var;
        for (local.i=0; local.i<4; local.i+=1;)
        {
            local.xtmp = x+lengthdir_x(local.radius,local.i*90);
            local.ytmp = y+lengthdir_y(local.radius,local.i*90);
            /*local.xvec = (target_x_var-local.xtmp)/target_dist_var;
            local.yvec = (target_y_var-local.ytmp)/target_dist_var;*/
            local.dist = min
            (
                local.dist,
                p3dc_ray_still_scr
                (
                    global.room_coll,
                    local.xtmp,local.ytmp,local.ztmp,
                    local.xvec,local.yvec,local.zvec
                )
            );
        }
        if enter_var || !local.can_path || local.dist+local.radius >= target_dist_var
        { local.yaw = point_direction(x,y,target_x_var,target_y_var); }
        else
        {
            local.yaw = point_direction
            (
                path_get_point_x(path_var,0),
                path_get_point_y(path_var,0),
                path_get_point_x(path_var,1),
                path_get_point_y(path_var,1)
            );
        }
        if do_acc_var { acc_scr(global.delta_time_var,acc_var,frick_var,local.yaw,local.spd); }
        else { set_motion_scr(local.spd,true,local.yaw,true); }
    }
    else
    {
        local.yaw = point_direction(x,y,target_x_var,target_y_var);
        local.pitch = point_direction_3d_scr(x,y,z,target_x_var,target_y_var,target_z_var);
        if do_acc_var { acc_3d_scr(global.delta_time_var,acc_var,frick_var,local.yaw,local.pitch,local.spd); }
        else { set_motion_3d_scr(local.spd,true,local.yaw,true,local.pitch,true); }
    }
");
// Animation
object_event_add
(argument0,ev_other,ev_user1,"
    switch(anim_type_var)
    {
        case 0: // Animate normally
        {
            spr_id_var = (spr_id_var+(spr_spd_var*global.delta_time_var)) mod sprite_get_number(spr_var);
            break;
        }
        case 1: // End on last
        {
            spr_id_var = floor(sprite_get_number(spr_var)*(1-(alarm_arr[5,0]/alarm_arr[5,1])));
            break;
        }
        case 2: // End on first
        {
            spr_id_var = floor(sprite_get_number(spr_var)*alarm_arr[5,0]/alarm_arr[5,1]);
            break;
        }
    }
    tex_var = sprite_get_texture(spr_var,spr_id_var);
");
// Attack
object_event_add
(argument0,ev_other,ev_user2,"
    local.dead = true;
    with player_obj
    {
        if !dead_var && !hurt_var && !in_door_var && on_var
        {
            // p3dc_check_scr(coll_var[0],x,y,z,other.coll_var[0],other.x,other.y,other.z)
            if cyl_coll_scr(x,y,z,coll_var[2],coll_var[1],other.x,other.y,other.z,other.coll_var[2],other.coll_var[1])
            {
                if hp_var > other.dmg_var
                {
                    hp_var -= other.dmg_var;
                    if other.dmg_alarm_var
                    {
                        hurt_var = true;
                        set_alarm_scr(0,other.dmg_alarm_var);
                    }
                    hurt_target_var = other.id;
                    event_perform(ev_other,ev_user0);
                }
                else
                {
                    hp_var = 0;
                    dead_var = true;
                    do_coll_var = false;
                    grav_var = false;
                }
                attack_target_var = id;
                local.success = true;
            }
        }
        if !dead_var { local.dead = false; }
    }
    if local.success
    {
        if false//local.dead
        {
            global.dead_mon_var = object_index;
            instance_destroy();
            room_goto(dead_rm_var);
        }
        else { event_perform(ev_other,ev_user3); }
    }
");
// Attack Success
// Uses attack_target_var as an argument, usually the player.
object_event_add
(argument0,ev_other,ev_user3,"
    with instance_create(0,0,blood_eff_obj)
    {
        // Set camera to player
        cam_id_var = other.attack_target_var.cam_id_var;
    }
");
// Hurt
/*Weapons call this function when attacking
Weapons set hurt_weapon_var, hurt_target_var, hurt_power_var, and hurt_type_var, to use as arguments in this function
hurt_weapon_var: The weapon
hurt_target_var: Typically the player
hurt_power_var: Default is 1, functions more as a multiplier
hurt_type_var
    0: Default
    1: Spiritual
    2: Bullet
    3: Parry
*/
object_event_add
(argument0,ev_other,ev_user4,"
    if hurt_alarm_var
    {
        hurt_var = true;
        set_alarm_scr(3,hurt_alarm_var);
    }
    if violence_var > 0 { hurt_target_var.violence_var += violence_var; }
    // Reduce duration if very vulnerable
    if do_hurt_var == 2 || (do_hurt_var == 3 && hurt_type_var == 1)
    && dur_var > 0 && hurt_dur_var > 0
    {
        dur_var -= hurt_dur_var*hurt_power_var;
        if dur_var <= 0 { instance_destroy(); exit; }
    }
    // You can set this to higher values to have custom stun behavior
    if stun_var == 1 
    {
        set_motion_scr(0,true,yaw_var,false);
        move_var = false;
        anim_var = false;
        attack_var = false;
        if hurt_alarm_var
        {
            set_alarm_scr(1,hurt_alarm_var);
            set_alarm_scr(2,hurt_alarm_var);
            set_alarm_scr(4,hurt_alarm_var);
        }
    }
");
// Calculate Seen
object_event_add
(argument0,ev_other,ev_user5,"
    if instance_exists(target_var)
    {
        target_eye_yaw_var = target_var.eye_yaw_var;
        target_eye_pitch_var = target_var.eye_pitch_var;
        local.yaw = abs(deg_diff_scr(point_direction(target_x_var,target_y_var,x,y),target_eye_yaw_var));
        local.pitch = abs(deg_diff_scr(point_direction_3d_scr(target_x_var,target_y_var,target_z_var,x,y,z),target_eye_pitch_var));
        if local.yaw <= seen_yaw_var && local.pitch <= seen_pitch_var
        { seen_var = true; seen_per_var = 1-max(local.yaw/seen_yaw_var,local.pitch/seen_pitch_var); }
        else { seen_var = false; seen_per_var = 0; }
    }
    else { seen_var = -1; seen_per_var = -1; }
");
// Determine target
object_event_add
(argument0,ev_other,ev_user6,"
    if enter_var
    {
        target_var = noone;
        target_x_var = global.spawn_arr[target_spawn_var,0];
        target_y_var = global.spawn_arr[target_spawn_var,1];
        target_z_var = global.spawn_arr[target_spawn_var,2];
        target_dist_var = point_distance_3d_scr(x,y,z,target_x_var,target_y_var,target_z_var);
    }
    else
    {
        target_var = noone;
        other.target_dist_var = 0;
        with (player_obj)
        {
            local.dist = point_distance_3d_scr(other.x,other.y,other.z,x,y,z);
            if !dead_var && (other.target_var == noone || local.dist < other.target_dist_var)
            {
                other.target_var = id;
                other.target_dist_var = local.dist;
            }
        }
        if target_var != noone
        {
            target_x_var = target_var.x;
            target_y_var = target_var.y;
            target_z_var = target_var.z;
        }
        else
        {
            target_x_var = x;
            target_y_var = y;
            target_z_var = z;
        }
    }
");
