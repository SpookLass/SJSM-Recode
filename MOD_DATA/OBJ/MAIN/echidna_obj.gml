// Builtin Variables
object_set_depth(argument0,-3);
object_set_mask(argument0,noone);
object_set_parent(argument0,mon_par_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
/*
Variables

Main

    dur_var: The chase duration
    dur_start_var: How much duration a monster starts with, used for scripted events and boss bars
    delay_var: How much time before a monster starts acting

Draw

    anim_type_var
        0: Normal
        1: End on last
        2: End on first
        3: Random
        4: Custom
    do_anim_var: Whether the specimen should animate
    anim_var: Whether the specimen can currently animate
    w_var: How many pixels wide the monster is
    h_var: How many pixels tall the monster is
    x_off_var,y_off_var,z_off_var: How many pixels offset the monster draws
    sil_var: Draw silhouette. Mostly for incorporeal monsters
    sil_dist_var: How far to draw the silhouette to prevent Z-fighting
    sil_color_var: The color of the silhouette
    sil_alpha_var: The alpha of the silhouette (multiplied by image alpha)

Attack

    atk_type_var:
        0: Damage on contact
        1: Damage after delay, then rapid attack
        2: Damage after delay, then more delay after
    atk_anim_var:
        0: Do not animate when attacking
        1: Animate start and end
        2: Only animate start
    atk_start_snd_var
        0: None
        1: Swing
        2: Custom
    atk_snd_var
        0: Claw
        1: Axe
        2: Axe Hit
        3: Custom
    atk_flash_var: Whether to show flash
    do_atk_var: Whether the specimen should attack
    atk_var: Whether the specimen can currently attack
    dmg_var: How much damage a monster deals per hit
    dmg_alarm_var: How much time before something can hit the player again (per player)
    atk_range_var: How far the specimen can reach while attacking (diameter)
    atk_dist_var: How close the target should be before attempting to attack (If applicable)
    atk_delay_var: How long before the monster can start attacking
    atk_end_delay_var: How long until the monster can try to attack again

Movement

    type_var
        0: Ignores walls
        1: Pathfinds normally
        2: Floats over pits
    do_acc_var
        0: Doesn't accelerate
        1: Accelerates in a natural modern way
        2: Accelerates in a rigid classic way
        3: Only slows down
    do_move_var: Whether the specimen should move
    move_var: Whether the specimen can currently move
    do_enter_var: Whether the monster should enter the room before chasing the player
    enter_var: Whether a monster is entering the room
    spd_base_var: How fast the monster moves in pixels per frame (60fps)
    spd_mult_var: Multiplier for the monster's speed that resets every frame
    spd_mult_per_var: Multiplier for the monster's speed that doesn't reset every frame, mostly for monsters that have varied speeds
    acc_var: How fast the monster accelerates in pixels per frame squared (60fps)
    frick_var: How fast the monster decelerates in pixels per frame squared

Hurt

    do_hurt_var
        0: Cannot be hurt
        1: Hurt event is called
        2: Being damaged reduces duration or health
        3: Being damaged by spiritual weapons reduces duration or health
    hurt_die_var
        0: Monster only dies on the next room
        1: Monster dies when duration is depleted
        2: Monster only dies when health is depleted
    hurt_snd_var
        0: None
        1: Axe Hit
        2: Claw
        3: Axe
        4: Custom
    hurt_var: Whether the specimen is currently hurt
    hurt_dur_var: How much duration to deduct per hit
    violence_var: How much violence to add per hit

Sight

    sight_type_var
        0: Default
        1: Only center
        2: No Blocking

Seen

    is_seen_var
        -1: Seen checks are currently disabled
        0: Monster is not being seen
        1: Monster is being seen
    seen_type_var
        0: Check all players
        1: Only check current target
    do_seen_var: Whether the monstter should do seen checks
    seen_var: Whether the specimen is currently doing seen checks
    do_seen_mult_var: Whether the monster should automatically apply speed based on whether they are spotted by the player

*/
// Create Normal Event
    // Default settings
object_event_add
(argument0,ev_create,2,'
    // Inherit
    event_inherited();
    // Main
    if !variable_local_exists("type_var") { type_var = 0; }
    if !variable_local_exists("visible_var") { visible_var = false; }
    if !variable_local_exists("hp_var") { hp_var = -1; }
    // Behavior
    if !variable_local_exists("do_enter_var") { do_enter_var = (type_var > 0); }
    if !variable_local_exists("do_door_var") { do_door_var = (type_var == 1 && do_enter_var); }
    // Sound Stuff
    if !variable_local_exists("do_snd_var") { do_snd_var = true; }
    if do_snd_var
    {
        if !variable_local_exists("snd_len_var") { snd_len_var = 0; }
        if !variable_local_exists("snd_dist_min_var") { snd_dist_min_var = 0; }
        if !variable_local_exists("snd_dist_max_var") { snd_dist_max_var = 600; }
        if !variable_local_exists("loop_snd_dist_min_var") { loop_snd_dist_min_var = 0; }
        if !variable_local_exists("loop_snd_dist_max_var") { loop_snd_dist_max_var = 600; }
        if !variable_local_exists("wake_snd_var") { wake_snd_var[0] = false; }
        if !variable_local_exists("loop_snd_var") { loop_snd_var[0] = false; }
        if !variable_local_exists("snd_alarm_min_var")
        {
            if variable_local_exists("snd_alarm_max_var")
            { snd_alarm_min_var = snd_alarm_max_var; }
            else { snd_alarm_min_var = 0; }
        }
        if !variable_local_exists("snd_alarm_max_var") { snd_alarm_max_var = snd_alarm_min_var; }
        if !variable_local_exists("snd_delay_min_var")
        {
            snd_delay_min_var = snd_alarm_min_var;
            snd_delay_max_var = snd_alarm_max_var;
        }
        if snd_dist_max_var > 0
        {
            for (local.i=0; local.i<snd_len_var; local.i+=1;)
            {
                fmod_snd_set_minmax_dist_scr(snd_arr[local.i,0],snd_dist_min_var,snd_dist_max_var);
                fmod_snd_set_group_scr(snd_arr[local.i,0],snd_group_mon_const);
            }
            if wake_snd_var[0]
            {
                fmod_snd_set_minmax_dist_scr(wake_snd_var[1],snd_dist_min_var,snd_dist_max_var);
                fmod_snd_set_group_scr(wake_snd_var[1],snd_group_mon_const);
            }
        }
        if loop_snd_var[0] && loop_snd_dist_max_var > 0
        {
            fmod_snd_set_minmax_dist_scr(loop_snd_var[1],loop_snd_dist_min_var,loop_snd_dist_max_var);
            fmod_snd_set_group_scr(loop_snd_var[1],snd_group_mon_const);
        }
    }
    // Collision
    if !variable_local_exists("coll_var")
    {
        coll_var[0] = global.mon_coll[0];
        coll_var[1] = global.mon_coll[1];
        coll_var[2] = global.mon_coll[2];
    }
    if !variable_local_exists("mon_coll_var") { mon_coll_var = true; }
    // Attack variables
    if !variable_local_exists("do_atk_var") { do_atk_var = true; }
    if do_atk_var
    {
        if !variable_local_exists("atk_type_var") { atk_type_var = 0; }
        if !variable_local_exists("atk_range_var") { atk_range_var = coll_var[2]; }
        if !variable_local_exists("blood_spr_var") { blood_spr_var = blood_spr; }
        if !variable_local_exists("atk_flash_var") { atk_flash_var = true; }
        if !variable_local_exists("atk_snd_var") { atk_snd_var = 0; }
        if !variable_local_exists("kill_var") { kill_var = true; }
        if atk_type_var > 0
        {
            if !variable_local_exists("atk_start_snd_var") { atk_start_snd_var = 0; }
            if !variable_local_exists("atk_dist_var") { atk_dist_var = atk_range_var; }
        }
    }
    // Hurt
    if do_hurt_var
    {
        if !variable_local_exists("violence_var") { violence_var = 0; }
        if !variable_local_exists("hurt_alarm_var") { hurt_alarm_var = 0; }
        if !variable_local_exists("hurt_dur_var") { hurt_dur_var = 0; }
        if !variable_local_exists("hurt_dist_var") { hurt_dist_var = 0; }
        if !variable_local_exists("hurt_snd_var") { hurt_snd_var = 0; }
        if !variable_local_exists("hurt_snd_num_var") { hurt_snd_num_var = 1; }
        if !variable_local_exists("hurt_snd_den_var") { hurt_snd_den_var = 1; }
        if !variable_local_exists("hurt_hp_var") { hurt_hp_var = 0; }
        if !variable_local_exists("hurt_die_var") { hurt_die_var = 0; }
        if !variable_local_exists("stun_var") { stun_var = false; }
    }
    // Seen
    if !variable_local_exists("do_seen_var") { do_seen_var = false; }
    if do_seen_var
    {
        if !variable_local_exists("seen_type_var") { seen_type_var = 0; }
        if !variable_local_exists("seen_yaw_var") { seen_yaw_var = 0; }
        if !variable_local_exists("seen_pitch_var") { seen_pitch_var = 0; }
        if !variable_local_exists("seen_dist_var") { seen_dist_var = 0; }
    }
    // Movement
    if !variable_local_exists("do_wander_var") { do_wander_var = false; }
    if do_wander_var
    {
        if !variable_local_exists("wander_attempt_var") { wander_attempt_var = 30; }
    }
    if !variable_local_exists("do_move_var") { do_move_var = true; }
    if do_move_var
    {
        if !variable_local_exists("do_acc_var") { do_acc_var = false; }
        if do_acc_var
        {
            if !variable_local_exists("autobrake_var") { autobrake_var = false; }
            if autobrake_var
            {
                if !variable_local_exists("autobrake_spd_var") { autobrake_spd_var = 0; }
                if !variable_local_exists("autobrake_dist_var") { autobrake_dist_var = -1; }
                if !variable_local_exists("autobrake_dir_var") { autobrake_dir_var = -1; }
            }
            if !variable_local_exists("acc_var")
            {
                if variable_local_exists("frick_var") { acc_var = frick_var; }
                else { acc_var = 1; }
            }
            if !variable_local_exists("frick_var")
            {
                if variable_local_exists("acc") { frick_var = acc_var; }
                else { frick_var = 1; }
            }
        }
        if do_seen_var
        {
            if !variable_local_exists("do_seen_mult_var") { do_seen_mult_var = false; }
            if do_seen_mult_var
            {
                if !variable_local_exists("seen_mult_var") { seen_mult_var = 1; }
                if !variable_local_exists("unseen_mult_var") { unseen_mult_var = 1; }
            }
        }
    }
    // Drawing
    if !variable_local_exists("w_var") { w_var = 1; }
    if !variable_local_exists("h_var") { h_var = 1; }
    if !variable_local_exists("x_off_var") { x_off_var = 0; }
    if !variable_local_exists("y_off_var") { y_off_var = 0; }
    if !variable_local_exists("z_off_var") { z_off_var = 0; }
    if !variable_local_exists("reflect_var") { reflect_var = true; }
    if !variable_local_exists("do_anim_var") { do_anim_var = true; }
    if !variable_local_exists("do_mdl_var") { do_mdl_var = false; }
    if do_anim_var
    {
        if !variable_local_exists("spr_spd_var") { spr_spd_var = 0; }
        if !variable_local_exists("anim_type_var") { anim_type_var = 0; }
    }
    // Silhouette
    if !variable_local_exists("sil_var") { sil_var = false; }
    if sil_var
    {
        if !variable_local_exists("sil_dist_var") { sil_dist_var = 0.1; }
        if !variable_local_exists("sil_alpha_var") { sil_alpha_var = 1; }
        if !variable_local_exists("sil_color_var") { sil_color_var = c_black; }
        if !variable_local_exists("sil_type_var") { sil_type_var = 0; }
    }
    if !variable_local_exists("tex_var")
    {
        if variable_local_exists("spr_var") { tex_var = sprite_get_texture(spr_var,0); }
        else if variable_local_exists("bg_var") { tex_var = background_get_texture(bg_var); }
    }
    // Delay
    if !variable_local_exists("delay_min_var")
    {
        if variable_local_exists("delay_var")
        {
            delay_min_var = delay_var;
            delay_max_var = delay_var;
        }
        else
        {
            delay_min_var = 0;
            delay_max_var = 0;
        }
    }
    // Misc Stuff
    tone_var = c_white;
    target_spawn_var = 0;
    is_seen_var = -1;
    spr_id_var = 0;
    spr_prog_var = 1;
    wander_var = false;
    // Sound
    sub_var[0] = "";
    sub_var[1] = false;
    snd_var = noone;
    loop_inst_var = noone;
    // Speed
    spd_mult_var = 1;
    spd_mult_per_var = 1;
    acc_mult_var = 1;
    acc_mult_per_var = 1;
    // Target (just in case)
    target_var = noone;
    target_x_var = 0;
    target_y_var = 0;
    target_z_var = 0;
    target_dist_var = 0;
    path_x_var = 0;
    path_y_var = 0;
    // Pathfinding
    if type_var > 0
    {
        fall_var = false;
        path_var = path_add();
        switch type_var
        {
            case 1:
            {
                grid_var = global.phys_grid;
                grav_var = grav_const;
                break;
            }
            case 2: { grid_var = global.float_grid; break; }
        }
    }
    // Alarms
    if alarm_len_var == 0 // Uhh it returns
    {
        alarm_len_var = 8;
        alarm_ini_scr();
    }
');
// Create End Event
    // Startup
object_event_add
(argument0,ev_create,3,'
    // Play wake (or random sound if it doesnt exist)
    if do_snd_var
    {
        if wake_snd_var[0] == 1
        {
            if fmod_snd_is_3d_scr(wake_snd_var[1])
            {
                snd_var = fmod_snd_3d_play_scr(wake_snd_var[1]);
                if global.pitch_bend_var { fmod_inst_set_pitch_scr(snd_var,random_range(0.95,1.05)); }
            }
            else { snd_var = fmod_snd_play_scr(wake_snd_var[1]); }
            sub_var[0] = wake_snd_var[2];
            sub_var[1] = wake_snd_var[3];
        }
        else if !loop_snd_var[0] && snd_len_var > 0
        {
            local.snd = irandom(snd_len_var-1);
            snd_var = fmod_snd_3d_play_scr(snd_arr[local.snd,0]);
            sub_var[0] = snd_arr[local.snd,1];
            sub_var[1] = snd_arr[local.snd,2];
        } 
    }
    // Inherit
    event_inherited();
');
// Destroy Event
object_event_add
(argument0,ev_destroy,0,'
    event_inherited();
    if type_var > 0
    {
        if path_exists(path_var)
        { path_delete(path_var); }
    }
    fmod_inst_stop_scr(snd_var);
    if possess_var
    {
        with global.player_arr[player_id_var]
        {
            possess_var = false;
            x = other.x;
            y = other.y;
            z = other.z;
            eye_yaw_var = other.eye_yaw_var;
            eye_pitch_var = other.eye_pitch_var;
        }
    }
');
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,'
    event_inherited();
    // Reset Variables
    move_var = do_move_var;
    anim_var = do_anim_var;
    atk_var = do_atk_var;
    seen_var = do_seen_var;
    hurt_var = false;
    enter_var = do_enter_var;
    do_coll_var = false;
    // Reset Position
    yaw_var = global.spawn_arr[0,3];
    x = global.spawn_arr[0,0]-lengthdir_x(32,yaw_var);
    y = global.spawn_arr[0,1]-lengthdir_y(32,yaw_var);
    z = global.spawn_arr[0,2];
    set_motion_3d_scr(0,true,yaw_var,true,0,true);
    eye_yaw_var = yaw_var;
    eye_pitch_var = 0;
    // Set target
    if do_wander_var { event_user(13); }
    event_user(6);
    // Sound
    if do_snd_var
    {
        if loop_snd_var[0] == 1
        { fmod_inst_stop_scr(loop_inst_var); }
    }
    // Delay
    if delay_min_var > 0
    {
        on_var = false;
        set_alarm_scr(0,irandom_range(delay_min_var,delay_max_var));
    }
    else { event_perform(ev_alarm,0); }
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if on_var
    {
        if move_var || seen_var { event_user(6); }
        if move_var { event_user(0); }
        if anim_var { event_user(1); }
        if seen_var { event_user(5); }
        if atk_var { event_user(12); }
    }
    if do_snd_var { event_user(9); }
');
// Step End Event
object_event_add
(argument0,ev_step,ev_step_end,'
    event_inherited();
    // Collide with other monsters
    if on_var && (do_coll_var || type_var <= 0) && mon_coll_var
    { event_user(10); }
    // Camera stuff for possession
    if possess_var
    {
        if global.input_press_arr[crouch_input_const,player_id_var]
        {
            with global.player_arr[player_id_var]
            {
                possess_var = false;
                x = other.x;
                y = other.y;
                z = other.z;
                eye_yaw_var = other.eye_yaw_var;
                eye_pitch_var = other.eye_pitch_var;
            }
            possess_var = false;
        }
        // Set camera and listener position
        cam_set_scr(cam_id_var,x,y,z+18,eye_yaw_var,eye_pitch_var,global.fov_var,0,cam_mon_const);
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
// Delay Alarm
object_event_add
(argument0,ev_alarm,0,'
    on_var = true;
    if do_snd_var
    {
        if loop_snd_var[0] == 1
        {
            fmod_inst_stop_scr(loop_inst_var);
            loop_inst_var = fmod_snd_3d_loop_scr(loop_snd_var[1]);
        }
        if snd_len_var > 0 { set_alarm_scr(6,irandom_range(snd_delay_min_var,snd_delay_max_var)); }
    }
    if do_door_var
    {
        if global.spawn_arr[0,5] != 0
        {
            with global.spawn_arr[0,5] // Entrance door
            {
                if !open_var
                { event_user(0); }
            }
        }
        
    }
    if possess_var && !do_enter_var
    {
        with instance_create(0,0,fade_eff_obj)
        {
            image_blend = c_black; 
            set_alarm_scr(0,20); 
            invert_var = false;
            stay_var = false;
            cam_id_var = other.cam_id_var;
        }
    }
');
// Unstun Alarm
object_event_add
(argument0,ev_alarm,1,'
    move_var = do_move_var;
');
// Start Anim Alarm
object_event_add
(argument0,ev_alarm,2,'
    anim_var = do_anim_var;
');
// Hurt Alarm
object_event_add
(argument0,ev_alarm,3,'
    hurt_var = false;
');
// Attack Alarm
object_event_add
(argument0,ev_alarm,4,'
    atk_var = do_atk_var;
');
// Anim Alarm (Different from Plus!!!)
object_event_add
(argument0,ev_alarm,5,'
    switch(anim_type_var)
    {
        case 0: { show_error("Animation type not set before animating.",false); }
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
');
// Sound alarm
object_event_add
(argument0,ev_alarm,6,'
    if do_snd_var
    {
        if snd_len_var > 0 && frac_chance_scr(snd_num_var,snd_den_var)
        {
            if fmod_inst_is_play_scr(snd_var) && fmod_inst_is_3d_scr(snd_var)
            { fmod_inst_stop_scr(snd_var); }
            local.snd = irandom(snd_len_var-1);
            snd_var = fmod_snd_3d_play_scr(snd_arr[local.snd,0]);
            if global.pitch_bend_var { fmod_inst_set_pitch_scr(snd_var,random_range(0.95,1.05)); }
            sub_var[0] = snd_arr[local.snd,1];
            sub_var[1] = snd_arr[local.snd,2];
        }
        set_alarm_scr(6,irandom_range(snd_alarm_min_var,snd_alarm_max_var));
    }
');
// Attack delay alarm
object_event_add
(argument0,ev_alarm,7,'
    event_user(2);
    if atk_type_var > 1
    {
        atk_var = false;
        set_alarm_scr(4,atk_end_delay_var);
        if atk_type_var == 3
        {
            move_var = false;
            set_alarm_scr(1,atk_end_delay_var);
        }
        if atk_anim_var == 2
        {
            spr_var = atk_end_spr_var;
            anim_type_var = 1; // End on last
            spr_id_var = 0;
            set_alarm_scr(5,atk_end_delay_var);
        }
        else if atk_type_var == 3
        {
            anim_var = false;
            set_alarm_scr(2,atk_end_delay_var);
        }
    }
');
// Movement Event
object_event_add
(argument0,ev_other,ev_user0,'
    if do_seen_var
    {
        if seen_var && do_seen_mult_var
        {
            if is_seen_var == 1 && seen_mult_var != 1 { spd_mult_var *= seen_mult_var; }
            else if is_seen_var == 0 && unseen_mult_var != 1 { spd_mult_var *= unseen_mult_var; }
        }
    }
    local.spd = spd_base_var*spd_mult_var*spd_mult_per_var;
    if do_acc_var
    {
        local.acc = acc_var*acc_mult_var*acc_mult_per_var;
        local.frick = frick_var*acc_mult_var*acc_mult_per_var;
    }
    if enter_var
    {
        if target_dist_var <= local.spd
        {
            x = target_x_var;
            y = target_y_var;
            z = target_z_var;
            enter_var = false;
            if type_var > 0 { do_coll_var = true; }
            if possess_var
            {
                with instance_create(0,0,fade_eff_obj)
                {
                    image_blend = c_black; 
                    set_alarm_scr(0,20); 
                    invert_var = false;
                    stay_var = false;
                    cam_id_var = other.cam_id_var;
                }
            }
        }
        else
        {
            local.yaw = point_direction(x,y,target_x_var,target_y_var);
            local.pitch = point_direction_3d_scr(x,y,z,target_x_var,target_y_var,target_z_var);
            eye_yaw_var = local.yaw;
            eye_pitch_var = local.pitch;
            set_motion_3d_scr(local.spd,true,local.yaw,true,local.pitch,true);
        }
    }
    else
    {
        if possess_var
        {
            // Camera
            eye_yaw_var = mod_scr(eye_yaw_var+input_yaw_scr(player_id_var),360);
            eye_pitch_var = median(-89.9,89.9,eye_pitch_var+input_pitch_scr(player_id_var));
        }
        if target_dist_var <= local.spd && !possess_var
        {
            x = target_x_var;
            y = target_y_var;
            z = target_z_var;
            set_motion_3d_scr(0,true);
            if wander_var { event_user(13); }
        }
        else
        {
            local.yaw = 0;
            local.pitch = 0;
            // V4
            if possess_var
            {
                // Get inputs
                local.input_dir_x = input_x_scr(player_id_var);
                local.input_dir_y = input_y_scr(player_id_var);
                if local.input_dir_x == 0 && local.input_dir_y == 0
                { local.spd = 0; }
                local.yaw = radtodeg(arctan2(-local.input_dir_y,local.input_dir_x))+eye_yaw_var;
                active_var = abs(local.input_dir_x) || abs(local.input_dir_y);
                if !do_coll_var || grav_var <= 0
                {
                    local.input_dir_z = input_z_scr(player_id_var);
                    local.pitch = radtodeg(arctan2(local.input_dir_z,sqrt(sqr(local.input_dir_x)+sqr(local.input_dir_y))))+(eye_pitch_var*lengthdir_x(1,local.input_dir_z));
                }
            }
            else
            {
                local.yaw = point_direction(x,y,target_x_var,target_y_var);
                if do_coll_var
                {
                    // V3
                    sight_type_var = 2;
                    event_user(8); // Check Sight
                    // Path
                    if !enter_var && !target_visible_var
                    {
                        if mp_grid_path(grid_var,path_var,x,y,target_x_var,target_y_var,true)
                        {
                            path_x_var = x;
                            path_y_var = y;
                        }
                        else { mp_grid_path(grid_var,path_var,path_x_var,path_y_var,target_x_var,target_y_var,true); }
                        local.yaw = point_direction
                        (
                            path_get_point_x(path_var,0),
                            path_get_point_y(path_var,0),
                            path_get_point_x(path_var,1),
                            path_get_point_y(path_var,1)
                        );
                    }
                }
                if !do_coll_var || grav_var <= 0 { local.pitch = point_direction_3d_scr(x,y,z,target_x_var,target_y_var,target_z_var); }
            }
            switch do_acc_var
            {
                case 1: // Modern
                {
                    // Tried to add autobrake support, but its difficult without Unity source code
                    if autobrake_var
                    {
                        if local.spd > 0 && spd_var > autobrake_spd_var && !possess_var //&& target_visible_var
                        && (target_dist_var <= autobrake_dist_var || autobrake_dist_var < 0) 
                        {
                            if autobrake_dir_var >= 0
                            {
                                if abs(deg_diff_scr(local.yaw,yaw_var)) > autobrake_dir_var
                                || (type_var != 1 && abs(deg_diff_scr(local.pitch,pitch_var)) > autobrake_dir_var)
                                { local.spd = autobrake_spd_var; }
                            }
                            else { local.spd = autobrake_spd_var; }
                        }
                    }
                    if do_coll_var && grav_var > 0 { acc_scr(global.delta_time_var,local.acc,local.frick,local.yaw,local.spd); }
                    else { acc_3d_scr(global.delta_time_var,local.acc,local.frick,local.yaw,local.pitch,local.spd); }
                    break;
                }
                case 2: // Classic
                {
                    if abs(spd_var) < abs(local.spd) { local.spd = sign(local.spd)*min(abs(local.spd),abs(spd_var)+(local.acc*global.delta_time_var)); }
                }
                case 3: // Friction only
                {
                    if abs(spd_var) > abs(local.spd) { local.spd = sign(local.spd)*max(abs(local.spd),abs(spd_var)-(local.frick*global.delta_time_var)); }
                }
                default:
                {
                    if do_coll_var && grav_var > 0 { set_motion_scr(local.spd,true,local.yaw,true); }
                    else { set_motion_3d_scr(local.spd,true,local.yaw,true,local.pitch,true); }
                    break;
                }
            }
        }
    }
    spd_mult_var = 1;
    acc_mult_var = 1;
');
// Animation Event
object_event_add
(argument0,ev_other,ev_user1,'
    switch(anim_type_var)
    {
        case 0: // Animate normally
        {
            spr_id_var = (spr_id_var+(spr_spd_var*global.delta_time_var)) mod sprite_get_number(spr_var);
            break;
        }
        case 1: // End on last
        {
            if alarm_arr[5,0] > 0
            { spr_id_var = sprite_get_number(spr_var)*(1-(alarm_arr[5,0]/alarm_arr[5,1])); }
            break;
        }
        case 2: // End on first
        {
            if alarm_arr[5,0] > 0
            { spr_id_var = sprite_get_number(spr_var)*alarm_arr[5,0]/alarm_arr[5,1]; }
            break;
        }
        case 3: // Random (scuffed)
        {
            spr_prog_var -= spr_spd_var*global.delta_time_var;
            if spr_prog_var <= 0 
            {
                spr_prog_var = 1;
                spr_id_var = irandom(sprite_get_number(spr_var)-1);
            }
            break;
        }
    }
    tex_var = sprite_get_texture(spr_var,floor(spr_id_var));
');
// Attack Event
object_event_add
(argument0,ev_other,ev_user2,'
    local.dead = true;
    local.success = false;
    with player_obj
    {
        if !dead_var && !hurt_var && !in_door_var && !invuln_var && on_var
        {
            // p3dc_check_scr(coll_var[0],x,y,z,other.coll_var[0],other.x,other.y,other.z)
            if cyl_coll_scr(x,y,z,coll_var[2],coll_var[1],other.x,other.y,other.z,other.atk_range_var,other.coll_var[1])
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
                    event_user(0);
                }
                else
                {
                    hp_var = 0;
                    dead_var = true;
                    do_coll_var = false;
                    grav_var = false;
                    // Revive
                    if other.possess_var
                    {
                        local.dead = false;
                        local.player = id;
                        other.possess_var = false;
                        with global.player_arr[other.player_id_var]
                        {
                            // Revive
                            possess_var = false;
                            dead_var = false;
                            do_coll_var = true;
                            grav_var = grav_const;
                            hp_var = hp_max_var;
                            // Become other player
                            x = local.player.x;
                            y = local.player.y;
                            z = local.player.z;
                            eye_yaw_var = local.player.eye_yaw_var;
                            eye_pitch_var = local.player.eye_pitch_var;
                            // Iframes
                            hurt_var = true;
                            set_alarm_scr(0,revive_alarm_var);
                        }
                    }
                }
                other.atk_target_var = id;
                local.success = true;
            }
        }
        if !dead_var { local.dead = false; }
    }
    if local.success
    {
        if local.dead && !global.debug_var && !possess_var
        {
            global.dead_mon_var = object_index;
            global.menu_player_var = atk_target_var.player_id_var;
            if kill_var
            {
                if global.permadeath_var { delete_save_scr(global.save_name_var); }
                rm_goto_menu_scr(dead_rm_var,true);
            }
            else { rm_goto_menu_scr(dead_rm_var,2); }
        }
        else { event_user(3); }
    }
');
// Attack Success
// Uses atk_target_var as an argument, usually the player.
object_event_add
(argument0,ev_other,ev_user3,'
    if atk_type_var == 1
    {
        set_alarm_scr(7,dmg_alarm_var);
        set_alarm_scr(1,dmg_alarm_var);
        move_var = false;
        if atk_anim_var > 0
        {
            spr_var = atk_spr_var;
            anim_type_var = 1; // End on last
            spr_id_var = 0;
            set_alarm_scr(5,dmg_alarm_var);
        }
        else
        {
            anim_var = false;
            set_alarm_scr(2,dmg_alarm_var);
        }
        set_motion_3d_scr(0,true);
    }
    switch atk_snd_var
    {
        case 0: { fmod_snd_play_scr(claw_snd); break; } // Scratch!
        case 1: { fmod_snd_play_scr(choose(axe_hit_01_snd,axe_hit_02_snd)); break; } // Clank!
        case 2: { fmod_snd_play_scr(choose(axe_01_snd,axe_02_snd,axe_03_snd)); break; } // Ding!
        case 3:
        {
            if fmod_snd_is_3d_scr(atk_snd_var[1])
            {
                if fmod_inst_is_play_scr(snd_var) && fmod_inst_is_3d_scr(snd_var)
                { fmod_inst_stop_scr(snd_var); }
                snd_var = fmod_snd_3d_play_scr(atk_snd_var[1]);
                if global.pitch_bend_var { fmod_inst_set_pitch_scr(snd_var,random_range(0.95,1.05)); }
            }
            else { snd_var = fmod_snd_play_scr(atk_snd_var[1]); }
            sub_var[0] = atk_snd_var[2];
            sub_var[1] = atk_snd_var[3];
            if do_snd_var
            {
                if snd_len_var > 0
                { set_alarm_scr(6,irandom_range(snd_delay_min_var,snd_delay_max_var)); }
            }
            break;
        }
    }
    if blood_spr_var > 0
    {
        with instance_create(0,0,blood_eff_obj)
        {
            spr_var = other.blood_spr_var;
            spr_id_var = irandom(sprite_get_number(spr_var)-1);
            // Set camera to player
            cam_id_var = other.atk_target_var.cam_id_var;
        }
    }
    if atk_flash_var && !global.reduce_flash_var
    {
        with instance_create(0,0,flash_eff_obj)
        {
            image_blend = c_red; 
            set_alarm_scr(0,6);
            cam_id_var = other.atk_target_var.cam_id_var;
        }
    }
    
');
// Hurt Event
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
(argument0,ev_other,ev_user4,'
    if !enter_var
    {
        if hurt_alarm_var
        {
            hurt_var = true;
            set_alarm_scr(3,hurt_alarm_var);
        }
        if violence_var > 0 { hurt_target_var.violence_var += violence_var; }
        // Reduce duration if very vulnerable
        if do_hurt_var == 2 || (do_hurt_var == 3 && hurt_type_var == 1)
        {
            if dur_var > 0 && hurt_dur_var > 0
            {
                dur_var -= hurt_dur_var;
                if hurt_die_var == 1 && dur_var <= 0 { event_user(11); exit; }
                else { dur_var = max(1,dur_var); }
            }
            if hp_var > 0 && hurt_hp_var > 0
            {
                hp_var -= hurt_hp_var;
                if hurt_die_var == 2 && hp_var <= 0 { event_user(11); exit; }
                else { hp_var = max(1,hp_var); }
            }
        }
        // Hurt sound
        if hurt_snd_var && frac_chance_scr(hurt_snd_num_var,hurt_snd_den_var) && (do_hurt_var != 3 || hurt_type_var == 1)
        {
            switch hurt_snd_var
            {
                case 1: { fmod_snd_play_scr(choose(axe_hit_01_snd,axe_hit_02_snd)); break; } // Clank!
                case 2: { fmod_snd_play_scr(claw_snd); break; } // Scratch!
                case 3: { fmod_snd_play_scr(choose(axe_01_snd,axe_02_snd,axe_03_snd)); break; } // Ding!
                case 4:
                {
                    if fmod_snd_is_3d_scr(hurt_snd_var[1])
                    {
                        if fmod_inst_is_play_scr(snd_var) && fmod_inst_is_3d_scr(snd_var)
                        { fmod_inst_stop_scr(snd_var); }
                        snd_var = fmod_snd_3d_play_scr(hurt_snd_var[1]);
                        if global.pitch_bend_var { fmod_inst_set_pitch_scr(snd_var,random_range(0.95,1.05)); }
                    }
                    else { snd_var = fmod_snd_play_scr(hurt_snd_var[1]); }
                    sub_var[0] = hurt_snd_var[2];
                    sub_var[1] = hurt_snd_var[3];
                    if do_snd_var
                    {
                        if snd_len_var > 0
                        { set_alarm_scr(6,irandom_range(snd_delay_min_var,snd_delay_max_var)); }
                    }
                    break;
                }
            }
        }
        // Push back
        if hurt_dist_var > 0
        {
            local.dir = point_direction(hurt_target_var.x,hurt_target_var.y,x,y);
            local.xtmp = x+lengthdir_x(hurt_dist_var,local.dir);
            local.ytmp = y+lengthdir_y(hurt_dist_var,local.dir);
            if do_coll_var { local.bool = !check_coll_scr(0,0,0,0,local.xtmp,local.ytmp,z); }
            else { local.bool = true; }
            if local.bool
            {
                x = local.xtmp;
                y = local.ytmp;
            }
        }
        // You can set this to higher values to have custom stun behavior
        if stun_var == 1 
        {
            set_motion_3d_scr(0,true);
            move_var = false;
            anim_var = false;
            atk_var = false;
            if hurt_alarm_var
            {
                set_alarm_scr(1,hurt_alarm_var);
                set_alarm_scr(2,hurt_alarm_var);
                set_alarm_scr(4,hurt_alarm_var);
            }
        }
    }
');
// Seen Event
object_event_add
(argument0,ev_other,ev_user5,'
    switch seen_type_var
    {
        case 0: // Target Only
        {
            if instance_exists(target_var)
            {
                seen_per_var = seen_scr
                (
                    seen_yaw_var,seen_pitch_var,seen_dist_var,
                    target_var.eye_yaw_var,
                    target_var.eye_pitch_var,
                    target_x_var,target_y_var,target_z_var+target_var.eye_h_var,
                    false,false
                );
                is_seen_var = (seen_per_var > 0)
            }
            else { is_seen_var = -1; seen_per_var = -1; }
            break;
        }
        case 1: // All players
        {
            is_seen_var = -1;
            seen_per_var = -1;
            if on_var && !enter_var
            {
                with player_obj
                {
                    if on_var && !dead_var && !in_door_var
                    {
                        local.per = seen_scr
                        (
                            other.seen_yaw_var,other.seen_pitch_var,other.seen_dist_var,
                            eye_yaw_var,eye_pitch_var,
                            x,y,z+eye_h_var,
                            false,false,
                            other.coll_var[1],other.coll_var[2],
                            other.x,other.y,other.z
                        );
                        other.seen_per_var = max(local.per,other.seen_per_var);
                        other.is_seen_var = (other.seen_per_var > 0);
                    }
                }
            }
            break;
        }
    }
');
// Target Event
object_event_add
(argument0,ev_other,ev_user6,'
    if enter_var
    {
        target_var = noone;
        target_x_var = global.spawn_arr[target_spawn_var,0];
        target_y_var = global.spawn_arr[target_spawn_var,1];
        target_z_var = global.spawn_arr[target_spawn_var,2];
        target_dist_var = point_distance_3d_scr(x,y,z,target_x_var,target_y_var,target_z_var);
    }
    else if wander_var
    {
        target_var = noone;
        target_x_var = wander_x_var;
        target_y_var = wander_y_var;
        target_z_var = wander_z_var;
        target_dist_var = point_distance_3d_scr(x,y,z,target_x_var,target_y_var,target_z_var);
    }
    else
    {
        target_var = noone;
        target_dist_var = 0;
        with (player_obj)
        {
            local.dist = point_distance_3d_scr(other.x,other.y,other.z,x,y,z);
            if on_var && !in_door_var && !dead_var && (other.target_var == noone || local.dist < other.target_dist_var)
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
');
// Check sight
object_event_add
(argument0,ev_other,ev_user8,'
    if target_dist_var == 0
    { target_visible_var = true; }
    else
    {
        if sight_type_var == 1 { local.check = 1; }
        else { local.check = 5; }
        if sight_type_var == 2 { local.dist = 10000000; }
        else { local.dist = 0; }
        local.radius = coll_var[2]/2;
        local.ztmp = z+(coll_var[1]/2);
        local.xvec = (target_x_var-x)/target_dist_var;
        local.yvec = (target_y_var-y)/target_dist_var;
        local.zvec = (target_z_var-z)/target_dist_var;
        for (local.i=0; local.i<local.check; local.i+=1;)
        {
            local.xtmp = x;
            local.ytmp = y;
            if local.i != 0
            {
                local.xtmp += lengthdir_x(local.radius,local.i*90);
                local.ytmp += lengthdir_y(local.radius,local.i*90);
            }
            /*local.xvec = (target_x_var-local.xtmp)/target_dist_var;
            local.yvec = (target_y_var-local.ytmp)/target_dist_var;*/
            local.newdist = check_ray_scr
            (
                local.xtmp,local.ytmp,local.ztmp,
                local.xvec,local.yvec,local.zvec
            );
            if sight_type_var == 2
            { local.dist = min(local.dist,local.newdist); }
            else { local.dist = max(local.dist,local.newdist); }
        }
        target_visible_var = local.dist+local.radius >= target_dist_var;
    }
');
// Sound Event
object_event_add
(argument0,ev_other,ev_user9,'
    fmod_inst_set_3d_pos_scr(snd_var,x,y,z);
    fmod_inst_set_3d_pos_scr(loop_inst_var,x,y,z);
');
// Monster Collision
object_event_add
(argument0,ev_other,ev_user10,'
    local.xtmp = x;
    local.ytmp = y;
    local.collided = false;
    with echidna_obj
    {
        if id != other.id && (type_var > 0) == (other.type_var > 0) && (do_coll_var || type_var <= 0) && mon_coll_var
        {
            if cyl_coll_scr(x,y,z,coll_var[2],coll_var[1],local.xtmp,local.ytmp,other.z,other.coll_var[2],other.coll_var[1])
            {
                local.dist = (coll_var[2]+other.coll_var[2])/2;
                local.dir = point_direction(x,y,local.xtmp,local.ytmp);
                local.xtmp = x+lengthdir_x(local.dist,local.dir);
                local.ytmp = y+lengthdir_y(local.dist,local.dir);
                local.collided = true;
            }
        }
    }
    if local.collided
    {
        if !check_coll_scr(0,0,0,0,local.xtmp,local.ytmp,z)
        {
            x = local.xtmp;
            y = local.ytmp;
        }
    }
');
// Die event
object_event_add
(argument0,ev_other,ev_user11,'
    instance_destroy();
');
// Attempt Attack
object_event_add
(argument0,ev_other,ev_user12,'
    if atk_type_var > 0
    {
        if alarm_arr[7,0] <= 0 && instance_exists(target_var) && target_dist_var < atk_dist_var
        {
            set_alarm_scr(7,atk_delay_var);
            set_alarm_scr(1,atk_delay_var);
            move_var = false;
            switch atk_start_snd_var
            {
                case 1: { fmod_snd_play_scr(choose(swing_01_snd,swing_02_snd,swing_03_snd,swing_04_snd)); break; }
                case 2:
                {
                    if fmod_snd_is_3d_scr(atk_start_snd_var[1])
                    {
                        if fmod_inst_is_play_scr(snd_var) && fmod_inst_is_3d_scr(snd_var)
                        { fmod_inst_stop_scr(snd_var); }
                        snd_var = fmod_snd_3d_play_scr(atk_start_snd_var[1]);
                        if global.pitch_bend_var { fmod_inst_set_pitch_scr(snd_var,random_range(0.95,1.05)); }
                    }
                    else { snd_var = fmod_snd_play_scr(atk_start_snd_var[1]); }
                    sub_var[0] = atk_start_snd_var[2];
                    sub_var[1] = atk_start_snd_var[3];
                    if do_snd_var
                    {
                        if snd_len_var > 0
                        { set_alarm_scr(6,irandom_range(snd_delay_min_var,snd_delay_max_var)); }
                    }
                    break;
                }
            }
            if atk_anim_var > 0
            {
                spr_var = atk_spr_var;
                anim_type_var = 1; // End on last
                spr_id_var = 0;
                set_alarm_scr(5,atk_delay_var);
            }
            else
            {
                anim_var = false;
                set_alarm_scr(2,atk_delay_var);
            }
            set_motion_3d_scr(0,true);
        }
    }
    else { event_user(2); }
');
// Wander Event
object_event_add
(argument0,ev_other,ev_user13,'
    // Find applicable floor to wander to
    for (local.i=0; local.i<wander_attempt_var; local.i+=1;)
    {
        local.flr = instance_find(floor_par_obj,irandom(instance_number(floor_par_obj)-1));
        local.xtmp = local.flr.x+random_range(-local.flr.w_var/2,local.flr.w_var/2);
        local.ytmp = local.flr.y+random_range(-local.flr.h_var/2,local.flr.h_var/2);
        local.ztmp = local.flr.z;
        if do_coll_var && !check_coll_scr(0,0,0,0,local.xtmp,local.ytmp,local.ztmp)
        {
            wander_x_var = local.xtmp;
            wander_y_var = local.ytmp;
            wander_z_var = local.ztmp;
            break;
        }
    }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if (on_var || visible_var) && (!possess_var || cam_id_var != view_current || global.reflect_var)
    {
        // Set variables
        draw_set_color(color_mult_scr(image_blend,tone_var)); draw_set_alpha(image_alpha);
        d3d_transform_set_identity();
        // Draw Model
        if do_mdl_var
        {
            // d3d_transform_add_rotation_y(pitch_var);
            d3d_transform_add_rotation_z(yaw_var);
            d3d_transform_add_translation(x+x_off_var,y+y_off_var,z+z_off_var);
            // Reflection Handing
            if global.reflect_var
            {
                switch (global.reflect_axis_var)
                {
                    case 0: { d3d_transform_add_scaling(-1,1,1); d3d_transform_add_translation(global.reflect_pos_var,0,0); break; }
                    case 1: { d3d_transform_add_scaling(1,-1,1); d3d_transform_add_translation(0,global.reflect_pos_var,0); break; }
                    case 2: { d3d_transform_add_scaling(1,1,-1); d3d_transform_add_translation(0,0,global.reflect_pos_var); break; }
                }
            }
            d3d_model_draw(mdl_var,0,0,0,tex_var);
            // Draw silhoette
            if sil_var
            {
                d3d_set_hidden(false); draw_set_alpha(image_alpha*sil_alpha_var);
                switch sil_type_var
                {
                    case 0:
                    {
                        d3d_model_draw(mdl_var,0,0,0,tex_var);
                        break;
                    }
                    case 1:
                    {
                        d3d_set_fog(true,sil_color_var,0,0);
                        d3d_model_draw(mdl_var,0,0,0,tex_var);
                        d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var);
                        break;
                    }
                    case 2:
                    {
                        draw_set_color(color_mult_scr(image_blend,sil_color_var));
                        d3d_model_draw(mdl_var,0,0,0,tex_var);
                        draw_set_color(image_blend);
                        break;
                    }
                }
                d3d_set_hidden(true); draw_set_alpha(image_alpha);
            }
        }
        // Draw Wall
        else
        {
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
            // Draw silhoette
            if sil_var
            {
                d3d_set_hidden(false); draw_set_alpha(image_alpha*sil_alpha_var);
                switch sil_type_var
                {
                    case 0:
                    {
                        d3d_draw_wall(-sil_dist_var,w_var/2,h_var,-sil_dist_var,-w_var/2,0,tex_var,1,1);
                        break;
                    }
                    case 1:
                    {
                        d3d_set_fog(true,sil_color_var,0,0);
                        d3d_draw_wall(-sil_dist_var,w_var/2,h_var,-sil_dist_var,-w_var/2,0,tex_var,1,1);
                        d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var);
                        break;
                    }
                    case 2:
                    {
                        draw_set_color(color_mult_scr(image_blend,sil_color_var));
                        d3d_draw_wall(-sil_dist_var,w_var/2,h_var,-sil_dist_var,-w_var/2,0,tex_var,1,1);
                        draw_set_color(image_blend);
                        break;
                    }
                }
                d3d_set_hidden(true); draw_set_alpha(image_alpha);
            }
            d3d_draw_wall(0,w_var/2,h_var,0,-w_var/2,0,tex_var,1,1);
        }
        // Reset
        d3d_transform_set_identity();
        draw_set_color(c_white); draw_set_alpha(1);
        // Draw path (if applicable)
        if global.debug_var && type_var > 0
        {
            d3d_set_hidden(false);
            if path_exists(path_var)
            { draw_path(path_var,x,y,false); }
            d3d_set_hidden(true);
            // mp_grid_draw(grid_var);
        }
    }
');