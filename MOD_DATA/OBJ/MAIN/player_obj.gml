// Builtin Variables
object_set_depth(argument0,100);
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
    player_id_var = 0;
    violence_var = 0;
    on_var = true;
    // Collision
    do_coll_var = true;
    coll_var[0] = global.player_coll[0];
    coll_var[1] = global.player_coll[1];
    coll_var[2] = global.player_coll[2];
    // HP
    if global.one_shot_var { hp_max_var = 0; }
    else { hp_max_var = 100; }
    hp_var = hp_max_var;
    heal_rate_var = 1/60;
    heal_var = true;
    heal_delay_var = 0;
    heal_safe_var = 10;
    heal_mult_var = 1;
    dead_var = false;
    alarm_arr[1,2] = true; // Persists between rooms
    hp_infect_var = 0;
    invuln_var = false;
    // Speed
    spd_base_var = 1;
    spd_mult_var = 1;
    back_spd_mult_var = 0.6; // Normally 0.5, but I use 0.6 so the run speed is accurate
    back_var = false; // Whether to reduce speed when walking backwards
    normal_var = true;
    invert_var = false;
    // Stamina
    do_stam_var = true;
    do_sprint_var = true; // Uhh yeah I sure hope it does
    sprint_var = 0;
    stam_max_var = 100;
    stam_var = stam_max_var;
    stam_rate_var = 0.5;
    sprint_spd_mult_var = 2.5;
    // Faster stamina drain when pressing sprint
    start_stam_var = 0;
    start_stam_base_var = 1;
    start_stam_rate_var = 1/19; // 19 frames
    // Acceleration
    do_acc_var = true;
    frick_var = 0.5;
    acc_var = 0.8;
    frick_mult_var = 1;
    air_frick_mult_var = 0.1;
    // Crouch
    crouch_var = false;
    can_crouch_var = global.crouch_var;
    crouch_spd_mult_var = 0.6;
    // Camera
    base_eye_h_var = 114/7; // 16 + 2/7
    crouch_eye_h_var = 72/7; // 16 - 6 + 2/7
    target_eye_h_var = base_eye_h_var;
    eye_h_var = base_eye_h_var;
    eye_rate_var = 0.4;
    eye_rate_min_var = 0.5;
    eye_yaw_var = 0;
    eye_pitch_var = 0;
    cam_id_var = 0;
    // Turnaround
    turn_alarm_var = 8;
    turn_var = false;
    turn_yaw_var = 0;
    // Jump
    jump_var = false;
    jump_hold_var = false;
    can_jump_var = global.jump_var;
    jump_z_spd_var = 0.7;
    jump_spd_mult_var = 1.2;
    jump_grav_var = 2;
    jump_stam_var = 20;
    // About 20 (20 times gravity over jump velocity)
    // 0.625 for 15
    jump_stam_rate_var = 0.83;
    // Fall
    fall_dmg_var = 15;
    fall_dmg_alarm_var = 120;
    fall_var = global.fall_var; // Brutal!
    // Gravity
    grav_base_var = grav_const;
    grav_var = grav_base_var;
    on_floor_var = true;
    // Bob
    bob_rate_var = 3.75;
    bob_mult_var = global.move_bob_var/100; // 12/7
    bob_var = 0;
    // Idle Bob
    breath_rate_var = 1;
    breath_mult_var = global.idle_bob_var/100;
    breath_var = 0;
    breath_time_var = 0;
    breath_asthma_rate_var = 2;
    breath_do_var = true;
    // FOV
    fov_var = global.fov_var;
    current_fov_var = fov_var;
    fov_rate_var = 0.2;
    fov_rate_min_var = 0.5;
    // Flare
    flare_var = 0;
    flare_yaw_var = 5.856;
    flare_pitch_var = 5.856;
    flare_rate_01_var = 0.01;
    flare_rate_02_var = 0.02;
    flare_dist_var = 120;
    do_flare_per_var = true;
    // Door
    enter_delay_var = 20;
    // Shake
    shake_var = 0;
    shake_angle_base_var = 5;
    shake_pos_base_var = 1;
    // Clear Time
    path_var = path_add();
    grid_var = global.phys_grid;
    // Alarms
    alarm_len_var = 5;
    alarm_ini_scr();
    alarm_arr[1,2] = true; // Persistant
    revive_alarm_var = 300;
    // Possess
    possess_var = false;
    possess_delay_var = 0;
    possess_delay_max_var = 10;
    // Behavior
    switch global.player_type_var
    {
        case 1:
        {
            back_var = true;
            breath_do_var = false;
            flare_pitch_var = 0;
            do_flare_per_var = false;
            heal_safe_var = 1;
            // normal_var = false;
            break;
        }
        case 2:
        {
            do_acc_var = false;
            breath_do_var = false;
            spd_base_var = 5/pf_ms_rate_const;
            sprint_spd_mult_var = 1.8;
            do_flare_per_var = false;
            start_stam_base_var = 0;
            heal_delay_var = 480; // 60?
            heal_rate_var = 1/6;
            heal_safe_var = 1;
            stam_rate_var = 5/12;
            break;
        }
    }
    // Taker Behavior
    do_taker_var = true;
    taker_var = false;
    taker_alarm_var = 7200; // 5940
    taker_mon_alarm_var = 731; // 540
    switch global.taker_type_var
    {
        case 0: { taker_alarm_var = 7310; break; } // Recode
        // Gotta take the wikis word, cant find it
        case 2: { taker_alarm_var = 4200; break; } // HD
        case 3: { taker_alarm_var = 2760; break; } // DH
    }
    set_alarm_scr(3,taker_alarm_var);
    // Stuff
    event_perform(ev_other,ev_room_start);
