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
            name_var = ini_read_string('NAME','killer_og','NAME_killer_og');
            break;
        }
        case name_hd_const:
        case name_fanon_const:
        {
            name_var = ini_read_string('NAME','killer_hd','NAME_killer_hd');
            break;
        }
        case name_num_og_const:
        case name_num_hd_const:
        {
            name_var = ini_read_string('NAME','killer_num','NAME_killer_num');
            break;
        }
    }
    ini_close();
    type_var = 1;
    spd_base_var = 1/3; // 0.r3
    dur_var = irandom_range(15,30);
    delay_var = 117;
    dmg_var = 45;
    dmg_alarm_var = 30;
    h_var = 22;
    // Sounds
    snd_len_var = 4;
    snd_num_var = 1;
    snd_den_var = 2;
    snd_alarm_min_var = 80;
    snd_alarm_max_var = 240;
    snd_dist_var = 600;
    // Killer is SO ANNOYING
    do_turn_var = !global.mem_save_var;
    // Search for existing assets to save memory
    with object_index
    {
        if id != other.id
        {
            
            other.spr_arr_var[0,0] = spr_arr_var[0,0];
            other.spr_arr_var[8,0] = spr_arr_var[8,0];
            if other.do_turn_var
            {
                other.spr_arr_var[1,0] = spr_arr_var[1,0];
                other.spr_arr_var[2,0] = spr_arr_var[2,0];
                other.spr_arr_var[3,0] = spr_arr_var[3,0];
                other.spr_arr_var[4,0] = spr_arr_var[4,0];
                other.spr_arr_var[5,0] = spr_arr_var[5,0];
                other.spr_arr_var[6,0] = spr_arr_var[6,0];
                other.spr_arr_var[7,0] = spr_arr_var[7,0];
                other.spr_arr_var[9,0] = spr_arr_var[9,0];
                other.spr_arr_var[10,0] = spr_arr_var[10,0];
                other.spr_arr_var[11,0] = spr_arr_var[11,0];
                other.spr_arr_var[12,0] = spr_arr_var[12,0];
                other.spr_arr_var[13,0] = spr_arr_var[13,0];
                other.spr_arr_var[14,0] = spr_arr_var[14,0];
                other.spr_arr_var[15,0] = spr_arr_var[15,0];
            }
            for (local.i=0; local.i<snd_len_var; local.i+=1;)
            { other.snd_arr[local.i,0] = snd_arr[local.i,0]; }
            local.loaded = true;
            break;
        }
    }
    // If no existing assets were found, load them
    if !local.loaded
    {
        spr_arr_var[0,0] = sprite_add(vanilla_directory_const+'\TEX\sprites\MS10_05_spr.png',15,false,false,0,0);
        spr_arr_var[0,1] = 7.5;
        spr_arr_var[0,2] = 6.3;
        spr_arr_var[8,0] = sprite_add(main_directory_const+'\SPR\MON\killer_sprint_01_spr.png',15,false,false,0,0);
        spr_arr_var[8,1] = 11;
        spr_arr_var[8,2] = 11;
        if do_turn_var
        {
            spr_arr_var[1,0] = sprite_add(vanilla_directory_const+'\TEX\sprites\MS10_06_spr.png',15,false,false,0,0);
            spr_arr_var[1,1] = 9;
            spr_arr_var[1,2] = 7.2;
            spr_arr_var[2,0] = sprite_add(vanilla_directory_const+'\TEX\sprites\MS10_07_spr.png',15,false,false,0,0);
            spr_arr_var[2,1] = 10.7;
            spr_arr_var[2,2] = 7.8;
            spr_arr_var[3,0] = sprite_add(vanilla_directory_const+'\TEX\sprites\MS10_08_spr.png',15,false,false,0,0);
            spr_arr_var[3,1] = 9;
            spr_arr_var[3,2] = 6;
            spr_arr_var[4,0] = sprite_add(vanilla_directory_const+'\TEX\sprites\MS10_01_spr.png',15,false,false,0,0);
            spr_arr_var[4,1] = 6.3;
            spr_arr_var[4,2] = 9;
            spr_arr_var[5,0] = sprite_add(vanilla_directory_const+'\TEX\sprites\MS10_02_spr.png',15,false,false,0,0);
            spr_arr_var[5,1] = 6.6;
            spr_arr_var[5,2] = 9.6;
            spr_arr_var[6,0] = sprite_add(vanilla_directory_const+'\TEX\sprites\MS10_03_spr.png',15,false,false,0,0);
            spr_arr_var[6,1] = 7.5;
            spr_arr_var[6,2] = 10.4;
            spr_arr_var[7,0] = sprite_add(vanilla_directory_const+'\TEX\sprites\MS10_04_spr.png',15,false,false,0,0);
            spr_arr_var[7,1] = 7.2;
            spr_arr_var[7,2] = 7.2;
            spr_arr_var[9,0] = sprite_add(main_directory_const+'\SPR\MON\killer_sprint_02_spr.png',15,false,false,0,0);
            spr_arr_var[9,1] = 11;
            spr_arr_var[9,2] = 11;
            spr_arr_var[10,0] = sprite_add(main_directory_const+'\SPR\MON\killer_sprint_03_spr.png',15,false,false,0,0);
            spr_arr_var[10,1] = 11;
            spr_arr_var[10,2] = 11;
            spr_arr_var[11,0] = sprite_add(main_directory_const+'\SPR\MON\killer_sprint_04_spr.png',15,false,false,0,0);
            spr_arr_var[11,1] = 11;
            spr_arr_var[11,2] = 11;
            spr_arr_var[12,0] = sprite_add(main_directory_const+'\SPR\MON\killer_sprint_05_spr.png',15,false,false,0,0);
            spr_arr_var[12,1] = 11;
            spr_arr_var[12,2] = 11;
            spr_arr_var[13,0] = sprite_add(main_directory_const+'\SPR\MON\killer_sprint_06_spr.png',15,false,false,0,0);
            spr_arr_var[13,1] = 11;
            spr_arr_var[13,2] = 11;
            spr_arr_var[14,0] = sprite_add(main_directory_const+'\SPR\MON\killer_sprint_07_spr.png',15,false,false,0,0);
            spr_arr_var[14,1] = 11;
            spr_arr_var[14,2] = 11;
            spr_arr_var[15,0] = sprite_add(main_directory_const+'\SPR\MON\killer_sprint_08_spr.png',15,false,false,0,0);
            spr_arr_var[15,1] = 11;
            spr_arr_var[15,2] = 11;
        }
        snd_arr[0,0] = fmod_snd_add_scr(main_directory_const+'\SND\MON\ringu_01_snd.ogg',true);
        snd_arr[1,0] = fmod_snd_add_scr(main_directory_const+'\SND\MON\ringu_02_snd.ogg',true);
        snd_arr[2,0] = fmod_snd_add_scr(main_directory_const+'\SND\MON\ringu_03_snd.ogg',true);
        snd_arr[3,0] = fmod_snd_add_scr(main_directory_const+'\SND\MON\ringu_04_snd.ogg',true);
    }
    spr_var = spr_arr_var[0,0];
    w_01_var = spr_arr_var[0,1];
    w_02_var = spr_arr_var[0,2];
    w_var = w_01_var+w_02_var;
    // Stamina
    do_sprint_var = false;
    sprint_var = false;
    do_stam_var = false;
    stam_max_var = 100;
    stam_rate_var = 1/3;
    stam_drain_var = 1.25;
    stam_spawn_min_var = 0;
    stam_spawn_max_var = 75;
    stam_per_var = false;
    sprint_mult_var = 5;
    sprint_acc_var = 8/135;  // 0.0r592
    acc_base_var = 4/225; // 0.01r7
    // Sprint animation
    spr_spd_base_var = 1/6;
    sprint_spr_spd_var = 5/6; // Don't look at me, stealing this from Gone Rouge
    h_base_var = 22;
    sprint_h_var = 25;
    z_off_base_var = 0;
    sprint_z_off_var = -1;
    // Behavior
    if global.killer_type_var == -1 { local.type = irandom(2); }
    else { local.type = global.killer_type_var; }
    switch local.type
    {
        case 6: // Recode
        {
            do_sprint_var = true;
            do_stam_var = true;
            dmg_var = 30;
            break;
        }
        case 2: // HD
        {
            do_sprint_var = true;
            do_stam_var = true;
            spd_base_var = 16/45; // 0.3r5
            dur_var = irandom_range(10,15);
            dmg_alarm_var = 90;
            delay_min_var = 90;
            delay_max_var = 180;
            do_acc_var = true;
            // Autobrake (close enough)
            autobrake_var = true;
            autobrake_spd_var = 0;
            autobrake_dir_var = 60;
            break;
        }
        case 3: // Old HD
        {
            do_sprint_var = true;
            do_stam_var = true;
            dmg_alarm_var = 90;
            delay_min_var = 90;
            delay_max_var = 180;
            do_acc_var = true;
            // Weird
            spd_base_var = 4/15; // 0.2r6
            sprint_mult_var = 8;
            stam_drain_var = stam_rate_var;
            sprint_acc_var = 16/225;  // 0.07r1
            acc_base_var = 11/675; // 0.01r629
            // Autobrake (close enough)
            autobrake_var = true;
            autobrake_spd_var = 0;
            autobrake_dir_var = 60;
            break;
        }
        case 4: // Remodeled
        {
            do_sprint_var = true;
            do_stam_var = true;
            sprint_mult_var = 9;
            stam_rate_var = 1/6;
            stam_drain_var = 0.5;
            stam_per_var = true;
            break;
        }
        case 5: // Gone Rouge
        {
            do_sprint_var = true;
            do_stam_var = true;
            stam_rate_var = 5/12;
            stam_drain_var = 0.5;
            spr_spd_base_var = 0.2;
            sprint_spr_spd_var = 1;
            spd_base_var = 0.5;
            sprint_acc_var = -1;
            stam_spawn_max_var = 0;
            // Acceleration
            do_acc_var = true;
            acc_var = 0.1;
            frick_var = 0.05;
            // Autobrake (close enough)
            autobrake_var = true;
            autobrake_spd_var = 0;
            autobrake_dir_var = 60;
            break;
        }
        case 0: // Scary!!!
        {
            spd_base_var = 8;
            scary_var = true;
            dmg_var = 30;
            dmg_stun_var = 30;
            do_hurt_var = true;
            stun_var = true;
            hurt_alarm_var = 30;
            spr_spd_base_var = 1;
            break;
        }
    }
    if sprint_acc_var
    {
        acc_var = acc_base_var;
        frick_var = acc_base_var;
    }
    spr_spd_var = spr_spd_base_var;
    z_off_var = z_off_base_var;
    h_var = h_base_var;
