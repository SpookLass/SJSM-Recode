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
    switch global.name_var
    {
        case name_og_const:
        case name_hd_const:
        case name_fanon_const:
        case name_num_og_const:
        {
            name_var = ini_read_string("NAME","wf","NAME_wf");
            break;
        }
        case name_num_hd_const:
        {
            name_var = ini_read_string("NAME","wf_num","NAME_wf_num");
            break;
        }
    }
    loop_snd_var[2] = string_replace(ini_read_string("SUB","wf","SUB_wf"),"@n",name_var);
    ini_close();
    type_var = 0;
    spr_spd_var = 1;
    dur_var = 40;
    delay_var = 640/9; // 71.r1
    dmg_var = 30;
    dmg_alarm_var = 90;
    w_var = 3;
    h_var = 4.1;
    z_off_base_var = 14;
    z_off_var = 14;
    // Sounds
    do_snd_var = 1; // At least for now
    loop_snd_var[0] = true;
    loop_snd_dist_max_var = 600;
    glitch_snd_len_var = 4;
    // Assets
        // Search for existing assets to save memory
    with object_index
    {
        if id != other.id && object_index == other.object_index
        {
            other.spr_var = spr_var;
            other.bg_var = bg_var;
            other.tex_spr_var = tex_spr_var;
            other.door_bg_var = door_bg_var;
            other.light_wall_spr_var = light_wall_spr_var;
            other.light_floor_spr_var = light_floor_spr_var;
            other.eff_spr_var = eff_spr_var;
            other.web_bg_var = web_bg_var;
            other.web_mdl_var = web_mdl_var;
            other.zone_list_var = zone_list_var;
            other.loop_snd_var[1] = loop_snd_var[1];
            other.wake_snd_var[1] = wake_snd_var[1];
            for (local.i=0; local.i<glitch_snd_len_var; local.i+=1;)
            { other.glitch_snd_arr[local.i,0] = glitch_snd_arr[local.i,0]; }
            local.loaded = true;
            break;
        }
    }
        // If no existing assets were found, load them
    if !local.loaded
    {
        spr_var = sprite_add(vanilla_directory_const+"\TEX\sprites\MS28_01_spr.png",8,false,false,0,0);
        bg_var = background_add(vanilla_directory_const+"\TEX\sprites\MS28_02_spr.png",false,false);
        tex_spr_var = sprite_add(vanilla_directory_const+"\TEX\sprites\MS28_03_spr.png",3,false,false,0,0);
        door_bg_var = background_add(vanilla_directory_const+"\TEX\sprites\MS28_04_spr.png",false,false);
        light_wall_spr_var = sprite_add(main_directory_const+"\SPR\MON\wf_light_wall_spr.png",2,false,false,0,0);
        light_floor_spr_var = sprite_add(main_directory_const+"\SPR\MON\wf_light_floor_spr.png",2,false,false,0,0);
        eff_spr_var = sprite_add(main_directory_const+"\SPR\DEAD\killer_static_02_spr.png",6,false,false,0,0);
        web_bg_var = background_add(vanilla_directory_const+"\TEX\sprites\MS28_05_spr.png",false,false);
        web_mdl_var = d3d_model_create();
        d3d_model_load(web_mdl_var,main_directory_const+"\MDL\MON\wf_web_mdl.gmmod");
        zone_list_var = ds_list_create();
        ds_list_clear(zone_list_var);
        ds_list_add(zone_list_var,long_hall_01_rm);
        ds_list_add(zone_list_var,long_hall_02_rm);
        ds_list_add(zone_list_var,long_hall_04_rm);
        ds_list_add(zone_list_var,long_hall_05_ungold_rm);
        ds_list_add(zone_list_var,long_hall_07_rm);
        ds_list_add(zone_list_var,long_hall_08_rm);
        ds_list_add(zone_list_var,long_hall_10_rm);
        ds_list_add(zone_list_var,long_hall_11_rm);
        wake_snd_var[0] = true;
        wake_snd_var[1] = fmod_snd_add_scr(main_directory_const+"\SND\MON\wf_wake_snd.mp3");
        loop_snd_var[1] = fmod_snd_add_scr(main_directory_const+"\SND\MON\wf_snd.wav",true);
        glitch_snd_arr[0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\glitch_01_snd.wav");
        glitch_snd_arr[1] = fmod_snd_add_scr(main_directory_const+"\SND\MON\glitch_02_snd.wav");
        glitch_snd_arr[2] = fmod_snd_add_scr(main_directory_const+"\SND\MON\glitch_03_snd.wav");
        glitch_snd_arr[3] = fmod_snd_add_scr(main_directory_const+"\SND\MON\glitch_04_snd.wav");
        for (local.i=0; local.i<glitch_snd_len_var; local.i+=1;)
        { fmod_snd_set_group_scr(glitch_snd_arr[local.i,0],snd_group_mon_const); }
    }
    tex_02_var = background_get_texture(bg_var);
    web_tex_var = background_get_texture(web_bg_var);
    // White Face Specific
    vis_num_var = 2;
    vis_den_var = 3;
    // Seen Stuff
    do_seen_var = true;
    seen_delay_min_var = 3;
    seen_delay_max_var = 15;
    seen_yaw_var = 30;
    seen_flash_var = true;
    seen_dist_var = -1;
    // Teleport
    tp_spawn_var = 2;
    tp_spawn_chance_var = 3;
    tp_spd_var = 30;
    tp_chance_var = 4;
    tp_seen_delay_var = 60;
    tp_dist_min_var = 160;
    tp_dist_max_var = 400;
    tp_dist_var = 400;
    tp_type_var = 0;
    // Effect
    flash_chance_var = 4;
    eff_01_alarm_var = 6;
    eff_02_alarm_var = 20;
    eff_03_alarm_min_var = 6;
    eff_03_alarm_max_var = 40;
    res_var = (global.player_len_var <= 1);
    res_w_var = 640;
    res_h_var = 360;
    no_fun_var = true;
    // Movement
    spd_base_real_var = 0.9;
    spd_delay_min_var = 1;
    spd_delay_max_var = 6;
    seen_acc_var = 100/6; // 16.r6 GOOD GOD
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
    do_fog_var = true;
    start_var = 6;
    zone_start_var = 25;
    web_start_var = 22;
    loop_var = true;
    attack_stun_var = true;
    exit_spawn_var = true;
    color_prio_var = 1;
    fog_prio_var = 1;
    reflect_var= -1;
    // Behavior
    if global.wf_type_var == -1 { local.type = irandom(8); }
    else { local.type = global.wf_type_var; }
    switch local.type
    {
        
        case 7: // Mayas Idea
        {
            move_type_var = 1;
            local.maya = true;
        }
        case 6: // Lass Idea
        {
            if !local.maya { seen_dist_var = 160; }
        }
        case 0: // Recode
        {
            seen_yaw_var = 5.856;
            seen_pitch_var = 5.856;
            dur_var = 30;
            start_var = -1;
            web_start_var = 15;
            // zone_start_var = -1;
            exit_spawn_var = false;
            tp_spawn_var = 1;
            tp_type_var = 1; // Check sight
            // Draw
            w_var = 9;
            h_var = 12.3;
            z_off_base_var = 10;
            // Smaller Resolution
            res_w_var = 640;
            res_h_var = 480;
            // Dist
            snd_dist_max_var = 600;
            break;
        }
        case 4: // Old HD
        {
            dmg_var = 60;
            dmg_alarm_var = 180;
            local.setdmg = true;
        }
        case 2: // HD
        {
            if !local.setdmg
            {
                dmg_var = 30;
                dmg_alarm_var = 60;
            }
            delay_min_var = 90;
            delay_max_var = 180;
            spr_spd_var = 1/6; // 0.1r6 I think
            move_type_var = 2;
            do_fog_var = false;
            web_start_var = 0;
            // Teleport
            tp_dist_min_var = 320/3; // 106.r6
            tp_dist_max_var = 2560/3; // 853.r3
            tp_dist_var = 1184/3; // 394.r6
            tp_spd_var = 16/15; // 1.0r6
            tp_chance_var = 1;
            // Seen
            seen_acc_var = 2/45; // 0.0r4
            seen_yaw_var = 60;
            seen_spd_chance_var = 4;
            // Animation
            anim_off_var = 16/15;
            seen_anim_var = true;
            anim_type_var = 0;
            // Effects
            eff_02_alarm_var = 12;
            face_dist_var = 0;
            // Dont set stuff
            loop_var = false;
            res_var = false;
            attack_stun_var = false;
            // Teleport delay
            tp_spawn_var = 3;
            exit_spawn_var = 2;
            // Estimates
            w_var = 8;
            h_var = 11;
            z_off_base_var = 12;
            break;
        }
        case 3: // OBJ
        {
            tp_dist_var = -1;
            spd_base_real_var = 1.7;
            seen_acc_var = -0.05;
            spd_min_var = 0.7;
            seen_flash_var = 2;
            do_seen_agg_var = true;
            flash_agg_var = 350;
            tp_agg_var = 400;
            spd_agg_var = 500;
            flash_chance_var = 8;
            spd_delay_min_var = 6;
            spd_delay_max_var = 6;
            tp_dist_min_var = 260;
            break;
        }
        case 5: // Imscared
        {
            // Remove EVERYTHING from SJSM White Face
            tp_spawn_var = false;
            exit_spawn_var = false;
            tp_dist_var = -1;
            do_seen_var = false;
            tp_dist_min_var = 500;
            tp_dist_max_var = 500;
            spd_base_real_var = 1.5;
            do_anim_var = -1;
            face_dist_var = 0;
            attack_stun_var = false;
            zone_start_var = -1;
            start_var = -1;
            web_start_var = -1;
            do_fog_var = false;
            // Smaller Resolution
            res_w_var = 180;
            res_h_var = 180;
            // Special Imscared stuff
            tp_type_var = 2;
            delay_var = 500;
            tp_alarm_var = 400;
            vanish_alarm_var = 1000;
            dmg_var = 100;
            // Draw
            w_var = 10; // 16 x 40 / 64
            h_var = 10.3125; // 12 x 55 / 64
            z_off_base_var = 16;
            tex_var = sprite_get_texture(spr_var,0);
            break;
        }
        case 8: // Imscared Recode
        {
            // Recode
            dur_var = 30;
            start_var = -1;
            web_start_var = 15;
            zone_start_var = -1;
            res_w_var = 640;
            res_h_var = 480;
            // Remove some stuff from SJSM White Face
            tp_spawn_var = false;
            exit_spawn_var = false;
            tp_dist_var = -1;
            do_seen_var = false;
            attack_stun_var = false;
            // Special Imscared stuff
            delay_var = 60;
            tp_alarm_var = 120;
            vanish_alarm_var = 600;
            // Draw
            w_var = 9;
            h_var = 12.3;
            z_off_base_var = 10;
            tex_var = sprite_get_texture(spr_var,0);
            break;
        }
    }
    spd_base_var = spd_base_real_var;
    alarm_len_var = 11;
');
// Destroy Event
object_event_add
(argument0,ev_destroy,0,'
    event_inherited();
    global.wall_bg_tex = background_get_texture(global.wall_bg);
    global.floor_bg_tex = background_get_texture(global.floor_bg);
    global.ceil_bg_tex = background_get_texture(global.ceil_bg);
    global.light_wall_obj_spr = global.light_wall_spr;
    global.light_floor_obj_spr = global.light_floor_spr;
    with object_index { if id != other.id && object_index == other.object_index { local.bool = true; break; }}
    if !local.bool
    {
        sprite_delete(spr_var);
        background_delete(bg_var);
        sprite_delete(tex_spr_var);
        sprite_delete(light_wall_spr_var);
        sprite_delete(light_floor_spr_var);
        background_delete(door_bg_var);
        sprite_delete(eff_spr_var);
        background_delete(web_bg_var);
        d3d_model_destroy(web_mdl_var);
        ds_list_destroy(zone_list_var);
        for (local.i=0; local.i<glitch_snd_len_var; local.i+=1;)
        { fmod_snd_free_scr(glitch_snd_arr[local.i,0]); }
        fmod_snd_free_scr(loop_snd_var[1]);
        fmod_snd_free_scr(wake_snd_var[1]);
        if no_fun_var { global.js_override_var = false; }
        if res_var
        {
            global.res_override_var = false;
            global.res_override_w_var = global.res_w_var;
            global.res_override_h_var = global.res_h_var;
        }
    }
    if zone_start_var > 0
    { zone_from_num_scr(global.zone_num_var); }
    with wf_eff_obj
    { if par_var == other.id { instance_destroy(); }}
');
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,'
    event_inherited();
    // Reset
    spd_base_var = spd_base_real_var;
    if do_seen_agg_var { seen_agg_var = 0; }
    // Spawn
    if start_var <= 0 || dur_start_var-dur_var >= start_var
    {
        visible = true;
        if exit_spawn_var && !irandom(5)
        {
            // Reset Position
            if global.unlock_var > 0 { local.spawn = global.unlock_var; }
            else { local.spawn = irandom_range(1,global.spawn_len_var-1); }
            yaw_var = global.spawn_arr[local.spawn,3];
            x = global.spawn_arr[local.spawn,0]-lengthdir_x(32,yaw_var);
            y = global.spawn_arr[local.spawn,1]-lengthdir_y(32,yaw_var);
            z = global.spawn_arr[local.spawn,2];
            set_motion_3d_scr(0,true,yaw_var,true,0,true);
            if exit_spawn_var != 2
            {
                // Reset
                event_user(6);
                event_perform(ev_alarm,0);
                set_alarm_scr(0,-1);
            }
        }
        else if tp_spawn_var && frac_chance_scr(1,tp_spawn_chance_var)
        {
            if tp_spawn_var == 2
            {
                local.dist1 = 32+random_range(160,400);
                local.dist2 = random_range(-400,400);
                x += lengthdir_x(local.dist1,yaw_var)+lengthdir_y(local.dist2,yaw_var);
                y += lengthdir_y(local.dist1,yaw_var)+lengthdir_x(local.dist2,yaw_var);
            }
            else { event_user(15); }
            if tp_spawn_var != 3
            {
                // Reset
                event_user(6);
                event_perform(ev_alarm,0);
                set_alarm_scr(0,-1);
            }
        }
    }
    else
    {
        on_var = false; 
        set_alarm_scr(0,-1);
        fmod_inst_stop_scr(loop_inst_var);
    }
    // Zone
    if zone_start_var > 0 && dur_start_var-dur_var >= zone_start_var-1
    {
        if dur_start_var-dur_var == zone_start_var-1
        {
            global.zone_var = zone_list_var;
            zone_reset_scr();
        }
        if loop_var { door_trig_obj.rm_count_var = 0; }
        global.rm_name_var = string_replace(global.rm_name_var,"Long","My");
    }
    // Webs
    if web_start_var > 0 && dur_start_var-dur_var >= web_start_var
    {
        for (local.i=0; local.i<global.mark_len_var; local.i+=1;)
        {
            if frac_chance_scr(2,3)
            {
                with instance_create(global.mark_arr[local.i,0]+random_range(-4,4),global.mark_arr[local.i,1]+random_range(-4,4),wf_web_obj)
                {
                    tex_var = other.web_tex_var;
                    mdl_var = other.web_mdl_var;
                }
            }
        }
    }
    // Damn Doors
    local.mon = id;
    with door_trig_obj
    {
        if object_index != wf_door_trig_obj
        {
            local.door = id;
            with instance_create(x,y,wf_door_trig_obj)
            {
                par_var = local.mon;
                z = local.door.z;
                lock_var = local.door.lock_var;
                // Collision
                coll_var[0] = local.door.coll_var[0];
                coll_var[1] = local.door.coll_var[1];
                coll_var[2] = local.door.coll_var[2];
                // Text
                do_txt_var = local.door.do_txt_var;
                txt_var = local.door.txt_var;
                txt_lock_var = local.door.txt_lock_var;
                shadow_off_var = local.door.shadow_off_var;
                // Sound
                snd_len_var = local.door.snd_len_var;
                for (local.i=0; local.i<snd_len_var; local.i+=1)
                { snd_arr[local.i] = local.door.snd_arr[local.i]; }
                // Function
                rm_count_var = local.door.rm_count_var;
                delay_var = local.door.delay_var;
                zone_var = local.door.zone_var;
                rm_var = local.door.rm_var;
                // HELP
                event_perform(ev_other,ev_room_start);
            }
            instance_destroy();
        }
    }
    // Effects
    if res_var
    {
        global.res_override_var = res_var;
        global.res_override_w_var = res_w_var; // 180
        global.res_override_h_var = res_h_var; // 180
    }
    global.wall_bg_tex = sprite_get_texture(tex_spr_var,0);
    global.floor_bg_tex = sprite_get_texture(tex_spr_var,1);
    global.ceil_bg_tex = sprite_get_texture(tex_spr_var,2);
    global.light_wall_obj_spr = light_wall_spr_var;
    global.light_floor_obj_spr = light_floor_spr_var;
    with door_obj { tex_var = background_get_texture(other.door_bg_var); }
    with door_entrance_obj { tex_var = background_get_texture(other.door_bg_var); }
    if !instance_exists(wf_eff_obj)
    {
        with instance_create(0,0,wf_eff_obj)
        {
            par_var = other.id;
            spr_var = other.eff_spr_var;
        }
    }
    if do_fog_var
    {
        with torch_obj
        {
            if !gold_var
            {
                if other.no_fun_var { visible = false; }
                on_var = false;
            }
        }
        with candle_obj { if !gold_var { on_var = false; }}
        with color_par_obj { if prio_var < other.color_prio_var { instance_destroy(); }}
        if !instance_exists(color_par_obj)
        { with instance_create(0,0,bright_color_obj) { prio_var = other.color_prio_var; }}
        with fog_par_obj { if prio_var < other.fog_prio_var { instance_destroy(); }}
        if !instance_exists(fog_par_obj)
        {
            with instance_create(0,0,fog_par_obj)
            {
                prio_var = other.fog_prio_var;
                fog_var = true;
                fog_color_var = c_black;
                fog_start_var = 0;
                fog_end_var = 96;
                fog_dark_var = true;
                event_user(0);
            }
        }
    }
    if no_fun_var
    {
        with frame_obj { instance_destroy(); }
        with art_obj { instance_destroy(); }
        with web_obj { instance_destroy(); }
        with js_obj { instance_destroy(); }
        // No Jumpscares
        global.js_override_var = true;
        global.js_override_num_var = 0;
        global.js_override_den_var = 1;
    }
');
// Delay Alarm
object_event_add
(argument0,ev_alarm,0,'
    event_inherited();
    if tp_alarm_var > 0
    {
        event_user(15);
        set_alarm_scr(10,vanish_alarm_var);
    }
');
// Seen Alarm
object_event_add
(argument0,ev_alarm,8,'
    if do_seen_agg_var
    { seen_agg_var = 0; }
    else { seen_var = true; }
    if alarm_arr[9,0] > 0
    {
        event_perform(ev_alarm,9);
        set_alarm_scr(9,-1);
    }
');
// Speed Reset
object_event_add
(argument0,ev_alarm,9,'
    spd_base_var = spd_base_real_var;
    if spd_var > spd_base_var
    { set_motion_3d_scr(spd_base_var,true); }
');
// Animation
object_event_add
(argument0,ev_other,ev_user1,'
    if anim_type_var == 4
    {
        spr_prog_var -= spr_spd_var*global.delta_time_var;
        if spr_prog_var <= 0
        {
            spr_prog_var = 1;
            if !irandom(2) { spr_id_var = irandom(sprite_get_number(spr_var)-1); }
            x_off_var = random_range(-anim_off_var,anim_off_var);
            y_off_var = random_range(-anim_off_var,anim_off_var);
            z_off_var = z_off_base_var+random_range(-anim_off_var,anim_off_var);
            visible = frac_chance_scr(vis_num_var,vis_den_var);
            tex_var = sprite_get_texture(spr_var,floor(spr_id_var));
            if face_dist_var > 0 { face_var = !irandom(1); }
        }
    }
    event_inherited();
');
// Movement
object_event_add
(argument0,ev_other,ev_user0,'
    if tp_dist_var > 0 && target_dist_var > tp_dist_var { event_user(15); }
    switch move_type_var
    {
        case 0: { event_inherited(); break; }
        case 1: // Circling
        {
            local.spd = spd_base_var*spd_mult_var;
            local.yaw = point_direction(x,y,target_x_var,target_y_var);
            local.pitch = point_direction_3d_scr(x,y,z,target_x_var,target_y_var,target_z_var);
            if spd_base_var > spd_base_real_var { local.yaw += 90; }
            set_motion_3d_scr(local.spd,true,local.yaw,true,local.pitch,true);
            break;
        }
        case 2:
        {
            local.yaw = point_direction(x,y,target_x_var,target_y_var);
            local.pitch = point_direction_3d_scr(x,y,z,target_x_var,target_y_var,target_z_var);
            set_motion_3d_scr(spd_var+acc_var,true,local.yaw,true,local.pitch,true);
            break;
        }
    }
    spd_mult_var = 1;
');
// Calculate Seen
object_event_add
(argument0,ev_other,ev_user5,'
    event_inherited();
    if is_seen_var == 1
    {
        if !do_seen_agg_var { seen_var = false; }
        else { seen_agg_var += global.delta_time_var; }
        // Increase speed
        if seen_spd_var && (spd_agg_var <= 0 || seen_agg_var < spd_agg_var)
        {
            if frac_chance_scr(1,seen_spd_chance_var)
            {
                local.yaw = point_direction(x,y,target_x_var,target_y_var);
                local.pitch = point_direction_3d_scr(x,y,z,target_x_var,target_y_var,target_z_var);
                switch move_type_var
                {
                    // OG Style. Intense speed increase that resets
                    case 0:
                    case 1:
                    {
                        spd_base_var = max(spd_min_var,spd_base_var+seen_acc_var);
                        local.yaw = point_direction(x,y,target_x_var,target_y_var);
                        local.pitch = point_direction_3d_scr(x,y,z,target_x_var,target_y_var,target_z_var);
                        if move_type_var == 1 { local.yaw += 90; }
                        set_motion_3d_scr(spd_base_var*spd_mult_var,true,local.yaw,true,local.pitch,true);
                        set_alarm_scr(9,irandom_range(spd_delay_min_var,spd_delay_max_var));
                        break;
                    }
                    // HD Style. Gradual speed increase that never goes down
                    case 2:
                    {
                        set_motion_3d_scr(spd_var+seen_acc_var,true,local.yaw,true,local.pitch,true);
                        break;
                    }
                }
            }
        }
        // HD only, kinda bobbles around when looked at
        if seen_anim_var
        {
            x_off_var = random_range(-anim_off_var,anim_off_var);
            y_off_var = random_range(-anim_off_var,anim_off_var);
            z_off_var = z_off_base_var+random_range(-anim_off_var,anim_off_var);
        }
        // Flashing effects
        if frac_chance_scr(1,flash_chance_var) && seen_flash_var && (flash_agg_var <= 0 || seen_agg_var > flash_agg_var)
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
                    fmod_snd_play_scr(glitch_snd_arr[irandom(glitch_snd_len_var-1)]);
                    with instance_create(0,0,fade_eff_obj)
                    {
                        if local.rand == 2 { image_blend = c_black; }
                        else { image_blend = c_red; }
                        set_alarm_scr(0,other.eff_02_alarm_var); 
                        invert_var = 2;
                        stay_var = false;
                        cam_id_var = other.target_var.cam_id_var;
                    }
                    break;
                }
                case 3:
                {
                    // Turn everything red
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
        // Teleport if moving too fast
        if (tp_spd_var > 0 && spd_var >= tp_spd_var && frac_chance_scr(1,tp_chance_var))
        || (tp_agg_var > 0 && seen_agg_var > tp_agg_var)
        {
            // Teleport
            event_user(15);
            set_alarm_scr(8,tp_seen_delay_var);
        }
        else { set_alarm_scr(8,irandom_range(seen_delay_min_var,seen_delay_max_var)); }
    }
');
// Attack Success
object_event_add
(argument0,ev_other,ev_user3,'
    event_inherited();
    // Tp
    if tp_alarm_var > 0
    { event_perform(ev_alarm,10); }
    else { event_user(15); }
    // OG only, gets stopped in place briefly
    if attack_stun_var
    {
        move_var = false;
        set_alarm_scr(1,dmg_alarm_var);
        set_motion_3d_scr(0,true);
        if do_seen_var
        {
            seen_var = false;
            set_alarm_scr(8,dmg_alarm_var);
        }
    }
');
// Teleport
object_event_add
(argument0,ev_other,ev_user15,'
    // Originally anywhere in the room (0-1280 x 0-720 y)
    switch tp_type_var
    {
        // Type 1 makes sure White Face spawns behind the player to prevent instant damage
        case 0:
        case 1:
        {
            if tp_type_var == 1 { local.dir = random_range(target_var.eye_yaw_var+seen_yaw_var,target_var.eye_yaw_var+360-seen_yaw_var); }
            else { local.dir = random(360); }
            local.dist = random_range(tp_dist_min_var,tp_dist_max_var);
            x = target_x_var+lengthdir_x(local.dist,local.dir);
            y = target_y_var+lengthdir_y(local.dist,local.dir);
            break;
        }
        case 2:
        {
            // They bugged it lol
            x = target_x_var-500;
            y = target_y_var-500;
            break;
        }
    }
');
// Teleport Alarm
object_event_add
(argument0,ev_alarm,10,'
    on_var = false;
    set_motion_3d_scr(0,true);
    set_alarm_scr(0,tp_alarm_var);
    fmod_inst_stop_scr(loop_inst_var);
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if on_var || visible_var
    {
        local.tex = tex_var;
        if face_dist_var > 0
        {
            if face_var && point_distance_3d_scr(x,y,z,global.cam_x_var[view_current],global.cam_y_var[view_current],global.cam_z_var[view_current]) <= face_dist_var
            { tex_var = tex_02_var; }
        }
        if do_fog_var && global.fog_dark_var && global.fog_var
        {
            d3d_set_fog(true,c_black,0,256);
            event_inherited();
            d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var);
        }
        else { event_inherited(); }
        tex_var = local.tex;
    }
');