');
// Destroy Event
object_event_add
(argument0,ev_destroy,0,'
    path_delete(path_var);
');
// Hurt Alarm
object_event_add
(argument0,ev_alarm,0,'
    hurt_var = false;
');
// Heal Alarm
object_event_add
(argument0,ev_alarm,1,'
    heal_var = true;
');
// Door Alarm
object_event_add
(argument0,ev_alarm,2,'
    in_door_var = false;
');
// Taker Alarm
object_event_add
(argument0,ev_alarm,3,'
    if on_var && !in_door_var && !active_var && !taker_spawn_var
    {
        if possess_var { local.bool = mon_var.on_var && !mon_var.enter_var; }
        else { local.bool = on_var && !dead_var; }
        if local.bool
        {
            taker_spawn_var = true;
            with instance_create(0,0,taker_obj)
            {
                target_var = other.id;
                cam_id_var = other.cam_id_var;
                target_possess_var = other.possess_var;
            }
        }
    }
');
// Turn Alarm
object_event_add
(argument0,ev_alarm,4,'
    turn_var = false;
    cam_yaw_var = eye_yaw_var;
    cam_pitch_var = eye_pitch_var;
    display_mouse_set(display_get_width()/2,display_get_height()/2);
');
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,'
    if on_var
    {
        // Position
        eye_yaw_var = 0;
        if global.spawn_len_var
        {
            x = global.spawn_arr[0,0];
            y = global.spawn_arr[0,1];
            z = global.spawn_arr[0,2];
            eye_yaw_var = global.spawn_arr[0,3];
        }
        if global.player_len_var > 1
        {
            switch global.player_len_var
            {
                case 2:
                {
                    if player_id_var { y += 8; }
                    else { y -= 8; }
                    break;
                }
                case 4:
                {
                    local.dist = sqrt(128);
                    local.dir = (player_id_var*-90)+45;
                    x += lengthdir_x(local.dist,local.dir);
                    y += lengthdir_y(local.dist,local.dir);
                    break;
                }
                default:
                {
                    local.dist = 8;
                    local.dir = 360*player_id_var/global.player_len_var;
                    x += lengthdir_x(local.dist,local.dir);
                    y += lengthdir_y(local.dist,local.dir);
                    break;
                }
            }
            
        }
        eye_pitch_var = 0;
        eye_roll_var = 0;
        set_motion_3d_scr(0,false,eye_yaw_var,true,eye_pitch_var,true);
        display_mouse_set(display_get_width()/2,display_get_height()/2);
        // Reset variables
        shake_var = 0;
        jump_var = false;
        on_floor_var = true;
        jump_hold_var = false;
        grav_var = grav_base_var;
        fall_temp_var = false;
        in_door_var = false;
        hurt_var = false;
        turn_var = false;
        if !global.dynamic_fov_var
        { current_fov_var = fov_var; }
        // Healing
        if heal_delay_var <= 0 || alarm_arr[0,1] <= 0
        { heal_var = true; }
        // Bob
        bob_time_var = 45;
        breath_time_var = 0;
        // Camera
        cam_x_var = x;
        cam_y_var = y;
        cam_z_var = z+eye_h_var;
        cam_yaw_var = eye_yaw_var;
        cam_pitch_var = eye_pitch_var;
        cam_roll_var = eye_roll_var;
        cam_set_scr(cam_id_var,cam_x_var,cam_y_var,cam_z_var,cam_yaw_var,cam_pitch_var,current_fov_var,cam_roll_var,dead_var);
        // View
        view_visible[cam_id_var] = true;
        view_enabled = true;
        // Clear time
        clear_time_var = -1;
        walk_clear_time_var = -1;
        if global.spawn_len_var > 0
        {
            if global.unlock_var > 0 { local.spawn = global.unlock_var; }
            else { local.spawn = irandom_range(1,global.spawn_len_var-1); }
            if mp_grid_path(grid_var,path_var,x,y,global.spawn_arr[local.spawn,0],global.spawn_arr[local.spawn,1],true)
            {
                if do_sprint_var
                {
                    if do_stam_var { local.spd = spd_base_var*(1+sprint_spd_mult_var)*9/19; }
                    else { local.spd = spd_base_var*sprint_spd_mult_var; }
                }
                else { local.spd = spd_base_var; }
                clear_time_var = path_get_length(path_var)/local.spd;
                walk_clear_time_var = path_get_length(path_var)/spd_base_var;
            } 
        }
        // Start room
        possess_delay_var = max(possess_delay_var-1,0);
        taker_spawn_var = false;
        if !global.stam_per_var
        {
            stam_var = stam_max_var;
            start_stam_var = start_stam_base_var;
        }
        hurt_var = true;
        set_alarm_scr(0,enter_delay_var);
        set_alarm_scr(3,taker_alarm_var);
        with instance_create(0,0,fade_eff_obj)
        {
            image_blend = c_black; 
            set_alarm_scr(0,other.enter_delay_var); 
            invert_var = false;
            stay_var = false;
            cam_id_var = other.cam_id_var;
        }
    }
');
// Step
object_event_add
(argument0,ev_step,ev_step_normal,'
    if on_var && !in_door_var
    {
        if !possess_var
        {
            event_inherited();
            // Camera
            if global.input_press_arr[turnaround_input_const,player_id_var]
            {
                turn_var = true;
                turn_yaw_var = eye_yaw_var;
                turn_pitch_var = eye_pitch_var;
                set_alarm_scr(4,turn_alarm_var);
                eye_yaw_var += 180;
            }
            if !turn_var
            {
                eye_yaw_var += input_yaw_scr(player_id_var);
                eye_pitch_var += input_pitch_scr(player_id_var);
            }
            eye_yaw_var = mod_scr(eye_yaw_var,360);
            eye_pitch_var = median(-89.9,89.9,eye_pitch_var);
            // Get inputs
            local.input_dir_x = input_x_scr(player_id_var);
            local.input_dir_y = input_y_scr(player_id_var);
            if invert_var // Sorry I need this for Plus
            {
                local.input_dir_x *= -1;
                local.input_dir_y *= -1;
            }
            local.input_dir = radtodeg(arctan2(-local.input_dir_y,local.input_dir_x));
            // Extra movement handling
            if do_coll_var && grav_var > 0
            {
                local.input_dir_z = 0;
                // Jump!
                if can_jump_var && global.input_press_arr[jump_input_const,player_id_var] && on_floor_var && (stam_var > jump_stam_var || !do_stam_var)
                {
                    if do_stam_var
                    { stam_var -= jump_stam_var; }
                    z_spd_var = jump_z_spd_var;
                    jump_var = true;
                    jump_hold_var = true;
                    on_floor_var = false;
                    fall_temp_var = true; // For big rooms
                    z += grav_var;
                }
                if jump_var
                {
                    if on_floor_var
                    {
                        jump_var = false;
                        jump_hold_var = false;
                        grav_var = grav_base_var;
                    }
                    else
                    {
                        if jump_hold_var
                        {
                            if global.input_press_arr[jump_input_const,player_id_var] == -1 || z_spd_var <= 0
                            { jump_hold_var = false; }
                            else if do_stam_var { stam_var -= jump_stam_rate_var*global.delta_time_var; }
                        }
                        if jump_hold_var || z_spd_var <= 0
                        { grav_var = grav_base_var; }
                        else { grav_var = grav_base_var*jump_grav_var; }
                    }
                }
                // Crouch!
                if can_crouch_var
                {
                    if (global.input_press_arr[crouch_input_const,player_id_var] && global.crouch_toggle_var[player_id_var]) 
                    || (global.input_arr[crouch_input_const,player_id_var] != crouch_var && !global.crouch_toggle_var[player_id_var])
                    {
                        local.znext = z;
                        if !on_floor_var
                        {
                            local.coll_diff = global.player_coll[1]-global.player_crouch_coll[1];
                            if !crouch_var { local.znext += local.coll_diff; }
                            else { local.znext -= local.coll_diff; }
                        }
                        if !crouch_var
                        {
                            crouch_var = true;
                            coll_var[0] = global.player_crouch_coll[0];
                            coll_var[1] = global.player_crouch_coll[1];
                            coll_var[2] = global.player_crouch_coll[2];
                            z = local.znext;
                            target_eye_h_var = crouch_eye_h_var;
                        }
                        else if !check_coll_scr(-1,global.player_coll[0],global.player_coll[1],global.player_coll[2],x,y,local.znext+0.01)
                        {
                            crouch_var = false;
                            coll_var[0] = global.player_coll[0];
                            coll_var[1] = global.player_coll[1];
                            coll_var[2] = global.player_coll[2];
                            z = local.znext;
                            target_eye_h_var = base_eye_h_var;
                        }
                        else if !on_floor_var
                        {
                            local.zdist = 10000000;
                            local.radius = coll_var[2]/2;
                            for (local.i=0; local.i<5; local.i+=1;)
                            {
                                local.xtmp = x;
                                local.ytmp = y;
                                if local.i != 0
                                {
                                    local.xtmp += lengthdir_x(local.radius,local.i*90);
                                    local.ytmp += lengthdir_y(local.radius,local.i*90);
                                }
                                local.zdist = min
                                (
                                    local.zdist,
                                    check_ray_scr
                                    (
                                        local.xtmp,local.ytmp,z+coll_var[1],
                                        0,0,-1
                                    )
                                );
                            }
                            local.zdist -= coll_var[1];
                            local.znext = z-local.zdist;
                            if !check_coll_scr(-1,global.player_coll[0],global.player_coll[1],global.player_coll[2],x,y,local.znext+0.01)
                            {
                                crouch_var = false;
                                coll_var[0] = global.player_coll[0];
                                coll_var[1] = global.player_coll[1];
                                coll_var[2] = global.player_coll[2];
                                z = local.znext;
                                z_spd_var = 0;
                                on_floor_var = true;
                                target_eye_h_var = base_eye_h_var;
                            }
                        }
                        if !on_floor_var { eye_h_var = target_eye_h_var }
                    }
                }
            }
            else
            {
                local.input_dir_z = input_z_scr(player_id_var);
                local.input_dir_pitch = radtodeg(arctan2(local.input_dir_z,sqrt(sqr(local.input_dir_x)+sqr(local.input_dir_y))));
            }
            // Is the player active?
            active_var = abs(local.input_dir_x) || abs(local.input_dir_y) || abs(local.input_dir_z)
            || global.input_arr[sprint_input_const,player_id_var] || global.input_arr[jump_input_const,player_id_var]
            || global.input_arr[crouch_input_const,player_id_var] || global.input_arr[attack_input_const,player_id_var];
            // Show taker hud
            if do_taker_var
            {
                if dead_var { taker_var = possess_delay_var > 0 }
                else
                {
                    taker_var = !active_var || taker_spawn_var;
                    with player_obj { if id != other.id && in_door_var { other.taker_var = true; break; }}
                    if !taker_var { set_alarm_scr(3,taker_alarm_var); }
                }
            }
            // Sprint
            sprint_var = do_sprint_var && global.input_arr[sprint_input_const,player_id_var] && (stam_var > 0 || !do_stam_var);
            // Calculate speed
            local.spd = 0;
            if local.input_dir_x != 0 || local.input_dir_y != 0 || local.input_dir_z != 0
            {
                local.spd = spd_base_var;
                if sprint_var { local.spd *= sprint_spd_mult_var; }
                if crouch_var { local.spd *= crouch_spd_mult_var; }
                if jump_var { local.spd *= jump_spd_mult_var; }
                local.spd *= spd_mult_var;
            }
            spd_mult_var = 1;
            // Calculate friction and acceleration
            local.acc = acc_var;
            local.frick = frick_var;
            if !on_floor_var
            {
                local.acc *= air_frick_mult_var;
                local.frick *= air_frick_mult_var;
            }
            local.acc *= frick_mult_var;
            local.frick *= frick_mult_var;
            frick_mult_var = 1;
            // Accelerate and move
            if !do_coll_var || grav_var <= 0
            {
                on_floor_var = true;
                if global.input_move_var[player_id_var] != move_button_const { local.spd *= median(0,1,sqrt(sqr(local.input_dir_x)+sqr(local.input_dir_y)+sqr(local.input_dir_z))); }
                if back_var { local.spd *= lerp_scr(1,back_spd_mult_var,abs(local.input_dir)/180); }
                if do_acc_var { acc_3d_scr(global.delta_time_var,local.acc,local.frick,local.input_dir+eye_yaw_var,local.input_dir_pitch+(eye_pitch_var*lengthdir_x(1,local.input_dir)),local.spd); }
                else { set_motion_3d_scr(local.spd,true,local.input_dir+eye_yaw_var,true,local.input_dir_pitch+(eye_pitch_var*lengthdir_x(1,local.input_dir)),true)}
            }
            else if z <= -128 // Maybe add deathplane later?
            {
                x = floor_x_var;
                y = floor_y_var;
                z = floor_z_var;
                fall_temp_var = false;
                set_motion_scr(0,false,eye_yaw_var,true);
                event_user(0);
                if hp_var > fall_dmg_var
                {
                    hp_var -= fall_dmg_var;
                    if fall_dmg_alarm_var
                    {
                        hurt_var = true;
                        set_alarm_scr(0,fall_dmg_alarm_var);
                    }
                    hurt_target_var = id;
                    fmod_snd_play_scr(claw_snd);
                    with instance_create(0,0,blood_eff_obj)
                    { cam_id_var = other.cam_id_var; }
                    event_user(0);
                }
                else
                {
                    hp_var = 0;
                    dead_var = true;
                    do_coll_var = false;
                    grav_var = false;
                }
            }
            else if normal_var
            {
                if global.input_move_var[player_id_var] != move_button_const { local.spd *= median(0,1,sqrt(sqr(local.input_dir_x)+sqr(local.input_dir_y))); }
                if back_var { local.spd *= lerp_scr(1,back_spd_mult_var,abs(local.input_dir)/180); }
                if do_acc_var { acc_scr(global.delta_time_var,local.acc,local.frick,local.input_dir+eye_yaw_var,local.spd); }
                else { set_motion_scr(local.spd,true,local.input_dir+eye_yaw_var,true); }
            }
            else
            {
                local.forspd = local.spd;
                local.sidespd = local.spd;
                if back_var
                {
                    if local.input_dir_x < 0 { local.forspd *= back_spd_mult_var;}
                    local.sidespd *= (back_spd_mult_var+1)/2;
                }
                if do_acc_var { acc_odd_scr(global.delta_time_var,local.acc,local.frick,local.input_dir_x,local.input_dir_y,local.forspd,local.sidespd,eye_yaw_var); }
                else { set_motion_odd_scr(local.forspd*local.input_dir_x,true,local.sidespd*local.input_dir_y,true,eye_yaw_var,true); }
            }
            // Possession
            if dead_var && !possess_var && possess_delay_var <= 0
            {
                if global.input_press_arr[interact_input_const,player_id_var]
                {
                    with enemy_par_obj
                    {
                        if do_possess_var && on_var && !possess_var
                        {
                            if cyl_coll_scr(x,y,z,coll_var[2],coll_var[1],other.x,other.y,other.z,other.coll_var[2],other.coll_var[1])
                            {
                                possess_var = true;
                                other.possess_var = true;
                                other.mon_var = id;
                                player_id_var = other.player_id_var;
                                cam_id_var = other.cam_id_var;
                                break;
                            }
                        }
                    }
                    if possess_var { set_motion_3d_scr(0,true); }
                }
            }
        }
        else
        {
            x = mon_var.x;
            y = mon_var.y;
            z = mon_var.z;
            eye_yaw_var = mon_var.eye_yaw_var;
            eye_pitch_var = mon_var.eye_pitch_var;
            active_var = mon_var.active_var || mon_var.enter_var || !mon_var.on_var;
            if do_taker_var
            {
                taker_var = !active_var || taker_spawn_var;
                if !taker_var { set_alarm_scr(3,taker_mon_alarm_var); }
            }
        }
    }
');
// End Step
object_event_add
(argument0,ev_step,ev_step_end,'
    if on_var && !in_door_var && !possess_var
    {
        event_inherited();
        // Get real speed for bobbing and stamina (already delta-timed)
        local.real_spd = point_distance(xprevious,yprevious,x,y);
        local.stam_rate = 0;
        if on_floor_var
        {
            // Calculate stamina
            if do_stam_var
            {
                if sprint_var
                {
                    start_stam_var = max(0,start_stam_var-(start_stam_rate_var*global.delta_time_var));
                    local.stam_rate = (-(stam_rate_var+start_stam_var)*local.real_spd)/(spd_base_var*sprint_spd_mult_var);
                }
                else if !global.input_arr[sprint_input_const,player_id_var]
                {
                    start_stam_var = start_stam_base_var;
                    local.stam_rate = stam_rate_var*global.delta_time_var;
                }
            }
            // Calculate bobbing
            if local.real_spd
            {
                local.bobprev = bob_time_var;
                bob_time_var = (bob_time_var+(bob_rate_var*local.real_spd)) mod 180;
                bob_var = bob_mult_var*(sin(degtorad(bob_time_var))-0.5);
                if local.bobprev > bob_time_var
                {
                    // Play footsteps
                    switch floor_mask_var
                    {
                        case mask_basic_const: { fmod_snd_play_scr(choose(ft_01_snd,ft_02_snd,ft_03_snd,ft_04_snd,ft_05_snd,ft_06_snd)); break; }
                        case mask_metal_const: { fmod_snd_play_scr(choose(ft_m_01_snd,ft_m_02_snd,ft_m_03_snd,ft_m_04_snd)); break; }
                    }
                }
            }
        }
        // Clamp stamina
        stam_var = median(0,stam_max_var,stam_var+local.stam_rate);
        // As We Breathe
        local.breath_rate = (breath_rate_var+(breath_asthma_rate_var*sqr(1-(stam_var/stam_max_var))))*global.delta_time_var;
        breath_time_var = (breath_time_var+local.breath_rate) mod 360;
        breath_var = breath_mult_var*sin(degtorad(breath_time_var));
        // Calculate health
        if !hurt_var && !in_door_var && heal_var && !dead_var && hp_var < hp_max_var
        {
            local.heal_rate = heal_rate_var*heal_mult_var*global.delta_time_var;
            if !instance_exists(enemy_par_obj) { local.heal_rate *= heal_safe_var; }
            hp_var = min(hp_max_var,hp_var+local.heal_rate);
            hp_infect_var -= local.heal_rate;
            heal_mult_var = 1;
        }
        // Clamp Health
        hp_var = max(0,hp_var); // median(0,hp_max_var,hp_var); Allow overheal
        hp_infect_var = median(0,hp_max_var-hp_var,hp_infect_var);
        // Calculate FOV
        if global.dynamic_fov_var
        {
            local.target_fov = fov_var*power(max(1,spd_var/spd_base_var),0.25); // 0.6
            if current_fov_var != local.target_fov
            {
                local.fov_diff = abs(local.target_fov-current_fov_var);
                local.fov_rate = max(fov_rate_min_var,local.fov_diff*fov_rate_var)*global.delta_time_var;
                current_fov_var += min(local.fov_diff,local.fov_rate)*sign(local.target_fov-current_fov_var);
            }
        }
        // Calculate eye height
        if target_eye_h_var != eye_h_var
        {
            local.eye_diff = abs(target_eye_h_var-eye_h_var);
            local.eye_rate = max(eye_rate_min_var,local.eye_diff*eye_rate_var)*global.delta_time_var;
            eye_h_var += min(local.eye_diff,local.eye_rate)*sign(target_eye_h_var-eye_h_var);
        }
        // Camera
        cam_x_var = x;
        cam_y_var = y;
        cam_z_var = z+eye_h_var+bob_var+breath_var;
        if turn_var
        {
            cam_yaw_var = lerp_scr(eye_yaw_var,turn_yaw_var,alarm_arr[4,0]/alarm_arr[4,1]);
            cam_pitch_var = lerp_scr(eye_pitch_var,turn_pitch_var,alarm_arr[4,0]/alarm_arr[4,1]);
        }
        else
        {
            cam_yaw_var = eye_yaw_var;
            cam_pitch_var = eye_pitch_var;
        }
        cam_roll_var = eye_roll_var;
        // Camera shake
        if shake_var > 0
        {
            switch (global.shake_type_var)
            {
                case shake_classic_const:
                {
                    cam_x_var += random_range(-shake_var,shake_var);
                    cam_y_var += random_range(-shake_var,shake_var);
                    cam_z_var += random_range(-shake_var,shake_var);
                    break;
                }
                case shake_modern_const:
                {
                    cam_yaw_var += random_range(-shake_var,shake_var);
                    cam_pitch_var += random_range(-shake_var,shake_var);
                    cam_roll_var += random_range(-shake_var,shake_var);
                    break;
                }
            }
        }
        // Lens flare
        flare_per_var = 0;
        with light_torch_obj
        {
            local.dist = point_distance_3d_scr(other.x,other.y,other.z,x,y,z);
            if local.dist <= other.flare_dist_var && visible
            {
                local.distper = local.dist/other.flare_dist_var;
                if other.flare_yaw_var
                {
                    local.yaw = abs(deg_diff_scr(point_direction(other.x,other.y,x,y),other.eye_yaw_var));
                    local.radius = w_var/2; local.angle = radtodeg(arctan2(local.radius,local.dist));
                    local.seenyaw = (local.yaw <= other.flare_yaw_var+local.angle); local.yawper = (local.yaw+local.angle)/(other.flare_yaw_var+local.angle);
                }
                else { local.seenyaw = true; local.yawper = 0; }
                if other.flare_pitch_var
                {
                    local.pitch = abs(deg_diff_scr(point_direction_3d_scr(other.x,other.y,other.z+other.eye_h_var,x,y,z),other.eye_pitch_var));
                    local.height = h_var/2; local.angle = radtodeg(arctan2(local.height,local.dist));
                    local.seenpitch = (local.pitch <= other.flare_pitch_var+local.angle); local.pitchper = (local.pitch+local.angle)/(other.flare_pitch_var+local.angle);
                }
                else { local.seenpitch = true; local.pitchper = 0; }
                if local.seenpitch && local.seenyaw { other.flare_per_var = max(other.flare_per_var,1-max(local.yawper,local.pitchper,local.distper))}
            }
        }
        if do_flare_per_var { local.target = flare_per_var; }
        else { local.target = sign(flare_per_var); }
        if flare_var != local.target
        {
            if flare_var < local.target { flare_var = min(local.target,flare_var+(flare_rate_01_var*global.delta_time_var)); }
            else { flare_var = max(local.target,flare_var-(flare_rate_02_var*global.delta_time_var)); }
        }
        flare_var = median(0,1,flare_var);
        // Set camera and listener position
        cam_set_scr(cam_id_var,cam_x_var,cam_y_var,cam_z_var,cam_yaw_var,cam_pitch_var,current_fov_var,cam_roll_var,dead_var);
        // Could put this in control, but needs extra camera boolean
        fmod_listen_pos_ex_scr
        (
            cam_id_var+1,
            global.cam_x_var[cam_id_var],global.cam_y_var[cam_id_var],global.cam_z_var[cam_id_var],
            global.cam_fx_var[cam_id_var],global.cam_fy_var[cam_id_var],global.cam_fz_var[cam_id_var],
            global.cam_ux_var[cam_id_var],global.cam_uy_var[cam_id_var],global.cam_uz_var[cam_id_var],
        );
    }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if on_var { cam_draw_scr(cam_id_var); }
');
// Hurt event
object_event_add
(argument0,ev_other,ev_user0,'
    // Heal
    if heal_delay_var > 0
    {
        heal_var = false;
        set_alarm_scr(1,heal_delay_var);
    }
    // Shake screen
    switch (global.shake_type_var)
    {
        case shake_classic_const:
        {
            with instance_create(0,0,shake_eff_obj)
            {
                player_var = other.id;
                mult_var = other.shake_pos_base_var;
                type_var = 0; // Constant
            }
            break;
        }
        case shake_modern_const:
        {
            with instance_create(0,0,shake_eff_obj)
            {
                player_var = other.id;
                mult_var = other.shake_angle_base_var;
                type_var = 1; // Fade out
            }
            break;
        }
    }
    if global.dmg_shake_var
    {
        eye_yaw_var = mod_scr(eye_yaw_var+random_range(-20,20),360);
        eye_pitch_var = median(-89.9,89.9,eye_pitch_var+random_range(-20,20));
    }
');