// Builtin Variables
object_set_depth(argument0,-2);
object_set_mask(argument0,noone);
object_set_parent(argument0,mon_par_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
/*
Variables

Enums

type_var
    0: Ignores walls
    1: Pathfinds normally
    2: Floats over pits
sight_type_var
    0: Default
    1: Only center
    2: No Blocking
anim_type_var
    0: Normal
    1: End on last
    2: End on first
    3: Random
    4: Custom
hurt_snd_var
    0: None
    1: Axe Hit
    2: Claw
    3: Axe
    4: Custom
do_hurt_var
    0: Cannot be hurt
    1: Hurt event is called
    2: Being damaged reduces duration or health
    3: Being damaged by spiritual weapons reduces duration or health
hurt_die_var
    0: Monster only dies on the next room
    1: Monster dies when duration is depleted
    2: Monster only dies when health is depleted

Main

dur_var: The chase duration
dur_start_var: How much duration a monster starts with, used for scripted events and boss bars
delay_var: How much time before a monster starts acting

Draw

w_var: How many pixels wide the monster is
h_var: How many pixels tall the monster is
x_off_var,y_off_var,z_off_var: How many pixels offset the monster draws
sil_var: Draw silhouette. Mostly for incorporeal monsters
sil_dist_var: How far to draw the silhouette to prevent Z-fighting
sil_color_var: The color of the silhouette
sil_alpha_var: The alpha of the silhouette (multiplied by image alpha)

Attack

dmg_var: How much damage a monster deals per hit
dmg_alarm_var: How much time before something can hit the player again (per player)
atk_range_var: How far the specimen can reach while attacking
atk_dist_var: How close the target should be before attempting to attack (If applicable)
atk_delay_var: How long before the monster can start attacking

Movement

spd_base_var: How fast the monster moves in pixels per frame (60fps)
spd_mult_var: Multiplier for the monster"s speed, mostly for monsters that have varied speeds
acc_var: How fast the monster accelerates in pixels per frame squared (60fps)
frick_var: How fast the monster decelerates in pixels per frame squared
enter_var: Whether a physical monster is entering the room

Hurt

hurt_dur_var: How much duration to deduct per hit
violence_var: How much violence to add per hit

Booleans

do_move_var: Whether the specimen should move
do_anim_var: Whether the specimen should animate
do_attack_var: Whether the specimen should attack
do_hurt_var: Whether the specimen should be vulnerable
move_var: Whether the specimen can currently move
anim_var: Whether the specimen can currently animate
attack_var: Whether the specimen can currently attack
hurt_var: Whether the specimen is currently hurt
*/
// Create Start
    // Loading specimen specific settings
object_event_add
(argument0,ev_create,1,'');
// Create Normal Event
    // Default settings
object_event_add
(argument0,ev_create,2,'
    if string(name_var) == "0" { name_var = "Unknown"; }
    // Gotta set type, delay, and duration
    dur_start_var = dur_var;
    enter_var = type_var > 0;
    if do_move_var == 0 { do_move_var = true; }
    if do_attack_var == 0 { do_attack_var = true; }
    if do_anim_var == 0 { do_anim_var = true; }
    if do_snd_var == 0 { do_snd_var = true; }
    if color_var == 0 { color_var = true; }
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
    mon_coll_var = true;
    // Attack variables
    if atk_range_var == 0
    { atk_range_var = coll_var[2]; }
    // Pathfinding
    if type_var > 0
    {
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
    // Sounds
    if do_snd_var
    {
        for (local.i=0; local.i<snd_len_var; local.i+=1;)
        {
            fmod_snd_set_minmax_dist_scr(snd_arr[local.i,0],0,snd_dist_var);
            fmod_snd_set_group_scr(snd_arr[local.i,0],snd_group_mon_const);
        }
        if wake_snd_var[0]
        {
            fmod_snd_set_minmax_dist_scr(wake_snd_var[1],0,snd_dist_var);
            fmod_snd_set_group_scr(wake_snd_var[1],snd_group_mon_const);
        }
    }
    // Theme
    if mus_prio_var > amb_mus_prio_const
    {
        fmod_snd_set_group_scr(mus_snd_var,snd_group_mus_const);
        with mus_control_obj { event_user(0); }
    }
    // Alarms
    if alarm_len_var == 0
    { alarm_len_var = 8; }
');
// Create End Event
    // Startup
object_event_add
(argument0,ev_create,3,'
    // Play wake (or random sound if it doesn"t exist)
    if wake_snd_var[0] == 1
    {
        snd_var = fmod_snd_play_scr(wake_snd_var[1]);
        sub_var[0] = wake_snd_var[2];
        sub_var[1] = wake_snd_var[3];
    }
    else if do_snd_var && !snd_loop_var
    {
        local.snd = irandom(snd_len_var-1);
        snd_var = fmod_snd_3d_play_scr(snd_arr[local.snd,0]);
        sub_var[0] = snd_arr[local.snd,1];
        sub_var[1] = snd_arr[local.snd,2];
    }
    // Room start
    event_perform(ev_other,ev_room_start);
');
// Create Event
object_event_add
(argument0,ev_create,0,'
    event_perform(ev_create,1);
    event_perform(ev_create,2);
    event_perform(ev_create,3);
');
// Destroy Event
object_event_add
(argument0,ev_destroy,0,'
    event_inherited();
    if type_var > 0 && path_exists(path_var)
    { path_delete(path_var); }
    fmod_inst_stop_scr(snd_var);
    if mus_prio_var > amb_mus_prio_const
    {
        mus_prio_var = -1;
        with mus_control_obj { event_user(0); }
    }
');
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,'
    event_inherited();
    // Reset Variables
    move_var = do_move_var;
    anim_var = do_anim_var;
    attack_var = do_attack_var;
    hurt_var = false;
    enter_var = type_var > 0;
    do_coll_var = false;
    // Color
    if !color_var || !instance_exists(color_par_obj) || global.color_var == 1
    { image_blend = c_white; }
    // Reset Position
    yaw_var = global.spawn_arr[0,3];
    x = global.spawn_arr[0,0]-lengthdir_x(32,yaw_var);
    y = global.spawn_arr[0,1]-lengthdir_y(32,yaw_var);
    z = global.spawn_arr[0,2];
    set_motion_3d_scr(0,true,yaw_var,true,0,true);
    // Set target
    event_user(6);
    // Sound
    if do_snd_var && snd_loop_var
    { fmod_inst_stop_scr(snd_var); }
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
        if move_var || do_seen_var { event_user(6); }
        if move_var { event_user(0); }
        if anim_var { event_user(1); }
        if do_seen_var { event_user(5); }
        if attack_var
        {
            if atk_delay_var > 0
            {
                if alarm_arr[7,0] <= 0 && instance_exists(target_var) && target_dist_var < atk_dist_var
                {
                    set_alarm_scr(7,atk_delay_var);
                    set_alarm_scr(1,atk_delay_var);
                    move_var = false;
                    set_motion_3d_scr(0,true);
                }
            }
            else { event_user(2); }
        }
    }
    if do_snd_var { event_user(9); }
');
// Step End Event
object_event_add
(argument0,ev_step,ev_step_end,'
    event_inherited();
    if on_var && (do_coll_var || type_var <= 0) && mon_coll_var
    { event_user(10); }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if on_var || visible_var
    {
        draw_set_color(image_blend); draw_set_alpha(image_alpha);
        d3d_transform_set_identity();
        if do_mdl_var
        {
            // d3d_transform_add_rotation_y(pitch_var);
            d3d_transform_add_rotation_z(yaw_var);
            d3d_transform_add_translation(x+x_off_var,y+y_off_var,z+z_off_var);
            d3d_model_draw(mdl_var,0,0,0,tex_var);
        }
        else
        {
            d3d_transform_add_rotation_z(point_direction(x,y,global.cam_x_var[view_current],global.cam_y_var[view_current]));
            d3d_transform_add_translation(x+x_off_var,y+y_off_var,z+z_off_var);
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
        d3d_transform_set_identity();
        draw_set_color(c_white); draw_set_alpha(1);
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
// Delay Alarm
object_event_add
(argument0,ev_alarm,0,'
    on_var = true;
    if do_snd_var
    {
        if snd_loop_var
        {
            snd_var = fmod_snd_3d_loop_scr(snd_arr[0,0]);
            sub_var[0] = snd_arr[0,1];
            sub_var[1] = snd_arr[0,2];
        }
        else { set_alarm_scr(6,irandom_range(snd_alarm_min_var,snd_alarm_max_var)); }
    }
    if type_var == 1 && enter_var
    {
        with global.spawn_arr[0,5] // Entrance door
        {
            if !open_var
            {
                event_user(0);
            }
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
    attack_var = do_attack_var;
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
    if do_snd_var && !snd_loop_var && frac_chance_scr(snd_num_var,snd_den_var)
    {
        if fmod_inst_is_play_scr(snd_var) && fmod_inst_is_3d_scr(snd_var)
        { fmod_inst_stop_scr(snd_var); }
        local.snd = irandom(snd_len_var-1);
        snd_var = fmod_snd_3d_play_scr(snd_arr[local.snd,0]);
        sub_var[0] = snd_arr[local.snd,1];
        sub_var[1] = snd_arr[local.snd,2];
    }
    set_alarm_scr(6,irandom_range(snd_alarm_min_var,snd_alarm_max_var));
');
// Attack alarm
object_event_add
(argument0,ev_alarm,7,'
    event_user(2);
');
// Movement Event
object_event_add
(argument0,ev_other,ev_user0,'
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
        // V3
        sight_type_var = 2;
        event_user(8); // Check Sight
        // V4
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
        else { local.yaw = point_direction(x,y,target_x_var,target_y_var); }
        if do_acc_var
        {
            // Tried to add autobrake support, but it"s difficult without Unity source code
            if autobrake_var && target_visible_var && spd_var > autobrake_spd_var
            && (target_dist_var <= autobrake_dist_var || autobrake_dist_var <= 0) 
            {
                if autobrake_dir_var > 0
                {
                    if abs(deg_diff_scr(local.yaw,yaw_var)) > autobrake_dir_var
                    { local.spd = autobrake_spd_var; }
                }
                else { local.spd = autobrake_spd_var; }
            }
            acc_scr(global.delta_time_var,acc_var,frick_var,local.yaw,local.spd);
        }
        else { set_motion_scr(local.spd,true,local.yaw,true); }
    }
    else
    {
        local.yaw = point_direction(x,y,target_x_var,target_y_var);
        local.pitch = point_direction_3d_scr(x,y,z,target_x_var,target_y_var,target_z_var);
        if do_acc_var
        {
            if autobrake_var && target_visible_var && spd_var > autobrake_spd_var
            && (target_dist_var <= autobrake_dist_var || autobrake_dist_var <= 0) 
            {
                if autobrake_dir_var > 0
                {
                    if abs(deg_diff_scr(local.yaw,yaw_var)) > autobrake_dir_var
                    || abs(deg_diff_scr(local.pitch,pitch_var)) > autobrake_dir_var
                    { local.spd = autobrake_spd_var; }
                }
                else { local.spd = autobrake_spd_var; }
            }
            acc_3d_scr(global.delta_time_var,acc_var,frick_var,local.yaw,local.pitch,local.spd);
        }
        else { set_motion_3d_scr(local.spd,true,local.yaw,true,local.pitch,true); }
    }
    spd_mult_var = 1;
');
// Animation
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
            spr_id_var = sprite_get_number(spr_var)*(1-(alarm_arr[5,0]/alarm_arr[5,1]));
            break;
        }
        case 2: // End on first
        {
            spr_id_var = sprite_get_number(spr_var)*alarm_arr[5,0]/alarm_arr[5,1];
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
// Attack
object_event_add
(argument0,ev_other,ev_user2,'
    local.dead = true;
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
                    event_perform(ev_other,ev_user0);
                }
                else
                {
                    hp_var = 0;
                    dead_var = true;
                    do_coll_var = false;
                    grav_var = false;
                }
                other.attack_target_var = id;
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
            room_goto_scr(dead_rm_var);
        }
        else { event_perform(ev_other,ev_user3); }
    }
');
// Attack Success
// Uses attack_target_var as an argument, usually the player.
object_event_add
(argument0,ev_other,ev_user3,'
    if atk_delay_var > 0
    {
        set_alarm_scr(7,dmg_alarm_var);
        set_alarm_scr(1,dmg_alarm_var);
        move_var = false;
        set_motion_3d_scr(0,true);
    }
    fmod_snd_play_scr(claw_snd);
    with instance_create(0,0,blood_eff_obj)
    {
        // Set camera to player
        cam_id_var = other.attack_target_var.cam_id_var;
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
            if hurt_die_var == 1 && hp_var <= 0 { event_user(11); exit; }
            else { hp_var = max(1,hp_var); }
        }
    }
    // Hurt sound
    if hurt_snd_var
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
                }
                else { snd_var = fmod_snd_play_scr(hurt_snd_var[1]); }
                sub_var[0] = hurt_snd_var[2];
                sub_var[1] = hurt_snd_var[3];
                break;
            }
        }
    }
    // You can set this to higher values to have custom stun behavior
    if stun_var == 1 
    {
        set_motion_3d_scr(0,true);
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
');
// Calculate Seen
object_event_add
(argument0,ev_other,ev_user5,'
    if instance_exists(target_var)
    {
        if seen_yaw_var > 0
        {
            target_eye_yaw_var = target_var.eye_yaw_var;
            local.yaw = abs(deg_diff_scr(point_direction(target_x_var,target_y_var,x,y),target_eye_yaw_var));
            local.radius = coll_var[2]/2; local.angle = radtodeg(arctan2(local.radius,target_dist_var));
            local.seenyaw = (local.yaw <= seen_yaw_var+local.angle); local.yawper = (local.yaw+local.angle)/(seen_yaw_var+local.angle);
        }
        else { local.seenyaw = true; local.yawper = 0; }
        if seen_pitch_var > 0
        {
            local.height = coll_var[1]/2; local.angle = radtodeg(arctan2(local.height,target_dist_var));
            target_eye_pitch_var = target_var.eye_pitch_var;
            target_eye_h_var = target_var.eye_h_var;
            local.pitch = abs(deg_diff_scr(point_direction_3d_scr(target_x_var,target_y_var,target_z_var+target_eye_h_var,x,y,z+local.height),target_eye_pitch_var));
            local.seenpitch = (local.pitch <= seen_pitch_var+local.angle); local.pitchper = (local.pitch+local.angle)/(seen_pitch_var+local.angle);
        }
        else { local.seenpitch = true; local.pitchper = 0; }
        if local.seenyaw && local.seenpitch
        { seen_var = true; seen_per_var = 1-max(local.yawper,local.pitchper); }
        else { seen_var = false; seen_per_var = 0; }
    }
    else { seen_var = -1; seen_per_var = -1; }
');
// Determine target
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
            )
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
');
// Monster Collision
object_event_add
(argument0,ev_other,ev_user10,'
    local.xtmp = x;
    local.ytmp = y;
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