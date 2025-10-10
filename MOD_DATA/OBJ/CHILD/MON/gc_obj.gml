// Builtin Variables
object_set_depth(argument0,0);
object_set_mask(argument0,noone);
object_set_parent(argument0,echidna_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,1,"
    name_var = 'Ghost Cow';
    type_var = 0;
    spd_base_var = 0.7;
    dur_var = irandom_range(15,30);
    delay_var = 91;
    dmg_var = 30;
    dmg_alarm_var = 30;
    w_var = 10;
    h_var = 20;
    // Assets
        // Search for existing assets to save memory
    with object_index
    {
        if id != other.id
        {
            other.bg_var = bg_var;
            other.mdl_var = mdl_var;
            other.wall_bg_var = wall_bg_var;
            other.floor_bg_var = floor_bg_var;
            other.eff_bg_var = eff_bg_var;
            local.loaded = true;
            break;
        }
    }
        // If no existing assets were found, load them
    if !local.loaded
    {
        bg_var = background_add(vanilla_directory_const+'\3D\npc_7_tex.png',false,false);
        mdl_var = d3d_model_create();
        d3d_model_load(mdl_var,main_directory_const+'\MDL\MON\gc_mdl.gmmod');
        wall_bg_var = background_add(vanilla_directory_const+'\TEX\HOS_21.png',false,false);
        floor_bg_var = background_add(vanilla_directory_const+'\TEX\HOS_14.png',false,false);
        eff_bg_var = background_add(vanilla_directory_const+'\TEX\sprites\EX_13_spr.png',false,false);
    }
    tex_var = background_get_texture(bg_var);
    // Movement
    do_acc_var = true;
    acc_var = 0.05;
    frick_var = acc_var;
    move_type_var = 1;
    move_alarm_var = 6;
    // Animation
    turn_rate_var = 5/3;
    turn_max_var = 30;
    inv_chance_var = 3;
    vis_num_var = 2;
    vis_den_var = 3;
    rand_alarm_min_var = 6;
    rand_alarm_max_var = 30;
    flash_var = false;
    // Seen
    spd_per_min_var = 1;
    spd_per_max_var = 12/7; // 1.r714285x
    spd_per_pain_var = 100/7; // 14.r285714x
    spd_per_var = 1;
    spd_delay_min_var = 1;
    spd_delay_max_var = 3;
    seen_delay_min_var = 3;
    seen_delay_max_var = 15;
    seen_yaw_var = 30;
    seen_pitch_var = 30;
    seen_flash_var = true;
    seen_spd_var = true;
    // Effects
    eff_old_var = true;
    eff_var = true;
    // Spawn
    spawn_dist_var = 200;
    // Funny
    upside_var = false;
    // Behavior
    if global.gc_type_var == -1 { local.type = irandom(6); }
    else { local.type = global.gc_type_var; }
    switch local.type
    {
        case 0: // Recode
        {
            move_type_var = 0;
            eff_old_var = false;
            break;
        }
        case 6: // KH Recode
        {
            type_var = 2;
            delay_var = 94;
            spd_base_var = 1.5;
            move_type_var = 2;
            do_acc_var = true;
            acc_var = 0.1;
            frick_var = acc_var;
            // Other
            dmg_var = 20;
            dmg_alarm_var = 120;
            rand_alarm_max_var = 6;
            // Autobrake
            autobrake_var = true;
            autobrake_spd_var = 1;
            autobrake_dir_var = 60;
            // Yes fun
            eff_var = false;
            seen_flash_var = false;
            seen_spd_var = false;
            spawn_dist_var = 0;
            do_anim_var = -1;
            break;
        }
        case 3: // KH
        {
            delay_var = 94; // (128/2.5) + (64/1.5)
            spd_base_var = 1.5;
            inv_chance_var = 4;
            type_var = 2;
            move_type_var = 3;
            dmg_var = 20;
            dmg_alarm_var = 120;
            move_type_var = 3;
            rand_alarm_max_var = 6;
            // Yes fun
            eff_var = false;
            seen_flash_var = false;
            seen_spd_var = false;
            spawn_dist_var = 0;
            do_anim_var = -1;
            break;
        }
        case 5: // Cow
        { upside_var = true; }
        case 4: // HD KH
        {
            spd_base_var = 152/225; // 0.67r5
            local.spd_set = true;
            eff_var = false;
        }
        case 2: // HD
        {
            type_var = 2;
            move_type_var = 2;
            if !local.spd_set
            { spd_base_var = 44/45; } // 0.9r7
            do_acc_var = true;
            acc_var = 16/675; // 0.02r370
            frick_var = acc_var;
            delay_min_var = 90;
            delay_max_var = 180;
            dmg_var = 20;
            dmg_alarm_var = 120;
            eff_old_var = false;
            // Autobrake (close enough)
            autobrake_var = true;
            autobrake_spd_var = 0;
            autobrake_dir_var = 60;
            // No fun
            seen_flash_var = false;
            seen_spd_var = false;
            spawn_dist_var = 0;
            do_anim_var = -1;
            rand_alarm_min_var = -1;
            rand_alarm_max_var = -1;
            dur_var = irandom_range(10,15);
            break;
        }
    }
    // Alarms
    alarm_len_var = 12;
    alarm_arr[8,2] = '';
    alarm_arr[9,2] = '';
    alarm_arr[10,2] = '';
    alarm_arr[11,2] = '';
    event_inherited();
    if upside_var { z_off_var = 24.5; } // 21.3
    do_snd_var = false;
");
// Destroy Event
object_event_add
(argument0,ev_destroy,0,"
    event_inherited();
    global.wall_bg_tex = background_get_texture(global.wall_bg);
    global.floor_bg_tex = background_get_texture(global.floor_bg);
    if instance_number(object_index) <= 1
    {
        background_delete(bg_var);
        background_delete(wall_bg_var);
        background_delete(floor_bg_var);
        background_delete(eff_bg_var);
        d3d_model_destroy(mdl_var);
    }
    with player_obj
    { fov_var = global.fov_var; }
    with gc_eff_obj
    { instance_destroy(); }
");
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,"
    event_inherited();
    if move_type_var == 3
    {
        x = global.spawn_arr[0,0];
        y = global.spawn_arr[0,1];
    }
    else if spawn_dist_var != 0
    {
        local.dist = random_range(-spawn_dist_var,spawn_dist_var);
        x += lengthdir_x(local.dist,yaw_var+90);
        y += lengthdir_y(local.dist,yaw_var+90);
    }
    mdl_yaw_var = yaw_var;
    mdl_pitch_var = pitch_var;
    do_seen_var = true;
    spd_per_var = 1;
    visible = true;
    // Effects
    global.wall_bg_tex = background_get_texture(wall_bg_var);
    global.floor_bg_tex = background_get_texture(floor_bg_var);
    with ceil_par_obj
    { visible = false; }
    with wall_par_obj
    { h_var = max(h_var,ceil(global.fog_end_var/32)*32); }
    with player_obj
    { if fov_var > 40 { fov_var = 40; }}
    if !instance_exists(gc_eff_obj)
    {
        with instance_create(0,0,gc_eff_obj)
        {
            bg_var = other.eff_bg_var;
            old_var = other.eff_old_var;
        }
    }
");
// Delay
object_event_add
(argument0,ev_alarm,0,"
    event_inherited();
    if rand_alarm_min_var > 0
    { set_alarm_scr(8,irandom_range(rand_alarm_min_var,rand_alarm_max_var)); }
    if move_type_var == 3
    { set_alarm_scr(11,move_alarm_var); }
");
// Movement
object_event_add
(argument0,ev_other,ev_user0,"
    if spd_per_var != 1 { spd_mult_var *= spd_per_var; }
    local.yaw = point_direction(x,y,target_x_var,target_y_var);
    local.pitch = point_direction_3d_scr(x,y,z,target_x_var,target_y_var,target_z_var);
    local.spd = spd_base_var*spd_mult_var;
    switch move_type_var
    {
        case 0: // Recode
        {
            event_inherited();
            local.yawdiff = deg_diff_scr(local.yaw,yaw_var);
            local.pitchdiff = deg_diff_scr(local.pitch,pitch_var);
            set_motion_3d_scr
            (
                0,false,
                local.yaw+(sign(local.yawdiff)*-turn_max_var),
                abs(local.yawdiff)>turn_max_var, // Change yaw if difference is over max
                local.pitch+(sign(local.pitchdiff)*-turn_max_var),
                abs(local.pitchdiff)>turn_max_var // Change pitch if difference is over max
            );
            mdl_yaw_var = yaw_var;
            mdl_pitch_var = pitch_var;
            break;
        }
        case 1: // OG
        {
            // Turning
            local.yawdiff = deg_diff_scr(local.yaw,mdl_yaw_var);
            local.pitchdiff = deg_diff_scr(local.pitch,mdl_pitch_var);
            if abs(local.yawdiff) > turn_max_var { mdl_yaw_var = local.yaw+(sign(local.yawdiff)*-turn_max_var); }
            else { mdl_yaw_var += sign(local.yawdiff)*min(abs(local.yawdiff),turn_rate_var*global.delta_time_var); }
            if abs(local.pitchdiff) > turn_max_var { mdl_pitch_var = local.pitch+(sign(local.pitchdiff)*-turn_max_var); }
            else { mdl_pitch_var += sign(local.pitchdiff)*min(abs(local.pitchdiff),turn_rate_var*global.delta_time_var); }
            // Movement
            if target_dist_var < 4 { local.newspd = 0; }
            else if target_dist_var < 16 { local.newspd = spd_var-frick_var; }
            else { local.newspd = spd_var+acc_var; }
            local.newspd = median(0,local.spd,local.newspd);
            set_motion_3d_scr(local.newspd,true,local.yaw,true,local.pitch,true);
            break;
        }
        case 3: // KH OG
        { exit; }
        default:
        {
            event_inherited();
            mdl_yaw_var = yaw_var;
            mdl_pitch_var = pitch_var;
            break;
        }
    }
    spd_mult_var = 1;
");
// Random anim
object_event_add
(argument0,ev_alarm,8,"
    if !irandom(inv_chance_var-1) && image_alpha != 0 { image_alpha = 0; }
    else { image_alpha = choose(1,random_range(0.5,1)); }
    set_alarm_scr(8,irandom_range(rand_alarm_min_var,rand_alarm_max_var));
");
// Seen Alarm
object_event_add
(argument0,ev_alarm,9,"
    do_seen_var = true;
    event_perform(ev_alarm,10);
    set_alarm_scr(10,-1);
");
// Speed Reset
object_event_add
(argument0,ev_alarm,10,"
    spd_per_var = 1;
    if spd_var > spd_base_var
    { set_motion_3d_scr(spd_base_var,true); }
");
// Move alarm (move type 3 only)
object_event_add
(argument0,ev_alarm,11,"
    if move_var
    {
        local.spd = spd_base_var*spd_mult_var*move_alarm_var;
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
            }
        }
        else if type_var > 0
        {
            local.can_path = mp_grid_path(grid_var,path_var,x,y,target_x_var,target_y_var,true);
            sight_type_var = 2;
            event_perform(ev_other,ev_user8);
            if enter_var || target_visible_var || !local.can_path
            {
                yaw_var = point_direction(x,y,target_x_var,target_y_var);
                x += lengthdir_x(local.spd,yaw_var);
                y += lengthdir_y(local.spd,yaw_var);
            }
            else
            {
                // I think it's based on grid snap?
                local.xnext = path_get_point_x(path_var,local.spd/global.grid_snap_var);
                local.ynext = path_get_point_y(path_var,local.spd/global.grid_snap_var);
                if local.xnext != 0 || local.ynext != 0
                {
                    // if keyboard_check(ord('P')) { show_message(string(point_distance(x,y,local.xnext,local.ynext)/local.spd)); }
                    yaw_var = point_direction(x,y,local.xnext,local.ynext)
                    x = local.xnext;
                    y = local.ynext;
                }
            }
        }
        else
        {
            yaw_var = point_direction(x,y,target_x_var,target_y_var);
            pitch_var = point_direction_3d_scr(x,y,z,target_x_var,target_y_var,target_z_var);
            x += lengthdir_x(lengthdir_x(local.spd,yaw_var),pitch_var);
            y += lengthdir_x(lengthdir_y(local.spd,yaw_var),pitch_var);
            z -= lengthdir_y(local.spd,pitch_var);
            pitch_var = pitch_var;
        }
        spd_mult_var = 1;
        mdl_yaw_var = yaw_var;
        mdl_pitch_var = pitch_var;
    }
    set_alarm_scr(11,move_alarm_var);
");
// Animation
object_event_add
(argument0,ev_other,ev_user1,"
    x_off_var = random_range(-0.5,0.5);
    y_off_var = random_range(-0.5,0.5);
    z_off_var = random_range(-0.5,0.5);
    if upside_var { z_off_var += 24.5; }
    visible = frac_chance_scr(vis_num_var,vis_den_var);
");
// Calculate Seen
object_event_add
(argument0,ev_other,ev_user5,"
    event_inherited();
    if seen_var == true
    {
        do_seen_var = false;
        if seen_spd_var
        {
            if !irandom(3)
            {
                spd_per_var = spd_per_pain_var;
                local.yaw = point_direction(x,y,target_x_var,target_y_var);
                local.pitch = point_direction_3d_scr(x,y,z,target_x_var,target_y_var,target_z_var);
                set_motion_3d_scr(spd_base_var*spd_per_var,true,local.yaw,true,local.pitch,true);
            }
            else
            {
                if !irandom(2) { spd_per_var = random_range(spd_per_min_var,spd_per_max_var); }
                set_motion_3d_scr(spd_base_var*spd_per_var,true);
            }
            set_alarm_scr(9,irandom_range(seen_delay_min_var,seen_delay_max_var));
        }
        if !irandom(3) && seen_flash_var
        {
            with instance_create(0,0,fade_eff_obj)
            {
                if !irandom(1) { image_blend = c_black; }
                else { image_blend = c_red; }
                set_alarm_scr(0,20); 
                invert_var = 2;
                stay_var = false;
                cam_id_var = -1;
            }
        }
        set_alarm_scr(10,irandom_range(spd_delay_min_var,spd_delay_max_var));
    }
");
// Draw Event
object_event_add
(argument0,ev_draw,0,"
    if on_var || visible_var
    {
        draw_set_color(image_blend); draw_set_alpha(image_alpha);
        d3d_transform_set_identity();
        if upside_var { d3d_transform_add_rotation_x(180); } 
        d3d_transform_add_rotation_y(mdl_pitch_var);
        d3d_transform_add_rotation_z(mdl_yaw_var);
        d3d_transform_add_translation(x+x_off_var,y+y_off_var,z+z_off_var);
        d3d_model_draw(mdl_var,0,0,0,tex_var);
        d3d_transform_set_identity();
        draw_set_color(c_white); draw_set_alpha(1);
    }
");