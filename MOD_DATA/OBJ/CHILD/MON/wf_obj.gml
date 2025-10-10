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
    name_var = 'White Face';
    type_var = 0;
    spd_base_var = 0.9;
    spr_spd_var = 1;
    dur_var = 40;
    delay_var = 640/9; // 71.r1
    dmg_var = 30;
    dmg_alarm_var = 90;
    w_var = 3;
    h_var = 4.1;
    z_off_base_var = 14;
    z_off_var = 14;
    // Assets
        // Search for existing assets to save memory
    with object_index
    {
        if id != other.id
        {
            other.spr_var = spr_var;
            other.bg_var = bg_var;
            other.tex_spr_var = tex_spr_var;
            local.loaded = true;
            break;
        }
    }
        // If no existing assets were found, load them
    if !local.loaded
    {
        spr_var = sprite_add(vanilla_directory_const+'\TEX\sprites\MS28_01_spr.png',8,false,false,0,0);
        bg_var = background_add(vanilla_directory_const+'\TEX\sprites\MS28_02_spr.png',false,false);
        tex_spr_var = sprite_add(vanilla_directory_const+'\TEX\sprites\MS28_03_spr.png',3,false,false,0,0);
    }
    tex_02_var = background_get_texture(bg_var);
    // Sounds
    do_snd_var = -1; // At least for now
    // White Face Specific
    vis_num_var = 2;
    vis_den_var = 3;
    // Seen Stuff
    seen_delay_min_var = 3;
    seen_delay_max_var = 15;
    seen_yaw_var = 30;
    seen_pitch_var = 30;
    seen_flash_var = true;
    // Teleport
    tp_spawn_var = 2;
    tp_spd_var = 30;
    tp_chance_var = 4;
    tp_seen_delay_var = 60;
    tp_dist_min_var = 160;
    tp_dist_max_var = 400;
    tp_dist_var = 400;
    tp_sight_var = false;
    // Effect
    eff_01_alarm_var = 6;
    eff_02_alarm_var = 20;
    eff_03_alarm_min_var = 6;
    eff_03_alarm_max_var = 40;
    // Movement
    spd_per_var = 1;
    spd_delay_min_var = 1;
    spd_delay_max_var = 6;
    seen_acc_var = 100/6; // GOOD GOD
    seen_spd_var = true;
    seen_spd_chance_var = 3;
    acc_var = 4/3375; // 0.001r185 :sob:
    frick_var = acc_var;
    // Anim
    seen_anim_var = false;
    anim_off_var = 0.1;
    anim_type_var = 4;
    face_dist_var = 48;
    // other
    attack_stun_var = true;
    door_spawn_var = true;
    // Behavior
    if global.wf_type_var == -1 { local.type = irandom(3); }
    else { local.type = global.wf_type_var; }
    switch local.type
    {
        case 0: // Recode
        {
            dur_var = 30;
            spawn_weird_var = true;
            tp_spawn_var = 1;
            break;
        }
        case 2: // HD
        {
            dmg_var = 30;
            dmg_alarm_var = 60;
            delay_min_var = 90;
            delay_max_var = 180;
            tp_dist_min_var = 320/3; // 106.r6
            tp_dist_max_var = 2560/3; // 853.r3
            tp_dist_var = 1184/3; // 394.r6
            seen_acc_var = 2/45; // 0.0r4
            seen_yaw_var = 60;
            seen_pitch_var = 60;
            seen_spd_chance_var = 4;
            eff_02_alarm_var = 12;
            tp_spd_var = 16/15; // 1.0r6
            tp_chance_var = 1;
            attack_stun_var = false;
            seen_anim_var = true;
            anim_off_var = 16/15;
            anim_type_var = 0;
            face_dist_var = 0;
            spr_spd_var = 1/6; // 0.1r6 I think
            // Estimates
            w_var = 8;
            h_var = 11;
            z_off_base_var = 12;
            break;
        }
        case 3: // Old HD
        {
            dmg_var = 60;
            dmg_alarm_var = 180;
            break;
        }
    }
    alarm_len_var = 10;
    alarm_arr[8,2] = '';
    alarm_arr[9,2] = '';
