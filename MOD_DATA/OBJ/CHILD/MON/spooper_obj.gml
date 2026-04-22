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
    name_var = translate_mon_str_scr("spooper",global.name_var);
    txt_lock_var = ini_read_string("UI","spooper","UI_spooper");
    loop_snd_var[2] = string_replace(ini_read_string("SUB","spooper","SUB_spooper"),"@n",name_var); loop_snd_var[3] = false;
    ini_close();
    // Variables
    type_var = 0;
    spd_base_var = 3;
    spr_spd_var = 1/3;
    anim_type_var = 3;
    delay_var = 0;
    do_atk_var = false;
    dmg_var = 0.01;
    dmg_min_var = -1;
    w_var = 20;
    h_var = 20;
    eye_h_var = 16.7;
    z_off_base_var = 3;
    z_off_var = 3;
    dupe_var = dupe_never_const;
    dead_rm_var = spooper_dead_rm;
    hide_var = true;
    // Sounds
    do_snd_var = false;
    loop_snd_dist_min_var = 0;
    loop_snd_dist_max_var = 600;
    // Special
    do_seen_var = true;
    seen_dist_var = 8;
    seen_yaw_var = 30;
    seen_fade_var = false;
    seen_fade_rate_var = 0.03;
    hp_max_var = 6;
    hp_var = hp_max_var;
    door_type_var = 1;
    hp_dur_var = true;
    shake_type_var = 1;
    shake_var = 1;
    anim_prog_var = 0;
    anim_spd_var = 1;
    reflect_var = -1;
    unheal_var = false;
    // Teleport
    tp_type_var = 1;
    tp_off_var = 300;
    tp_dist_min_var = 0;
    tp_dist_max_var = 200;
    tp_seen_var = false;
    // Puke
    alarm_len_var = 9;
    alarm_ini_scr();
    puke_delay_min_var = 60;
    puke_delay_max_var = 240;
    puke_alarm_01_var = 40;
    puke_alarm_02_var = 180;
    puke_alarm_03_var = 125;
    puke_dmg_var = 10;
    puke_slow_var = 0;
    puke_turn_var = true;
    // Mark
    mark_seen_yaw_var = 30;
    mark_seen_pitch_var = 0;
    mark_seen_dist_var = 64;
    // Dark
    fog_start_var = 2;
    fog_end_var = 128;
    color_prio_var = 1;
    fog_prio_var = 1;
    // Timing
    mark_start_var = 1;
    mark_chance_var = 3;
    door_chance_var = 0;
    goo_start_var = 5;
    goo_chance_var = 2;
    drain_start_var = 7;
    dark_start_var = 7;
    dark_chance_var = 3;
    puke_start_var = 9;
    puke_chance_var = 5;
    // Behavior
    if global.spooper_type_var == -1 { local.type = irandom(2); }
    else { local.type = global.spooper_type_var; }
    local.set = false;
    // Assets
        // Search for existing assets to save memory
    local.loaded = false;
    with object_index
    {
        if id != other.id && object_index == other.object_index
        {
            other.spr_var = spr_var;
            other.door_spr_var = door_spr_var;
            other.tex_spr_var = tex_spr_var;
            other.light_wall_spr_var = light_wall_spr_var;
            other.light_floor_spr_var = light_floor_spr_var;
            other.puke_bg_var = puke_bg_var;
            other.fetus_bg_var = fetus_bg_var;
            other.mdl_var = mdl_var;
            other.puke_snd_var = puke_snd_var;
            other.choke_01_snd_var = choke_01_snd_var;
            other.choke_02_snd_var = choke_02_snd_var;
            other.loop_snd_var[1] = loop_snd_var[1];
            other.mus_snd_var = mus_snd_var;
            other.dur_var = dur_var;
            local.loaded = true;
            break;
        }
    }
        // If no existing assets were found, load them
    if !local.loaded
    {
        spr_var = sprite_add(vanilla_directory_const+"\TEX\sprites\MS27_01_spr.png",3,false,false,0,0);
        door_spr_var = sprite_add(vanilla_directory_const+"\3D\spooper_tex.png",6,false,false,0,0);
        tex_spr_var = sprite_add(vanilla_directory_const+"\TEX\sprites\MS27_04_spr.png",3,false,false,0,0);
        light_wall_spr_var = sprite_add(main_directory_const+"\SPR\MON\spooper_light_wall_spr.png",2,false,false,0,0);
        light_floor_spr_var = sprite_add(main_directory_const+"\SPR\MON\spooper_light_floor_spr.png",2,false,false,0,0);
        puke_bg_var = background_add(vanilla_directory_const+"\TEX\sprites\MS27_02_spr.png",false,false);
        fetus_bg_var = background_add(vanilla_directory_const+"\TEX\sprites\MS27_03_spr.png",false,false);
        mdl_var = d3d_model_create();
        d3d_model_load(mdl_var,main_directory_const+"\MDL\MON\spooper_mdl.gmmod");
        puke_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\MON\spooper_puke_snd.wav");
        choke_01_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\MON\spooper_choke_01_snd.wav");
        choke_02_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\MON\spooper_choke_02_snd.wav");
        switch global.old_theme_var
        {
            case 2: { mus_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\MON\ROMM\spooper_rom_mus_snd.ogg"); break; }
            default: { mus_snd_var = fmod_snd_add_scr(vanilla_directory_const+"\SND\AMB\SPOOPER_AMB.mp3"); break; }
        }
        fmod_snd_set_group_scr(mus_snd_var,snd_group_mus_const);
        loop_snd_var[1] = fmod_snd_add_scr(main_directory_const+"\SND\MON\spooper_loop_snd.wav",true);
        // Duration
        dur_var = irandom_range(24,31);
        switch local.type
        {
            // Recode, HD, Old HD
            case 0: case 2: case 3: { irandom_range(24,30); break; }
        }
    }
    fetus_tex_var = background_get_texture(fetus_bg_var);
    // Behavior
    switch local.type
    {
        case 0: // Recode
        {
            seen_pitch_var = 30;
            mark_seen_pitch_var = 30;
            seen_dist_var = 64;
            seen_fade_var = true;
            dmg_min_var = 10;
            door_type_var = 0;
            shake_type_var = 0;
            do_atk_var = true;
            drain_start_var = -1;
            goo_chance_var = 1;
            mark_start_var = -1;
            spd_base_var = 0.4;
            tp_seen_var = true;
            puke_slow_var = 0.5;
            puke_alarm_02_var = 120;
            puke_alarm_03_var = 72;
            door_chance_var = 3;
            do_snd_var = true;
            loop_snd_var[0] = true;
            unheal_var = true;
            // Silhouette
            sil_var = true;
            sil_type_var = 1; // Pure color
            sil_color_var = make_color_rgb(59,1,21);
            sil_alpha_var = 0.2;
            sil_dist_var = 0.1;
            break;
        }
        case 3: // Old HD
        {
            dmg_var = 1/12;
            local.set = true;
        }
        case 2: // HD
        {
            seen_yaw_var = 60;
            seen_dist_var = 32/3;
            if !local.set { dmg_var = 0.003;  } // 1/300
            spd_base_var = 16/45;
            door_type_var = 2;
            tp_off_var = 320;
            tp_dist_min_var = 0;
            tp_dist_max_var = 640/3;
            shake_var = 32/15;
            shake_type_var = 0;
            puke_slow_var = 0.3;
            puke_turn_var = false;
            puke_alarm_02_var = 120;
            puke_alarm_03_var = 72;
            drain_start_var = -1;
            mus_prio_var = mb_mus_prio_const;
            break;
        }
    }
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
    local.bool = false;
    with object_index { if id != other.id && object_index == other.object_index { local.bool = true; break; }}
    if !local.bool
    {
        sprite_delete(spr_var);
        sprite_delete(door_spr_var);
        sprite_delete(tex_spr_var);
        sprite_delete(light_wall_spr_var);
        sprite_delete(light_floor_spr_var);
        background_delete(puke_bg_var);
        background_delete(fetus_bg_var);
        d3d_model_destroy(mdl_var);
        fmod_snd_free_scr(choke_01_snd_var);
        fmod_snd_free_scr(choke_02_snd_var);
        fmod_snd_free_scr(puke_snd_var);
        fmod_snd_free_scr(loop_snd_var[1]);
        fmod_snd_free_scr(mus_snd_var);
    }
    with spooper_puke_obj { if par_var == other.id { instance_destroy(); }}
    with spooper_fetus_obj { if par_var == other.id { instance_destroy(); }}
    with spooper_door_obj { if par_var == other.id { instance_destroy(); }}
    with spooper_mark_obj { if par_var == other.id { instance_destroy(); }}
    if unheal_var { with player_obj { unheal_var = 0; }}
');
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,'
    event_inherited();
    image_alpha = 1;
    if hp_var > 0
    {
        if !instance_exists(spooper_door_obj)
        {
            local.tex = sprite_get_texture(door_spr_var,hp_max_var-hp_var);
            local.spawns = max(global.spawn_len_var,global.spawn_len_extra_var);
            local.spawn = false;
            for (local.i=1; local.i<local.spawns; local.i+=1;)
            {
                if door_type_var == 1 { local.i = irandom_range(1,local.spawns-1); }
                if global.spawn_arr[local.i,4].lock_var == false
                {
                    with global.spawn_arr[local.i,4]
                    {
                        lock_var = 2;
                        txt_lock_var = other.txt_lock_var;
                    }
                    if !local.spawn || door_type_var != 2
                    {
                        with instance_create(global.spawn_arr[local.i,0]-lengthdir_x(8,global.spawn_arr[local.i,3]),global.spawn_arr[local.i,1]-lengthdir_y(8,global.spawn_arr[local.i,3]),spooper_door_obj)
                        {
                            z = global.spawn_arr[local.i,2];
                            direction = global.spawn_arr[local.i,3]+180;
                            par_var = other.id;
                            mdl_var = other.mdl_var;
                            store_tex_var = local.tex;
                            tex_var = store_tex_var;
                            tp_var = (other.door_type_var == 2);
                            spawn_var = local.i;
                        }
                        local.spawn = true;
                    }
                }
                if door_type_var == 1 { break; }
            }
        }
        on_var = false;
        set_motion_3d_scr(0,true);
        reset_alarm_scr();
        fmod_inst_stop_scr(loop_inst_var);
    }
    else
    {
        local.start = dur_start_var-dur_var;
        if local.start >= mark_start_var && frac_chance_scr(1,mark_chance_var)
        {
            local.door = false;
            if door_chance_var > 0 && global.spawn_len_var > 1 { local.door = frac_chance_scr(1,door_chance_var); }
            local.tex = sprite_get_texture(door_spr_var,sprite_get_number(door_spr_var)-1);
            if local.door
            {
                local.spawn = irandom_range(1,global.spawn_len_var-1);
                with instance_create(global.spawn_arr[local.spawn,0]-lengthdir_x(8,global.spawn_arr[local.spawn,3]),global.spawn_arr[local.spawn,1]-lengthdir_y(8,global.spawn_arr[local.spawn,3]),spooper_mark_obj)
                {
                    z = global.spawn_arr[local.spawn,2];
                    direction = global.spawn_arr[local.spawn,3]+180;
                    par_var = other.id;
                    mdl_var = other.mdl_var;
                    store_tex_var = local.tex;
                    tex_var = store_tex_var;
                    seen_yaw_var = other.mark_seen_yaw_var;
                    seen_pitch_var = other.mark_seen_pitch_var;
                    seen_dist_var = other.mark_seen_dist_var;
                }
            }
            else if global.mark_len_var
            {
                local.mark = irandom(global.mark_len_var-1);
                with instance_create(global.mark_arr[local.mark,0],global.mark_arr[local.mark,1],spooper_mark_obj)
                {
                    z = global.mark_arr[local.mark,2];
                    direction = point_direction(x,y,global.spawn_arr[0,0],global.spawn_arr[0,1])+180;
                    par_var = other.id;
                    mdl_var = other.mdl_var;
                    store_tex_var = local.tex;
                    tex_var = store_tex_var;
                    seen_yaw_var = other.mark_seen_yaw_var;
                    seen_pitch_var = other.mark_seen_pitch_var;
                    seen_dist_var = other.mark_seen_dist_var;
                }
            }
        }
        if local.start >= goo_start_var && frac_chance_scr(1,goo_chance_var)
        { event_user(14); }
        else
        {
            on_var = false;
            set_motion_3d_scr(0,true);
            reset_alarm_scr();
            fmod_inst_stop_scr(loop_inst_var);
        }
        if local.start >= puke_start_var && frac_chance_scr(global.player_len_var,puke_chance_var) && instance_number(mon_par_obj) <= 1 && !do_atk_var
        { set_alarm_scr(8,irandom_range(puke_delay_min_var,puke_delay_max_var)); }
        if local.start >= dark_start_var && frac_chance_scr(1,dark_chance_var)
        {
            with torch_obj { if !gold_var { on_var = false; }}
            with candle_obj { if !gold_var { on_var = false; }}
            with color_par_obj { if prio_var < other.color_prio_var { instance_destroy(); }}
            if !instance_exists(color_par_obj)
            {
                with instance_create(0,0,dark_color_obj)
                {
                    par_var = other.id;
                    prio_var = other.color_prio_var;
                    event_user(0);
                }
            }
            with fog_par_obj { if prio_var < other.fog_prio_var { instance_destroy(); }}
            if !instance_exists(fog_par_obj)
            {
                with instance_create(0,0,fog_par_obj)
                {
                    prio_var = other.fog_prio_var;
                    fog_var = true;
                    fog_color_var = c_black;
                    fog_start_var = 2;
                    fog_end_var = 128;
                    fog_dark_var = true;
                    event_user(0);
                }
            }
        }
        global.wall_bg_tex = sprite_get_texture(tex_spr_var,0);
        global.floor_bg_tex = sprite_get_texture(tex_spr_var,1);
        global.ceil_bg_tex = sprite_get_texture(tex_spr_var,2);
        global.light_wall_obj_spr = light_wall_spr_var;
        global.light_floor_obj_spr = light_floor_spr_var;
    }
');
// Room End Event
object_event_add
(argument0,ev_other,ev_room_end,'
    if hp_dur_var && hp_var > 0 { reset_alarm_scr(); }
    else { event_inherited(); }
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    event_inherited();
    if on_var
    {
        if is_seen_var == 1
        {
            if seen_fade_var
            { image_alpha -= seen_fade_rate_var*global.delta_time_var; }
            if !seen_fade_var || image_alpha <= 0
            {
                image_alpha = 1;
                if tp_seen_var { event_user(14); }
                else
                {
                    on_var = false;
                    set_motion_3d_scr(0,true);
                    reset_alarm_scr();
                    fmod_inst_stop_scr(loop_inst_var);
                }
            }
        }
    }
    if hp_var <= 0 && dur_start_var-dur_var >= drain_start_var
    {
        local.drain = true;
        with spooper_obj { if id < other.id { local.drain = false; }}
        if local.drain
        {
            if dmg_min_var > 0
            {
                local.min = dmg_min_var;
                local.dokill = false;
            }
            else
            {
                local.min = dmg_var*global.delta_time_var;
                local.dokill = true;
            }
            local.kill = 0;
            with player_obj
            {
                if !other.unheal_var { heal_mult_var = 0; }
                if !dead_var && !hurt_var && !in_door_var && !invuln_var && on_var
                {
                    if hp_var > local.min
                    {
                        local.dmg = other.dmg_var*global.delta_time_var
                        hp_var -= local.dmg;
                        if hp_var < hp_max_var && other.unheal_var
                        { unheal_var += local.dmg; }
                    }
                    else if local.dokill
                    {
                        hp_var = 0;
                        dead_var = true;
                        do_coll_var = false;
                        do_stam_var = false;
                        if local.kill == 0
                        { local.kill = true; local.player = id; }
                        // Possess thing
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
                                do_stam_var = true;
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
                }
                if !dead_var { local.kill = -1; }
            }
            if local.kill && local.dokill && !global.debug_var && !possess_var
            {
                global.dead_mon_var = object_index;
                global.menu_player_var = local.player.player_id_var;
                if global.permadeath_var { delete_save_scr(global.save_name_var); }
                rm_goto_menu_scr(dead_rm_var,true);
            }
        }
    }
');
// Anim Event
object_event_add
(argument0,ev_other,ev_user1,'
    event_inherited();
    anim_prog_var -= anim_spd_var*global.delta_time_var;
    if anim_prog_var <= 0
    {
        anim_prog_var = 1;
        if shake_type_var == 1
        {
            x_off_var = random_range(-shake_var,shake_var);
            y_off_var = random_range(-shake_var,shake_var);
            z_off_var = z_off_base_var+random_range(-shake_var,shake_var);
        }
        else
        {
            local.shake = shake_var*random(1);
            local.yaw = random(360);
            local.pitch = random_range(-90,90);
            x_off_var = lengthdir_x(lengthdir_x(local.shake,local.yaw),local.pitch);
            y_off_var = lengthdir_x(lengthdir_y(local.shake,local.yaw),local.pitch);
            z_off_var = -lengthdir_y(local.shake,local.pitch);
        }
        visible = frac_chance_scr(1,2);
    }
');
// Puke Alarm
object_event_add
(argument0,ev_alarm,8,'
    local.player = global.player_arr[irandom(global.player_len_var-1)];
    if !local.player.dead_var
    {
        if puke_turn_var
        {
            with local.player
            {
                turn_var = true;
                turn_yaw_var = eye_yaw_var;
                turn_pitch_var = eye_pitch_var;
                eye_pitch_var = -80;
                set_alarm_scr(4,other.puke_alarm_01_var);
            }
        }
        with instance_create(0,0,player_freeze_obj)
        {
            player_var = local.player;
            set_alarm_scr(0,other.puke_alarm_01_var)
        }
        fmod_snd_play_scr(choose(choke_01_snd_var,choke_02_snd_var));
        with instance_create(0,0,spooper_puke_obj)
        {
            par_var = other.id;
            player_var = local.player;
            cam_id_var = local.player.cam_id_var;
            dmg_var = other.puke_dmg_var;
            bg_var = other.puke_bg_var;
            fetus_tex_var = other.fetus_tex_var;
            snd_var = other.puke_snd_var;
            alarm_02_var = other.puke_alarm_02_var;
            alarm_03_var = other.puke_alarm_03_var;
            unheal_var = other.unheal_var;
            slow_var = other.puke_slow_var;
            possess_var = other.possess_var;
            set_alarm_scr(0,other.puke_alarm_01_var);
        }
    }
');
// Attack Event
object_event_add
(argument0,ev_other,ev_user2,'
    local.spooper = id;
    local.success = false;
    with player_obj
    {
        if !dead_var && !hurt_var && !in_door_var && !invuln_var && on_var
        {
            // p3dc_check_scr(coll_var[0],x,y,z,other.coll_var[0],other.x,other.y,other.z)
            if cyl_coll_scr(x,y,z,coll_var[2],coll_var[1],other.x,other.y,other.z,other.atk_range_var,other.coll_var[1])
            {
                // Turn
                if other.puke_turn_var
                {
                    turn_var = true;
                    turn_yaw_var = eye_yaw_var;
                    turn_pitch_var = eye_pitch_var;
                    eye_pitch_var = -80;
                    set_alarm_scr(4,other.puke_alarm_01_var);
                }
                // Vomit
                local.player = id;
                with instance_create(0,0,player_freeze_obj)
                {
                    player_var = local.player;
                    set_alarm_scr(0,local.spooper.puke_alarm_01_var)
                }
                fmod_snd_play_scr(choose(other.choke_01_snd_var,other.choke_02_snd_var));
                with instance_create(0,0,spooper_puke_obj)
                {
                    par_var = local.spooper;
                    player_var = local.player;
                    cam_id_var = local.player.cam_id_var;
                    dmg_var = local.spooper.puke_dmg_var;
                    bg_var = local.spooper.puke_bg_var;
                    fetus_tex_var = local.spooper.fetus_tex_var;
                    snd_var = local.spooper.puke_snd_var;
                    alarm_02_var = local.spooper.puke_alarm_02_var;
                    alarm_03_var = local.spooper.puke_alarm_03_var;
                    slow_var = local.spooper.puke_slow_var;
                    unheal_var = local.spooper.unheal_var;
                    possess_var = local.spooper.possess_var;
                    set_alarm_scr(0,local.spooper.puke_alarm_01_var);
                }
                local.success = true;
            }
        }
    }
    if local.success
    {
        if tp_seen_var { event_user(14); }
        else
        {
            on_var = false;
            set_motion_3d_scr(0,true);
            reset_alarm_scr();
            fmod_inst_stop_scr(loop_inst_var);
        }
    }
');
// Teleport Event
object_event_add
(argument0,ev_other,ev_user14,'
    local.dir = random(360);
    local.dist = random_range(tp_dist_min_var,tp_dist_max_var);
    x = target_x_var+lengthdir_x(local.dist,local.dir);
    y = target_y_var+lengthdir_y(local.dist,local.dir);
    if tp_type_var == 1
    {
        if instance_exists(target_var) { local.dir = target_var.yaw_var; } else { local.dir = 0; }
        x += lengthdir_x(tp_off_var,local.dir);
        y += lengthdir_y(tp_off_var,local.dir);
    }
');
// Begin Event
object_event_add
(argument0,ev_other,ev_user15,'
    mus_prio_var = mb_mus_prio_const;
    global.wall_bg_tex = sprite_get_texture(tex_spr_var,0);
    global.floor_bg_tex = sprite_get_texture(tex_spr_var,1);
    global.ceil_bg_tex = sprite_get_texture(tex_spr_var,2);
    global.light_wall_obj_spr = light_wall_spr_var;
    global.light_floor_obj_spr = light_floor_spr_var;
    with mus_control_obj { event_user(0); }
    hide_var = false;
');