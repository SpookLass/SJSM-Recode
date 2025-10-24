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
    ini_open(global.lang_var);
    switch global.name_var
    {
        case name_og_const:
        {
            name_var = ini_read_string('NAME','patient_og','NAME_patient_og');
            break;
        }
        case name_hd_const:
        {
            name_var = ini_read_string('NAME','patient_hd','NAME_patient_hd');
            break;
        }
        case name_fanon_const:
        {
            name_var = ini_read_string('NAME','patient_fanon','NAME_patient_fanon');
            break;
        }
        case name_num_og_const:
        {
            name_var = ini_read_string('NAME','patient_num_og','NAME_patient_num_og');
            break;
        }
        case name_num_hd_const:
        {
            name_var = ini_read_string('NAME','patient_num_hd','NAME_patient_num_hd');
            break;
        }
    }
    ini_close();
    type_var = 0;
    spd_base_var = 2;
    dur_var = irandom_range(20,33);
    delay_var = 60;
    dmg_var = 10;
    dmg_alarm_var = 30;
    // Theme
    mus_delay_var = 144
    // Assets
        // Search for existing assets to save memory
    with object_index
    {
        if id != other.id
        {
            other.spr_var = spr_var;
            other.mdl_01_var = mdl_01_var;
            other.mdl_02_var = mdl_02_var;
            other.bg_overlay_var = bg_overlay_var;
            other.wake_snd_var[1] = wake_snd_var[1];
            other.mus_snd_var = mus_snd_var;
            local.loaded = true;
            break;
        }
    }
        // If no existing assets were found, load them
    if !local.loaded
    {
        spr_var = sprite_add(main_directory_const+'\SPR\MON\patient_spr.png',3,false,false,0,0); // vanilla_directory_const+'\3D\npc_6_tex.png'
        wake_snd_var[1] = fmod_snd_add_scr(main_directory_const+'\SND\MON\patient_wake_snd.wav');
        mus_snd_var = fmod_snd_add_scr(main_directory_const+'\SND\MON\patient_mus_snd.mp3');
        fmod_snd_set_group_scr(mus_snd_var,snd_group_mus_const);
        mdl_01_var = d3d_model_create();
        mdl_02_var = d3d_model_create();
        d3d_model_load(mdl_01_var,main_directory_const+'\MDL\MON\patient_01_mdl.gmmod');
        d3d_model_load(mdl_02_var,main_directory_const+'\MDL\MON\patient_02_mdl.gmmod');
        bg_overlay_var = background_add(vanilla_directory_const+'\TEX\sprites\fog_spr.png',false,false);
    }
    // Seen
    do_seen_var = true;
    seen_spd_mult_var = 0.02;
    tp_alarm_var = 220;
    tp_sight_var = false;
    tp_dist_min_var = 128;
    tp_dist_max_var = 512;
    // Render
    tex_var = sprite_get_texture(spr_var,0);
    mdl_var = mdl_01_var;
    // Rand
    rand_chance_var = 3;
    rand_alarm_min_var = 3;
    rand_alarm_max_var = 9;
    // Hang
    hang_var = true;
    seen_yaw_01_var = 3.434; // 3.r43
    seen_yaw_02_var = 30;
    spr_spd_var = 1;
    // Overlay
    overlay_var = true;
    overlay_color_var = c_white;
    overlay_alpha_var = 0.1;
    // Behavior
    if global.patient_type_var == -1 { local.type = irandom(2); }
    else { local.type = global.patient_type_var; }
    switch local.type
    {
        case 0: // Recode
        {
            spd_base_var = 2;
            seen_pitch_01_var = 3.434;
            seen_pitch_02_var = 30;
            rand_alarm_min_var = 6;
            rand_alarm_max_var = 6;
            tp_alarm_var = -1;
            rage_alarm_var = 480;
            seen_spd_mult_var = 1;
            seen_rage_var = 2;
            inv_move_var = true;
            inv_limit_var = 30;
            weird_var = true;
            weird_chance_var = 16;
            break;
        }
        case 2:
        {
            hang_var = false;
            type_var = 2;
            spd_base_var = 8/9; // 0.r8
            do_acc_var = true;
            acc_var = 16/675; // 0.02r370
            seen_yaw_var = 60;
            rand_alarm_min_var = 6;
            rand_alarm_max_var = 6;
            tp_alarm_var = 480;
            overlay_var = false;
            // HD Only
            seen_spd_mult_var = 1;
            seen_rage_var = true;
            rage_alarm_var = 480;
            inv_move_var = true;
            inv_limit_var = 30;
            back_tp_alarm_var = 60;
            hurt_snd_var = 3;
            do_hurt_var = true;
            stun_var = true;
            break;
        }
        case 3: // Old Recode / Plus
        {
            seen_pitch_01_var = 3.434;
            seen_pitch_02_var = 30;
            tp_sight_var = true;
            draw_pos_var = true;
            weird_var = true;
            weird_chance_var = 16;
            break;
        }
    }
    if hang_var
    {
        wake_snd_var[0] = 2;
        seen_yaw_var = seen_yaw_01_var;
        seen_pitch_var = seen_pitch_01_var;
        do_anim_var = true;
    }
    else
    {
        wake_snd_var[0] = 1;
        seen_yaw_var = seen_yaw_02_var;
        seen_pitch_var = seen_pitch_02_var;
        do_anim_var = -1;
    }
    // Alarms
    alarm_len_var = 13;
    // Bools
    do_mdl_var = true;
    do_snd_var = -1;
