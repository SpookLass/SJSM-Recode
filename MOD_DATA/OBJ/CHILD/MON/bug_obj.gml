// Builtin Variables
object_set_depth(argument0,-3);
object_set_mask(argument0,noone);
object_set_parent(argument0,echidna_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,1,'
    // Sounds
    snd_len_var = 4;
    snd_num_var = 1;
    snd_den_var = 2;
    snd_alarm_min_var = 80;
    snd_alarm_max_var = 240;
    snd_dist_max_var = 800;
    loop_snd_var[0] = true;
    loop_snd_dist_min_var = 0;
    loop_snd_dist_max_var = 600;
    // Translations
    ini_open(global.lang_var);
    name_var = translate_mon_str_scr("bug",global.name_var);
    loop_snd_var[2] = string_replace(ini_read_string("SUB","bug_loop","SUB_bug_loop"),"@n",name_var); loop_snd_var[3] = false;
    local.sub = string_replace(ini_read_string("SUB","bug","SUB_bug"),"@n",name_var);
    for (local.i=0; local.i<snd_len_var; local.i+=1)
    { snd_arr[local.i,1] = local.sub; snd_arr[local.i,2] = false; }
    ini_close();
    // Main
    type_var = 1;
    spd_base_var = 0.5;
    spr_spd_base_var = 1/3;
    spr_spd_var = spr_spd_base_var;
    dur_var = irandom_range(10,20);
    delay_min_var = 60;
    delay_max_var = 240;
    dmg_var = 30;
    dmg_alarm_var = 120;
    w_var = 16;
    h_var = 13;
    atk_range_var = 33.6;
    dupe_var = dupe_canon_const;
    // Hurt
    do_hurt_var = 2; // Damage
    hurt_alarm_var = 60;
    hurt_dur_var = 2;
    violence_var = 3;
    stun_var = true;
    hurt_snd_var = 1; // Axe hit
    hurt_die_var = 0; // Dont die
    // Collision
    coll_var[0] = global.mon_short_coll[0];
    coll_var[1] = global.mon_short_coll[1];
    coll_var[2] = global.mon_short_coll[2];
    // Holes
    do_hole_var = true;
    door_var = false;
    hole_var = true;
    hole_num_var = 1;
    hole_den_var = 1;
    hole_spawn_num_var = 1;
    hole_spawn_den_var = 2;
    hole_alarm_min_var = 60;
    hole_alarm_max_var = 240;
    hole_dur_var = true;
    // Body
    bod_len_var = 3;
    bod_dist_var = 8;
    bod_w_var = 16;
    bod_h_var = 13;
    bod_spr_spd_var = 1/3;
    bod_wiggle_off_var = 5;
    rotate_var = false;
    // Animation
    weird_alarm_var = 15;
    spd_anim_var = false;
    do_wiggle_var = false;
    wiggle_time_var=0;
    wiggle_mult_var=6.75; // Estimate
    wiggle_rate_var=60;
    wiggle_var = 0;
    // Theme
    mus_prio_var = theme_mus_prio_const;
    // Assets
        // Search for existing assets to save memory
    local.loaded = false;
    with object_index
    {
        if id != other.id && object_index == other.object_index
        {
            other.main_spr_var = main_spr_var;
            other.head_spr_var = head_spr_var;
            other.bod_spr_var = bod_spr_var;
            other.hole_bg_var = hole_bg_var;
            for (local.i=0; local.i<snd_len_var; local.i+=1;)
            { other.snd_arr[local.i,0] = snd_arr[local.i,0]; }
            other.loop_snd_var[1] = loop_snd_var[1];
            other.mus_snd_var = mus_snd_var;
            local.loaded = true;
            break;
        }
    }
        // If no existing assets were found, load them
    if !local.loaded
    {
        main_spr_var = sprite_add(vanilla_directory_const+"\TEX\sprites\MS2_01_spr.png",8,false,false,0,0);
        head_spr_var = execute_file(main_directory_const+"\SPR\MON\bug_head_spr.gml",main_directory_const+"\SPR\MON\bug_head_spr.png");
        bod_spr_var = sprite_add(vanilla_directory_const+"\TEX\sprites\MS2_02_spr.png",7,false,false,0,0);
        hole_bg_var = background_add(main_directory_const+"\BG\MON\bug_hole_bg.png",false,false);
        snd_arr[0,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\bug_01_snd.wav",true);
        snd_arr[1,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\bug_02_snd.wav",true);
        snd_arr[2,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\bug_03_snd.wav",true);
        snd_arr[3,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\bug_04_snd.wav",true);
        mus_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\MON\bug_mus_snd.mp3");
        loop_snd_var[1] = fmod_snd_add_scr(main_directory_const+"\SND\MON\bug_loop_snd.wav",true);
        fmod_snd_set_group_scr(mus_snd_var,snd_group_mus_const);
    }
    spr_var = main_spr_var;
    hole_tex_var = background_get_texture(hole_bg_var);
    // Behavior
    if global.bug_type_var == -1 { local.type = irandom(3); }
    else { local.type = global.bug_type_var; }
    switch local.type
    {
        case 0: // Recode
        {
            spd_base_var = 1.2;
            hurt_alarm_var = 90;
            dmg_alarm_var = 60;
            do_acc_var = true;
            acc_var = 0.1;
            frick_var = 0.05;
            do_coward_var = true;
            stun_var = false;
            do_hurt_var = 1;
            door_var = true;
            delay_min_var = 60;
            delay_max_var = 180;
            hole_alarm_min_var = 30;
            hole_alarm_max_var = 30;
            hole_spawn_den_var = 1;
            // rotate_var = true;
            bod_len_var = 10;
            do_wiggle_var = true;
            spd_anim_var = true;
            atk_range_var = global.mon_coll[2];
            // Autobrake
            autobrake_var = true;
            autobrake_spd_var = 0.5;
            autobrake_dir_var = 60;
            break;
        }
        case 2: // HD
        {
            spr_var = head_spr_var;
            dur_var = irandom_range(10,15);
            hole_num_var = 2;
            hole_den_var = 3;
            hurt_alarm_var = 90;
            dmg_alarm_var = 60;
            spd_base_var = 64/45; // 1.4r2
            do_acc_var = true;
            acc_var = 16/675; // 0.02r370
            frick_var = acc_var;
            do_coward_var = true;
            violence_var = 2;
            hurt_snd_var = 3; // Ding
            stun_var = false;
            do_hurt_var = 1;
            door_var = true;
            delay_min_var = 60;
            delay_max_var = 180;
            hole_alarm_min_var = 30;
            hole_alarm_max_var = 30;
            hole_spawn_den_var = 1;
            hole_dur_var = false;
            rotate_var = true;
            bod_len_var = 10;
            do_wiggle_var = true;
            spd_anim_var = true;
            atk_range_var = 32;
            // Autobrake (close enough)
            autobrake_var = true;
            autobrake_spd_var = 0;
            autobrake_dir_var = 60;
            break;
        }
        case 3: // Gone Rouge
        {
            do_acc_var = 2; // Classic
            bod_len_var = 7;
            dmg_alarm_var = 80;
            hurt_alarm_var = 70;
            stun_var = false;
            do_hurt_var = 1;
            do_coward_var = true;
            stun_var = false;
            spd_base_var = 1.75;
            acc_var = 0.025;
            frick_var = 0.025;
            hole_spawn_den_var = 1;
            hole_num_var = 4;
            hole_den_var = 5;
            hole_alarm_min_var = 5;
            hole_alarm_max_var = 5;
            hole_dur_var = false;
            break;
        }
    }
    alarm_len_var = 10;
    alarm_ini_scr();
    local.follow = id;
    for (local.i=0; local.i<bod_len_var; local.i+=1;)
    {
        with instance_create(0,0,bug_bod_obj)
        {
            bod_id_var = local.i;
            par_var = other.id;
            follow_var = local.follow;
            dist_var = other.bod_dist_var;
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
// Destroy Event
object_event_add
(argument0,ev_destroy,0,'
    event_inherited();
    local.bool = false;
    with object_index { if id != other.id && object_index == other.object_index { local.bool = true; break; }}
    if !local.bool
    {
        sprite_delete(main_spr_var);
        sprite_delete(head_spr_var);
        sprite_delete(bod_spr_var);
        background_delete(hole_bg_var);
        for (local.i=0; local.i<snd_len_var; local.i+=1;)
        { fmod_snd_free_scr(snd_arr[local.i,0]); }
        fmod_snd_free_scr(loop_snd_var[1]);
        fmod_snd_free_scr(mus_snd_var);
    }
    with hole_obj
    {
        if par_var == other.id
        { instance_destroy(); }
    }
    with bug_bod_obj
    {
        if par_var == other.id
        { instance_destroy(); }
    }
');
// Room End Event
object_event_add
(argument0,ev_other,ev_room_end,'
    if hole_var || !hole_dur_var { event_inherited(); }
    else { reset_alarm_scr(); }
');
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,'
    event_inherited();
    with bug_bod_obj
    {
        if par_var == other.id
        {
            on_var = false;
            x = other.x-lengthdir_x(dist_var*(bod_id_var+1),other.yaw_var);
            y = other.y-lengthdir_y(dist_var*(bod_id_var+1),other.yaw_var);
            z = other.z;
        }
    }
    if do_coward_var { coward_var = false; }
    if do_hole_var
    {
        local.hole = false;
        if global.mark_len_var > 0
        {
            for (local.i=0; local.i<global.mark_len_var; local.i+=1;)
            {
                if !global.mark_arr[local.i,3] && frac_chance_scr(hole_num_var,hole_den_var)
                {
                    with instance_create(global.mark_arr[local.i,0],global.mark_arr[local.i,1],hole_obj)
                    {
                        par_var = other.id;
                        tex_var = other.hole_tex_var;
                    }
                    global.mark_arr[local.i,3] = true;
                    local.hole = true;
                }
            }
        }
        if local.hole || instance_exists(hole_obj) || !door_var
        {
            set_alarm_scr(0,-1);
            on_var = false;
            hole_var = false;
        }
        else { hole_var = true; }
    }
');
// Movement Event
object_event_add
(argument0,ev_other,ev_user0,'
    if coward_var { spd_mult_var *= -1; }
    event_inherited();
');
// Animation
object_event_add
(argument0,ev_other,ev_user1,'
    if spd_anim_var { spr_spd_var = spr_spd_base_var*spd_var/spd_base_var; }
    event_inherited();
    if do_wiggle_var
    {
        local.rate = global.delta_time_var;
        if spd_anim_var { local.rate *= spd_var/spd_base_var; }
        wiggle_time_var = (wiggle_time_var+local.rate) mod wiggle_rate_var;
        wiggle_var = sin(2*wiggle_time_var*pi/wiggle_rate_var)*wiggle_mult_var/2;
    }
');
// Delay Alarm
object_event_add
(argument0,ev_alarm,0,'
    with bug_bod_obj
    {
        if par_var == other.id
        { on_var = true; }
    }
    if enter_var == 2
    {
        on_var = true;
        if do_snd_var
        {
            fmod_inst_stop_scr(loop_inst_var);
            if loop_snd_var[0] { loop_inst_var = fmod_snd_3d_loop_scr(loop_snd_var[1]); }
            set_alarm_scr(6,irandom_range(snd_delay_min_var,snd_delay_max_var));
        }
    }
    else { event_inherited(); }
');
// Hurt Alarm
object_event_add
(argument0,ev_alarm,3,'
    event_inherited();
    if do_acc_var > 1 { set_motion_3d_scr(0,true); }
    if stun_var { z_off_var = 0; }
');
// Determine target
object_event_add
(argument0,ev_other,ev_user6,'
    if enter_var == 2
    {
        target_var = noone;
        target_x_var = hole_x_var;
        target_y_var = hole_y_var;
        target_z_var = hole_z_var;
        target_dist_var = point_distance_3d_scr(x,y,z,target_x_var,target_y_var,target_z_var);
    }
    else { event_inherited(); }
');
// Hurt Event
object_event_add
(argument0,ev_other,ev_user4,'
    if do_coward_var
    {
        coward_var = true;
        set_alarm_scr(8,hurt_alarm_var);
        set_motion_3d_scr(0,true);
    }
    if stun_var { set_alarm_scr(9,weird_alarm_var); }
    // Play sound
    if fmod_inst_is_play_scr(snd_var) && fmod_inst_is_3d_scr(snd_var)
    { fmod_inst_stop_scr(snd_var); }
    local.snd = irandom(snd_len_var-1);
    snd_var = fmod_snd_3d_play_scr(snd_arr[local.snd,0]);
    sub_var[0] = snd_arr[local.snd,1];
    sub_var[1] = snd_arr[local.snd,2];
    set_alarm_scr(6,irandom_range(snd_delay_min_var,snd_delay_min_var));
    // Inherited
    event_inherited();
');
// Attack Success
object_event_add
(argument0,ev_other,ev_user3,'
    if do_coward_var
    {
        coward_var = true;
        set_alarm_scr(8,hurt_alarm_var);
        set_motion_3d_scr(0,true);
    }
    event_inherited();
');
// Coward Alarm
object_event_add
(argument0,ev_alarm,8,'
    coward_var = false;
');
// Weird Alarm
object_event_add
(argument0,ev_alarm,9,'
    z_off_var = -1;
');
// Hole Event
object_event_add
(argument0,ev_other,ev_user15,'
    hole_var = true;
    enter_var = 2;
    x = hole_x_var;
    y = hole_y_var;
    z = hole_z_var+32;
    set_alarm_scr(0,irandom_range(hole_alarm_min_var,hole_alarm_max_var));
    with bug_bod_obj
    {
        if par_var == other.id
        {
            on_var = false;
            x = other.x;
            y = other.y;
            z = other.z+(dist_var*(bod_id_var+1));
        }
    }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if on_var || visible_var
    {
        if rotate_var || do_wiggle_var
        {
            draw_set_color(image_blend); draw_set_alpha(image_alpha);
            d3d_transform_set_identity();
            if rotate_var
            { d3d_transform_add_rotation_y(point_direction_3d_scr(x,y,z,global.cam_x_var[view_current],global.cam_y_var[view_current],global.cam_z_var[view_current])); }
            d3d_transform_add_rotation_z(point_direction(x,y,global.cam_x_var[view_current],global.cam_y_var[view_current]));
            d3d_transform_add_translation(x+x_off_var,y+y_off_var,z+z_off_var+(h_var/2));
            d3d_draw_wall(0,(w_var/2)+wiggle_var,h_var/2,0,(-w_var/2)+wiggle_var,-h_var/2,tex_var,1,1);
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
        else { event_inherited(); }
    }
');