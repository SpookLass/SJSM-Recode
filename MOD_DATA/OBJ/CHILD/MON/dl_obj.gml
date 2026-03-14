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
    ini_open(global.lang_var);
    name_var = translate_mon_str_scr("dl",global.name_var);
    snd_arr[0,1] = ini_read_string("SUB","dl_01","SUB_dl_01"); snd_arr[0,2] = true;
    snd_arr[1,1] = ini_read_string("SUB","dl_02","SUB_dl_02"); snd_arr[1,2] = true;
    snd_arr[2,1] = ini_read_string("SUB","dl_03","SUB_dl_03"); snd_arr[2,2] = true;
    snd_arr[3,1] = ini_read_string("SUB","dl_04","SUB_dl_04"); snd_arr[3,2] = true;
    ini_close();
    // Variables
    type_var = 0;
    spd_base_var = 0.7;
    spr_spd_var = 1/6;
    dur_var = irandom_range(15,25);
    delay_var = 960/7; // 137.r142857
    dmg_var = 30;
    dmg_alarm_var = 160;
    w_var = 10;
    h_var = 24.28;
    eye_h_var = 19.2;
    z_off_var = 0;
    atk_range_var = 48;
    dead_rm_var = dl_dead_load_rm;
    // Sounds
    snd_len_var = 4;
    snd_num_var = 1;
    snd_den_var = 3;
    snd_alarm_min_var = 240;
    snd_alarm_max_var = 460;
    snd_delay_min_var = 80;
    snd_delay_max_var = 240;
    snd_dist_min_var = 0;
    snd_dist_max_var = 600;
    eff_snd_len_var = 4;
    // Theme
    mus_prio_var = theme_mus_prio_const;
    // Effect
    eff_min_var = 30;
    eff_max_var = 60;
    // Special
    open_var = false;
    open_dist_var = 48;
    close_dist_var = 48;
    do_warp_var = false;
    warp_update_var = true;
    warp_alarm_var = 60;
    warp_dist_var = 128;
    alarm_len_var = 9;
    alarm_ini_scr();
    // Remodeled
    slender_var = false;
    slender_rate_var = 0.02;
    slender_alpha_var = 0;
    slender_spd_var = 6;
    // Rogue
    rb_var = false;
    rb_dist_var = 48;
    xray_var = false;
    xray_rate_var = 0.05;
    acc_var = 0.02;
    // Assets
        // Search for existing assets to save memory
    local.loaded = false;
    with object_index
    {
        if id != other.id && object_index == other.object_index
        {
            other.close_spr_var = close_spr_var;
            other.open_spr_var = open_spr_var;
            for (local.i=0; local.i<snd_len_var; local.i+=1;)
            { other.snd_arr[local.i,0] = snd_arr[local.i,0]; }
            other.mus_snd_var = mus_snd_var;
            // Effect
            other.eff_spr_01_var = eff_spr_01_var;
            other.eff_spr_02_var = eff_spr_02_var;
            for (local.i=0; local.i<eff_snd_len_var; local.i+=1;)
            { other.eff_snd_arr[local.i] = eff_snd_arr[local.i]; }
            local.loaded = true;
            break;
        }
    }
        // If no existing assets were found, load them
    if !local.loaded
    {
        close_spr_var = sprite_add(vanilla_directory_const+"\TEX\sprites\MS7_01_spr.png",4,false,false,0,0);
        open_spr_var = sprite_add(vanilla_directory_const+"\TEX\sprites\MS7_02_spr.png",4,false,false,0,0);
        snd_arr[0,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\dl_01_snd.wav",true);
        snd_arr[1,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\dl_02_snd.wav",true);
        snd_arr[2,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\dl_03_snd.wav",true);
        snd_arr[3,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\dl_04_snd.wav",true);
        mus_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\MON\dl_mus_snd.mp3");
        fmod_snd_set_group_scr(mus_snd_var,snd_group_mus_const);
        // Effect
        eff_spr_01_var = execute_file(main_directory_const+"\SPR\MON\dl_eff_01_spr.gml",main_directory_const+"\SPR\MON\dl_eff_01_spr.png");
        eff_spr_02_var = execute_file(main_directory_const+"\SPR\MON\dl_eff_02_spr.gml",main_directory_const+"\SPR\MON\dl_eff_02_spr.png");
        eff_snd_arr[0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\dl_eff_01_snd.wav");
        eff_snd_arr[1] = fmod_snd_add_scr(main_directory_const+"\SND\MON\dl_eff_02_snd.wav");
        eff_snd_arr[2] = fmod_snd_add_scr(main_directory_const+"\SND\MON\dl_eff_03_snd.wav");
        eff_snd_arr[3] = fmod_snd_add_scr(main_directory_const+"\SND\MON\dl_eff_04_snd.wav");
        for (local.i=0; local.i<eff_snd_len_var; local.i+=1;)
        { fmod_snd_set_group_scr(eff_snd_arr[local.i],snd_group_mon_const); }
    }
    spr_var = close_spr_var;
    // Behavior
    if global.dl_type_var == -1 { local.type = irandom(5); }
    else { local.type = global.dl_type_var; }
    local.set = false;
    switch local.type
    {
        case 0: // Recode
        {
            type_var = 2;
            dmg_alarm_var = 120;
            do_warp_var = true;
            delay_var = 60;
            atk_range_var = global.mon_coll[2];
            // Effect
            eff_min_var = 15;
            eff_max_var = 30;
            // Axe
            do_hurt_var = 1;
            hurt_snd_var = 1;
            hurt_alarm_var = 30;
            stun_var = 1;
            violence_var = 3;
            break;
        }
        case 3: // Old HD
        {
            delay_min_var = 90;
            delay_max_var = 180;
            warp_dist_var = 160;
            local.set = true;
        }
        case 2: // HD
        {
            type_var = 2;
            do_warp_var = true;
            spd_base_var = 32/45; // 0.7r1
            dur_var = irandom_range(10,20);
            dmg_alarm_var = 180;
            if !local.set
            {
                delay_min_var = 60;
                delay_max_var = 120;
            }
            atk_range_var = 32;
            // Cloak
            close_dist_var = 96;
            open_dist_var = 224/3; // 74.r6
            // Sound
            snd_alarm_min_var = 360;
            snd_alarm_max_var = 720;
            snd_delay_min_var = 60;
            snd_delay_max_var = 180;
            snd_den_var = 1;
            snd_dist_max_var = 500;
            break;
        }
        case 4: // Gone Rogue
        {
            // Rubberband
            spd_min_var = 0.1;
            rb_var = true;
            // Silhouette
            xray_var = true;
            sil_var = true;
            sil_type_var = 2; // Color
            sil_color_var = c_red;
            sil_alpha_var = 0;
            sil_dist_var = 0.1;
            break;
        }
        case 5: // Remodeled
        {
            spd_min_var = 0.1;
            acc_var = 1/60; // 0.01r6
            slender_var = true;
            do_seen_var = true;
            seen_yaw_var = 30;
            seen_pitch_var = 0;
            seen_dist_var = 0;
            seen_type_var = 0;
            break;
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
        sprite_delete(open_spr_var);
        sprite_delete(close_spr_var);
        fmod_snd_free_scr(mus_snd_var);
        for (local.i=0; local.i<snd_len_var; local.i+=1;)
        { fmod_snd_free_scr(snd_arr[local.i,0]); }
        sprite_delete(eff_spr_01_var);
        sprite_delete(eff_spr_02_var);
        for (local.i=0; local.i<eff_snd_len_var; local.i+=1;)
        { fmod_snd_free_scr(eff_snd_arr[local.i]); }
    }
    with spr_flash_eff_obj { if par_var = other.id { instance_destroy(); }}
    with dl_eff_obj { if par_var = other.id { instance_destroy(); }}
');
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,'
    if !instance_exists(dl_eff_obj)
    {
        with instance_create(0,0,dl_eff_obj)
        {
            par_var = other.id;
            slender_var = other.slender_var;
        }
    }
    else if slender_var { with dl_eff_obj { slender_var = true; }}
    warp_var = false;
    if rb_var || slender_var { spd_base_var = spd_min_var; }
    if slender_var { slender_alpha_var = 0; }
    if xray_var { sil_alpha_var = 0; }
    event_inherited();
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    if on_var
    {
        // Open sprite
        if instance_exists(target_var)
        {
            if open_var { if target_dist_var >= close_dist_var { open_var = false; }}
            else if target_dist_var < open_dist_var { open_var = true; }
        }
        else { open_var = false; }
        if warp_var || open_var
        { spr_var = open_spr_var; }
        else { spr_var = close_spr_var; }
        // Slender
        if slender_var
        {
            if is_seen_var { slender_alpha_var += slender_rate_var*global.delta_time_var; }
            else { slender_alpha_var -= slender_rate_var*global.delta_time_var; }
            slender_alpha_var = median(0,1,slender_alpha_var);
        }
        // X-ray
        if xray_var
        {
            sight_type_var = 0;
            event_user(8);
            if target_visible_var { sil_alpha_var -= xray_rate_var*global.delta_time_var; }
            else { sil_alpha_var += xray_rate_var*global.delta_time_var; }
            sil_alpha_var = median(0,1,sil_alpha_var);
        }
    }
');
// Movement Event
object_event_add
(argument0,ev_other,ev_user0,'
    if rb_var
    {
        spd_base_var = median(spd_min_var,target_dist_var/rb_dist_var,spd_base_var+(acc_var*global.delta_time_var));
    }
    else if slender_var
    {
        if slender_alpha_var >= 1 { spd_base_var = slender_spd_var; }
        else if is_seen_var { spd_base_var = 0; }
        else { spd_base_var += acc_var*global.delta_time_var; }
    }
    if do_warp_var && !enter_var
    {
        if warp_var
        {
            local.per = alarm_arr[8,0]/alarm_arr[8,1];
            x = lerp_scr(warp_x_var,start_x_var,local.per);
            y = lerp_scr(warp_y_var,start_y_var,local.per);
            z = lerp_scr(warp_z_var,start_z_var,local.per);
            if warp_update_var && instance_exists(target_var)
            {
                event_user(15);
                if temp_var == -1
                {
                    if !check_coll_scr(-1,0,0,0,x,y,z)
                    {
                        warp_var = false;
                        do_coll_var = true;
                        set_alarm_scr(8,-1);
                    }
                }
                temp_var = false;
            }
        }
        else 
        {
            if possess_var
            { local.bool = (global.input_press_arr[confirm_input_const,player_id_var] && target_dist_var > 0); }
            else
            {
                if type_var > 0 { local.dist = max(target_dist_var,path_get_length(path_var)); }
                else { local.dist = target_dist_var; } 
                local.bool = (local.dist >= warp_dist_var && local.dist > 0)
            }
            if local.bool
            {
                start_x_var = x;
                start_y_var = y;
                start_z_var = z;
                event_user(15);
                if temp_var == true
                {
                    warp_var = true;
                    do_coll_var = false;
                    set_alarm_scr(8,warp_alarm_var);
                    temp_var = false;
                }
            }
            if !warp_var { event_inherited(); }
        }
    }
    else { event_inherited(); }
');
// Warp Event
object_event_add
(argument0,ev_other,ev_user15,'
    /*local.xvec = (x-target_x_var)/target_dist_var;
    local.yvec = (y-target_y_var)/target_dist_var;
    local.zvec = (z-target_z_var)/target_dist_var;*/
    temp_var = -1;
    local.dist_2d = point_distance(start_x_var,start_y_var,target_x_var,target_y_var);
    if local.dist_2d > 0 && instance_exists(target_var) // Still not sure whats causing this
    {
        local.xvec = (start_x_var-target_x_var)/local.dist_2d;
        local.yvec = (start_y_var-target_y_var)/local.dist_2d;
        local.zvec = 0;
        // Calculate warp
        local.dist = check_ray_scr(target_x_var,target_y_var,target_z_var+(target_var.coll_var[1]*0.5),local.xvec,local.yvec,local.zvec);
        local.dir = point_direction(target_x_var,target_y_var,start_x_var,start_y_var);
        local.xtmp = target_x_var+lengthdir_x(local.dist-coll_var[2],local.dir);
        local.ytmp = target_y_var+lengthdir_y(local.dist-coll_var[2],local.dir);
        local.ztmp = target_z_var;
        if target_dist_var > local.dist
        {
            if !check_coll_scr(-1,0,0,0,local.xtmp,local.ytmp,local.ztmp)
            {
                warp_x_var = local.xtmp;
                warp_y_var = local.ytmp;
                warp_z_var = local.ztmp;
                temp_var = true;
            }
            else { temp_var = false; }
        }
    }
');
// Warp alarm
object_event_add
(argument0,ev_alarm,8,'
    warp_var = false;
    do_coll_var = true;
    x = warp_x_var;
    y = warp_y_var;
    z = warp_z_var;
');
// Hurt Event
object_event_add
(argument0,ev_other,ev_user4,'
    if !enter_var
    {
        event_inherited();
        if stun_var
        {
            if warp_var { alarm_arr[8,0] += hurt_alarm_var; }
            else if stun_var == 2
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
    }
');
// Attack Success
object_event_add
(argument0,ev_other,ev_user3,'
    event_inherited();
    with instance_create(0,0,spr_flash_eff_obj)
    {
        par_var = other.id;
        if !irandom(1) { spr_var = other.eff_spr_01_var; }
        else { spr_var = other.eff_spr_02_var; }
        spr_id_var = irandom(sprite_get_number(spr_var)-1);
        spr_spd_var = 1;
        do_snd_var = true;
        snd_var = fmod_snd_play_scr(other.eff_snd_arr[irandom(other.eff_snd_len_var-1)]);
        rand_rate_var = 15;
        set_alarm_scr(0,min(other.dmg_alarm_var*0.5,irandom_range(other.eff_min_var,other.eff_max_var)));
        // Set camera to player
        cam_id_var = other.atk_target_var.cam_id_var;
    }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if warp_var
    {
        d3d_set_hidden(false);
        d3d_set_fog(true,c_red,0,128);
        event_inherited();
        d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var);
        d3d_set_hidden(true);
    }
    else { event_inherited(); }
');