");
// Destroy Event
object_event_add
(argument0,ev_destroy,0,"
    event_inherited();
    global.wall_bg_tex = background_get_texture(global.wall_bg);
    global.floor_bg_tex = background_get_texture(global.floor_bg);
    global.ceil_bg_tex = background_get_texture(global.ceil_bg);
    if instance_number(object_index) <= 1
    {
        sprite_delete(spr_var);
        background_delete(bg_var);
        sprite_delete(tex_spr_var);
    }
");
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,"
    event_inherited();
    do_seen_var = true;
    spd_per_var = 1;
    visible = true;
    if door_spawn_var && !irandom(5)
    {
        // Reset Position
        local.spawn = irandom_range(1,global.spawn_len_var-1);
        yaw_var = global.spawn_arr[local.spawn,3];
        x = global.spawn_arr[local.spawn,0]-lengthdir_x(exit_dist_var,yaw_var);
        y = global.spawn_arr[local.spawn,1]-lengthdir_y(exit_dist_var,yaw_var);
        z = global.spawn_arr[local.spawn,2];
        set_motion_3d_scr(0,true,yaw_var,true,0,true);
        // Reset
        event_user(6);
        event_perform(ev_alarm,0);
        set_alarm_scr(0,-1);
    }
    else if tp_spawn_var && !irandom(2)
    {
        if tp_spawn_var == 2
        {
            local.dist1 = 32+random_range(160,400);
            local.dist2 = random_range(-400,400);
            x += lengthdir_x(local.dist1,yaw_var)+lengthdir_y(local.dist2,yaw_var);
            y += lengthdir_y(local.dist1,yaw_var)+lengthdir_x(local.dist2,yaw_var);
        }
        else { event_user(15); }
        // Reset
        event_user(6);
        event_perform(ev_alarm,0);
        set_alarm_scr(0,-1);
    }
    // Effects
    global.wall_bg_tex = sprite_get_texture(tex_spr_var,0);
    global.floor_bg_tex = sprite_get_texture(tex_spr_var,1);
    global.ceil_bg_tex = sprite_get_texture(tex_spr_var,2);
");
// Seen Alarm
object_event_add
(argument0,ev_alarm,8,"
    do_seen_var = true;
    event_perform(ev_alarm,9);
    set_alarm_scr(9,-1);
");
// Speed Reset
object_event_add
(argument0,ev_alarm,9,"
    spd_per_var = 1;
    if spd_var > spd_base_var
    { set_motion_3d_scr(spd_base_var,true); }
");
// Animation
object_event_add
(argument0,ev_other,ev_user1,"
    if anim_type_var == 4
    {
        if !irandom(2) { spr_id_var = irandom(sprite_get_number(spr_var)-1); }
        x_off_var = random_range(-anim_off_var,anim_off_var);
        y_off_var = random_range(-anim_off_var,anim_off_var);
        z_off_var = z_off_base_var+random_range(-anim_off_var,anim_off_var);
        visible = frac_chance_scr(vis_num_var,vis_den_var);
        tex_var = sprite_get_texture(spr_var,floor(spr_id_var));
    }
    event_inherited();
");
// Movement
object_event_add
(argument0,ev_other,ev_user0,"
    if tp_dist_var > 0 && target_dist_var > tp_dist_var { event_user(15); }
    if spd_per_var != 1 { spd_mult_var *= spd_per_var; }
    switch move_type_var
    {
        case 0: { event_inherited(); break; }
        case 2:
        {
            local.yaw = point_direction(x,y,target_x_var,target_y_var);
            local.pitch = point_direction_3d_scr(x,y,z,target_x_var,target_y_var,target_z_var);
            set_motion_3d_scr(spd_var+acc_var,true,local.yaw,true,local.pitch,true);
            break;
        }
    }
    
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
            if frac_chance_scr(1,seen_spd_chance_var)
            {
                local.yaw = point_direction(x,y,target_x_var,target_y_var);
                local.pitch = point_direction_3d_scr(x,y,z,target_x_var,target_y_var,target_z_var);
                switch move_type_var
                {
                    case 0:
                    {
                        spd_per_var += seen_acc_var;
                        local.yaw = point_direction(x,y,target_x_var,target_y_var);
                        local.pitch = point_direction_3d_scr(x,y,z,target_x_var,target_y_var,target_z_var);
                        set_motion_3d_scr(spd_base_var*spd_per_var,true,local.yaw,true,local.pitch,true);
                        break;
                    }
                    case 2:
                    {
                        set_motion_3d_scr(spd_var+seen_acc_var,true,local.yaw,true,local.pitch,true);
                        break;
                    }
                }
                
            }
            set_alarm_scr(9,irandom_range(seen_delay_min_var,seen_delay_max_var));
        }
        if seen_anim_var
        {
            x_off_var = random_range(-anim_off_var,anim_off_var);
            y_off_var = random_range(-anim_off_var,anim_off_var);
            z_off_var = z_off_base_var+random_range(-anim_off_var,anim_off_var);
        }
        if !irandom(3) && seen_flash_var
        {
            // Make sure not to blind the player
            if !instance_exists(color_par_obj)
            || color_get_red(color_par_obj.image_blend) > 96
            { local.rand = irandom(3); }
            else { local.rand = irandom(2); }
            switch local.rand
            {
                case 0:
                {
                    with instance_create(0,0,flash_eff_obj)
                    {
                        image_blend = c_red; 
                        set_alarm_scr(0,other.eff_01_alarm_var);
                        cam_id_var = -1;
                    }
                    break;
                }
                case 1:
                case 2:
                {
                    with instance_create(0,0,fade_eff_obj)
                    {
                        if local.rand == 2 { image_blend = c_black; }
                        else { image_blend = c_red; }
                        set_alarm_scr(0,other.eff_02_alarm_var); 
                        invert_var = 2;
                        stay_var = false;
                        cam_id_var = -1;
                    }
                    break;
                }
                case 3:
                {
                    // Turn everything red (need to code that)
                    with instance_create(0,0,color_flash_eff_obj)
                    {
                        image_blend = c_red; 
                        set_alarm_scr(0,irandom_range(other.eff_03_alarm_min_var,other.eff_03_alarm_max_var));
                        cam_id_var = -1;
                    }
                    break;
                }
            }
        }
        if spd_var >= tp_spd_var && frac_chance_scr(1,tp_chance_var)
        {
            // Teleport
            event_user(15);
            set_alarm_scr(8,tp_seen_delay_var);
        }
        else
        {
            set_alarm_scr(8,irandom_range(spd_delay_min_var,spd_delay_max_var));
        }
    }
");
// Attack Success
object_event_add
(argument0,ev_other,ev_user3,"
    event_inherited();
    event_user(15);
    if attack_stun_var
    {
        do_seen_var = false;
        move_var = false;
        set_alarm_scr(1,dmg_alarm_var);
        set_alarm_scr(8,dmg_alarm_var);
        set_motion_3d_scr(0,true);
    }
");
// Teleport
object_event_add
(argument0,ev_other,ev_user15,"
    // Originally anywhere in the room (0-1280 x 0-720 y)
    if tp_sight_var { local.dir = random_range(target_eye_yaw_var+seen_yaw_var,target_eye_yaw_var+360-seen_yaw_var); }
    else { local.dir = random(360); }
    local.dist = random_range(tp_dist_min_var,tp_dist_max_var);
    x = target_x_var+lengthdir_x(local.dist,local.dir);
    y = target_y_var+lengthdir_x(local.dist,local.dir);
");
// Draw Event
object_event_add
(argument0,ev_draw,0,"
    if on_var || visible_var
    {
        local.tex = tex_var;
        if face_dist_var > 0
        {
            if !irandom(1) && point_distance_3d_scr(x,y,z,global.cam_x_var[view_current],global.cam_y_var[view_current],global.cam_z_var[view_current]) <= face_dist_var
            { tex_var = tex_02_var; }
        }
        d3d_set_fog(true,c_black,0,256);
        event_inherited();
        d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var);
        tex_var = local.tex;
    }
");