");
// Destroy Event
object_event_add
(argument0,ev_destroy,0,"
    event_inherited();
    if instance_number(object_index) <= 1
    {
        if do_turn_var
        {
            for (local.i=0; local.i<16; local.i+=1;)
            { sprite_delete(spr_arr_var[local.i,0]); }
        }
        else
        {
            sprite_delete(spr_arr_var[0,0]);
            sprite_delete(spr_arr_var[8,0]);
        }
    }
");
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,"
    if scary_var
    {
        if player_obj.rm_clear_time_var == -1
        {
            delay_min_var = 3600+(delay_var*instance_number(mon_par_obj));
            delay_max_var = delay_min_var;
        }
        else
        {
            delay_min_var = player_obj.rm_clear_time_var+(delay_var*instance_number(mon_par_obj));
            delay_max_var = delay_min_var;
        }
    }
    event_inherited();
    if do_stam_var
    {
        if !stam_per_var
        {
            stam_var = random_range(stam_spawn_min_var,stam_spawn_max_var);
            sprint_var = false;
            
            spr_spd_var = spr_spd_base_var;
            h_var = h_base_var;
            z_off_var = z_off_base_var;
            if sprint_acc_var > 0 
            {
                acc_var = acc_base_var;
                frick_var = acc_base_var;
            }
        }
    }
    else if do_sprint_var
    {
        stam_var = stam_max_var;
        sprint_var = true;
        spd_mult_var *= sprint_mult_var;
        spr_spd_var = sprint_spr_spd_var;
        h_var = sprint_h_var;
        z_off_var = sprint_z_off_var;
        if sprint_acc_var > 0 
        {
            acc_var = sprint_acc_var;
            frick_var = sprint_acc_var;
        }
    }      
");
// Movement
object_event_add
(argument0,ev_other,ev_user0,"
    if do_sprint_var
    {
        if sprint_var
        {
            if do_stam_var { stam_var -= stam_drain_var*global.delta_time_var; }
            if stam_var <= 0
            {
                stam_var = 0;
                sprint_var = false;
                spr_spd_var = spr_spd_base_var;
                h_var = h_base_var;
                z_off_var = z_off_base_var;
                if sprint_acc_var > 0 
                {
                    acc_var = acc_base_var;
                    frick_var = acc_base_var;
                }
            }
            else { spd_mult_var *= sprint_mult_var; }
        }
        else
        {
            if do_stam_var { stam_var += stam_rate_var*global.delta_time_var; }
            if stam_var >= stam_max_var || !do_stam_var
            {
                stam_var = stam_max_var;
                sprint_var = true;
                spd_mult_var *= sprint_mult_var;
                spr_spd_var = sprint_spr_spd_var;
                h_var = sprint_h_var;
                z_off_var = sprint_z_off_var;
                if sprint_acc_var > 0 
                {
                    acc_var = sprint_acc_var;
                    frick_var = sprint_acc_var;
                }
            }
        }
    }
    event_inherited();
");
// Attack Success
object_event_add
(argument0,ev_other,ev_user3,"
    event_inherited();
    if dmg_stun_var > 0
    {
        set_motion_3d_scr(0,true);
        move_var = false;
        anim_var = false;
        attack_var = false;
        set_alarm_scr(1,dmg_stun_var);
        set_alarm_scr(2,dmg_stun_var);
        set_alarm_scr(4,dmg_stun_var);
    }
");
// Draw
object_event_add
(argument0,ev_draw,0,"
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
            // Array
            local.dir = point_direction(x,y,global.cam_x_var[view_current],global.cam_y_var[view_current])
            if do_turn_var { local.dir_id = mod_scr(round((yaw_var-local.dir)/45),8); }
            else { local.dir_id = 0; }
            if sprint_var { local.dir_id += 8; }
            spr_var = spr_arr_var[local.dir_id,0];
            w_01_var = spr_arr_var[local.dir_id,1];
            w_02_var = spr_arr_var[local.dir_id,2];
            tex_var = sprite_get_texture(spr_var,floor(spr_id_var));
            // Draw
            d3d_transform_add_rotation_z(local.dir);
            d3d_transform_add_translation(x+x_off_var,y+y_off_var,z+z_off_var);
            d3d_draw_wall(0,w_01_var,h_var,0,-w_02_var,0,tex_var,1,1);
        }
        d3d_transform_set_identity();
        draw_set_color(c_white); draw_set_alpha(1);
        if global.debug_var
        {
            d3d_set_hidden(false);
            if path_exists(path_var)
            { draw_path(path_var,x,y,false); }
            d3d_set_hidden(true);
            // mp_grid_draw(grid_var);
        }
    }
");