");
// Destroy Event
object_event_add
(argument0,ev_destroy,0,"
    event_inherited();
    if instance_number(object_index) <= 1
    {
        sprite_delete(spr_var);
        background_delete(bg_overlay_var);
        d3d_model_destroy(mdl_01_var);
        d3d_model_destroy(mdl_02_var);
        fmod_snd_free_scr(mus_snd_var);
    }
    with kh_overlay_obj
    { if par_var == other.id { instance_destroy(); }}
");
// Room start
object_event_add
(argument0,ev_other,ev_room_start,"
    event_inherited();
    draw_yaw_var = yaw_var;
    if hang_var
    {
        on_var = true;
        set_alarm_scr(0,-1);
        move_var = false;
        attack_var = false;
        anim_var = do_anim_var;
        local.spawn = irandom_range(1,global.spawn_len_var-1);
        x = global.spawn_arr[local.spawn,0];
        y = global.spawn_arr[local.spawn,1];
        z = global.spawn_arr[local.spawn,2];
        yaw_var = global.spawn_arr[local.spawn,3];
        mdl_var = mdl_02_var;
        tex_var = sprite_get_texture(spr_var,1);
        draw_yaw_var = yaw_var+180;
    }
    else
    {
        mdl_var = mdl_01_var;
        if mus_prio_var <= amb_mus_prio_const && alarm_arr[11,0] <= 0
        {
            if fmod_inst_is_play_scr(snd_var) { set_alarm_scr(11,fmod_inst_get_len_scr(snd_var)*(1-fmod_inst_get_pos_scr(snd_var))*milli_frame_rate_const/global.game_spd_var); }
            else { event_perform(ev_alarm,11); }
        }
        x = global.spawn_arr[0,0];
        y = global.spawn_arr[0,1];
        z = global.spawn_arr[0,2];
        if overlay_var && !instance_exists(kh_overlay_obj)
        {
            with instance_create(0,0,kh_overlay_obj) do
            {
                par_var = other.id;
                image_blend = other.overlay_color_var;
                image_alpha = other.overlay_alpha_var;
                bg_var = other.bg_overlay_var;
            }
        }
        if seen_rage_var { set_alarm_scr(12,rage_alarm_var); }
    }
    if seen_rage_var == 2 { rage_var = false; }
    enter_var = false;
    do_coll_var = type_var > 0;
    // Become visible
    draw_x_var = x;
    draw_y_var = y;
    draw_z_var = z;
    event_user(14);
");
// Room End
object_event_add
(argument0,ev_other,ev_room_end,"
    if hang_var
    {
        hang_var = false;
        visible = true;
        seen_yaw_var = seen_yaw_02_var;
        seen_pitch_var = seen_pitch_02_var;
        snd_var = fmod_snd_play_scr(wake_snd_var[1]);
        do_anim_var = false;
        anim_var = false;
    }
    event_inherited();
");
// Delay
object_event_add
(argument0,ev_alarm,0,"
    event_inherited();
    if inv_move_var { move_var = false; }
    event_perform(ev_alarm,8);
");
// Random anim
object_event_add
(argument0,ev_alarm,8,"
    if seen_rage_var
    {
        if alarm_arr[12,0] <= 0 || rage_var { local.chance = true; }
        else { local.chance = (random(1) >= alarm_arr[12,0]/alarm_arr[12,1]); }
    }
    else { local.chance = frac_chance_scr(1,rand_chance_var) }
    if local.chance && (inv_limit_var <= 0 || inv_time_var < inv_limit_var)
    {
        if image_alpha == 1 && inv_move_var { move_var = do_move_var; }
        image_alpha = 0;
    }
    // Become visible
    else { event_user(14); }
    set_alarm_scr(8,irandom_range(rand_alarm_min_var,rand_alarm_max_var));
");
// Animation
object_event_add
(argument0,ev_other,ev_user1,"
    spr_prog_var -= spr_spd_var*global.delta_time_var;
    if spr_prog_var <= 0
    {
        spr_prog_var = 1;
        visible = frac_chance_scr(1,2);
    }
");
// Teleport Alarm
object_event_add
(argument0,ev_alarm,9,"
    event_user(15);
");
// Teleport Behind Alarm
object_event_add
(argument0,ev_alarm,10,"
    local.xvel = -lengthdir_x(1,target_eye_yaw_var);
    local.yvel = -lengthdir_y(1,target_eye_yaw_var);
    if check_ray_scr(target_x_var,target_y_var,target_z_var+(target_var.coll_var[1]/2),local.xvel,local.yvel,0) > 32+(coll_var[2]/2)
    {
        x = target_x_var+(local.xvel*32);
        y = target_y_var+(local.yvel*32);
        z = target_z_var;
        // Become visible
        event_user(14);
    }
");
// Play Theme
object_event_add
(argument0,ev_alarm,11,"
    mus_prio_var = theme_mus_prio_const;
    with mus_control_obj { event_user(0); }
");
// Maybe scream?
object_event_add
(argument0,ev_alarm,12,"
    if seen_rage_var == 2
    {
        snd_var = fmod_snd_play_scr(wake_snd_var[1]);
        rage_var = true;
    }
");
// Step event
object_event_add
(argument0,ev_step,ev_step_normal,"
    if hang_var
    {
        if seen_var == 1 && target_dist_var <= 200 // Look target is so weird
        {
            hang_var = false;
            visible = true;
            seen_yaw_var = seen_yaw_02_var;
            seen_pitch_var = seen_pitch_02_var;
            snd_var = fmod_snd_play_scr(wake_snd_var[1]);
            do_anim_var = false;
            anim_var = false;
            set_alarm_scr(11,fmod_inst_get_len_scr(snd_var)*milli_frame_rate_const/global.game_spd_var);
            event_perform(ev_other,ev_room_start);
        }
    }
    else
    {
        if seen_var == 1
        {
            spd_mult_var *= seen_spd_mult_var;
            if tp_alarm_var > 0 && alarm_arr[9,0] <= 0 { set_alarm_scr(9,tp_alarm_var); }
            if seen_rage_var && !rage_var && alarm_arr[12,0] <= 0 { set_alarm_scr(12,rage_alarm_var); }
            if image_alpha == 0 && inv_limit_var > 0 { inv_time_var += global.delta_time_var; }
        }
        else
        {
            if alarm_arr[9,0] > 0 { set_alarm_scr(9,-1); }
            if alarm_arr[12,0] > 0 { set_alarm_scr(12,-1); }
            if seen_rage_var == 2 { rage_var = false; }
        }
        if back_tp_alarm_var > 0
        {
            if seen_var == 0
            {
                if alarm_arr[10,0] <= 0 { set_alarm_scr(10,back_tp_alarm_var); }
            }
            else if alarm_arr[10,0] > 0 { set_alarm_scr(10,-1); }
        }
    }
    if !draw_pos_var
    {
        draw_x_var = x;
        draw_y_var = y;
        draw_z_var = z;
        draw_yaw_var = yaw_var;
        if mdl_var == mdl_02_var { draw_yaw_var += 180; }
    }
    event_inherited();
");
// Attack Success
// Uses attack_target_var as an argument, usually the player.
object_event_add
(argument0,ev_other,ev_user3,"
    event_inherited();
    // Become visible
    event_user(14);
");
// Hurt
object_event_add
(argument0,ev_other,ev_user4,"
    event_inherited();
    if stun_var
    {
        on_var = false;
        with instance_create(0,0,flash_eff_obj)
        {
            image_blend = c_red;
            cam_id_var = hurt_target_var.cam_id_var;
            set_alarm_scr(0,18);
        }
    }
");
// Become visible
object_event_add
(argument0,ev_other,ev_user14,"
    if image_alpha == 0
    {
        if inv_move_var { move_var = false; set_motion_3d_scr(0,true); }
        if inv_limit_var > 0 { inv_time_var = 0; }
        if draw_pos_var
        {
            draw_x_var = x;
            draw_y_var = y;
            draw_z_var = z;
            draw_yaw_var = yaw_var;
        }
        if weird_var
        {
            if frac_chance_scr(1,weird_chance_var)
            {
                if frac_chance_scr(1,4)
                {
                    mdl_var = mdl_02_var;
                    tex_var = sprite_get_texture(spr_var,1);
                    draw_yaw_var += 180;
                }
                else
                {
                    mdl_var = mdl_01_var;
                    tex_var = sprite_get_texture(spr_var,2);
                }
                
            }
            else
            {
                mdl_var = mdl_01_var;
                tex_var = sprite_get_texture(spr_var,0);
            }
        }
    }
    image_alpha = 1;
")
// Teleport
object_event_add
(argument0,ev_other,ev_user15,"
    // Originally anywhere in the room (0-1280 x 0-720 y)
    if type_var > 0
    {
        if mp_grid_path(grid_var,path_var,global.spawn_arr[0,0],global.spawn_arr[0,1],global.spawn_arr[1,0],global.spawn_arr[1,1],true)
        {
            if path_get_length(path_var) > tp_dist_min_var*2.5
            {
                local.pos = random(path_get_length(path_var));
                local.xtmp = path_get_x(path_var,local.pos);
                local.ytmp = path_get_y(path_var,local.pos);
                z = global.spawn_arr[0,2];
                while point_distance_3d_scr(target_x_var,target_y_var,target_z_var,local.xtmp,local.ytmp,z) < tp_dist_min_var
                {
                    local.pos = random(path_get_length(path_var));
                    local.xtmp = path_get_x(path_var,local.pos);
                    local.ytmp = path_get_y(path_var,local.pos);
                }
                x = local.xtmp;
                y = local.ytmp;
            }
        }
    }
    else
    {
        if tp_sight_var { local.dir = random_range(target_eye_yaw_var+seen_yaw_var,target_eye_yaw_var+360-seen_yaw_var); }
        else { local.dir = random(360); }
        local.dist = random_range(tp_dist_min_var,tp_dist_max_var);
        x = target_x_var+lengthdir_x(local.dist,local.dir);
        y = target_y_var+lengthdir_y(local.dist,local.dir);
        z = target_z_var;
    }
    // Become visible
    event_user(14);
");
// Draw Event
object_event_add
(argument0,ev_draw,0,"
    if on_var || visible_var
    {
        draw_set_color(image_blend); draw_set_alpha(image_alpha);
        d3d_transform_set_identity();
        if do_mdl_var
        {
            // d3d_transform_add_rotation_y(pitch_var);
            d3d_transform_add_rotation_z(draw_yaw_var);
            d3d_transform_add_translation(draw_x_var+x_off_var,draw_y_var+y_off_var,draw_z_var+z_off_var);
            d3d_model_draw(mdl_var,0,0,0,tex_var);
        }
        else
        {
            d3d_transform_add_rotation_z(point_direction(x,y,global.cam_x_var[view_current],global.cam_y_var[view_current]));
            d3d_transform_add_translation(draw_x_var+x_off_var,draw_y_var+y_off_var,draw_z_var+z_off_var);
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
");