// Builtin Variables
object_set_depth(argument0,-3);
object_set_mask(argument0,noone);
object_set_parent(argument0,echidna_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,false);
// Create Event
object_event_add
(argument0,ev_create,1,'
    // Sounds
    snd_len_var = 4;
    wake_snd_var[0] = true;
    snd_alarm_min_var = -1;
    snd_alarm_max_var = -1;
    snd_dist_min_var = 0;
    snd_dist_max_var = 700;
    // Translations
    ini_open("lang_"+global.lang_var+".ini");
    name_var = translate_mon_str_scr("mur",global.name_var);
    local.sub = string_replace(ini_read_string("SUB","mur","SUB_mur"),"@n",name_var);
    for (local.i=0; local.i<snd_len_var; local.i+=1)
    { snd_arr[local.i,1] = local.sub; snd_arr[local.i,2] = false; }
    wake_snd_var[2] = string_replace(ini_read_string("SUB","mur_wake","SUB_mur_wake"),"@n",name_var); wake_snd_var[3] = false;
    ini_close();
    // Variables
    type_var = 0;
    spd_base_var = 0.8;
    dur_var = irandom_range(15,30);
    delay_var = 0;
    dmg_var = 20;
    dmg_alarm_var = 30;
    eye_h_var = 2;
    snd_h_var = eye_h_var;
    atk_range_var = 28.8;
    dead_rm_var = ringu_dead_rm;
    do_anim_var = false;
    wander_spd_var = 0.25;
    wander_time_var = 250;
    splash_time_var = 0;
    splash_rate_var = 12;
    ring_rate_var = 12;
    water_spd_mult_var = 0.6;
    water_spd_mult_deep_var = 0.6;
    water_alpha_var = 1;
    crateless_spd_mult_var = 1;
    zone_var = true;
    sink_var = false;
    move_arr_len = 0;
    fast_spawn_var = false;
    do_ring_var = false;
    move_len_var = 0;
    // Fog
    fog_color_var = make_color_rgb(14,69,69);
    fog_prio_var = 2;
    fog_start_var = 0;
    fog_end_var = 96;
    fog_water_color_var = make_color_rgb(33,36,21);
    fog_water_start_var = 0;
    fog_water_end_var = 96;
    // Theme
    mus_prio_var = theme_mus_prio_const;
    // Behavior
    local.hdwhitelist = false;
    if global.mur_type_var == -1 { local.type = irandom(3); }
    else { local.type = global.mur_type_var; }
    switch local.type
    {
        case 0:
        {
            delay_var = 90;
            spd_base_var = 1.25; // 1.r3;
            splash_rate_var = 18.75;
            dmg_var = 10;
            atk_range_var = global.mon_coll[2];
            type_var = 2;
            water_spd_mult_var = 1;
            water_alpha_var = 0.6;
            fog_end_var = 128;
            crateless_spd_mult_var = 0.64;
            sink_var = true;
            do_ring_var = true;
            wander_time_var = 800; // 1000
            break;
        }
        case 2:
        {
            spd_base_var = 5/pf_ms_rate_const;
            wander_spd_var = 0.4;
            do_ring_var = true;
            type_var = 2;
            dmg_var = 45;
            dmg_alarm_var = 30;
            atk_alarm_var = 180;
            atk_range_var = 32;
            splash_rate_var = 15/spd_base_var;
            ring_rate_var = 7.5/(spd_base_var*wander_spd_var);
            local.hdwhitelist = true;
            break;
        }
    }
    // Assets
        // Search for existing assets to save memory
    local.loaded = false;
    with object_index
    {
        if id != other.id && object_index == other.object_index
        {
            other.spr_var = spr_var;
            other.icon_spr_var = icon_spr_var;
            other.ring_bg_var = ring_bg_var;
            other.part_bg_var = part_bg_var;
            for (local.i=0; local.i<snd_len_var; local.i+=1;)
            { other.snd_arr[local.i,0] = snd_arr[local.i,0]; }
            other.wake_snd_var[1] = wake_snd_var[1];
            other.mus_snd_var = mus_snd_var;
            other.wall_bg_var = wall_bg_var;
            other.floor_bg_var = floor_bg_var;
            other.ceil_bg_var = ceil_bg_var;
            other.crate_bg_var = crate_bg_var;
            other.water_bg_var = water_bg_var;
            other.water_path_var = water_path_var;
            other.zone_list_var = zone_list_var;
            other.whitelist_hd_var = whitelist_hd_var;
            local.loaded = true;
            break;
        }
    }
        // If no existing assets were found, load them
    if !local.loaded
    {
        spr_var = spr_add_scr(mur_spr_path,8,false,false,0,0);
        icon_spr_var = spr_add_scr(mur_icon_spr_path,3,false,false,0,0);
        ring_bg_var = bg_add_scr(mur_ring_bg_path,false,false);
        part_bg_var = bg_add_scr(mur_part_bg_path,false,false);
        snd_arr[0,0] = snd_add_scr(mur_01_snd_path,true,snd_group_mon_const,1,snd_dist_min_var,snd_dist_max_var);
        snd_arr[1,0] = snd_add_scr(mur_02_snd_path,true,snd_group_mon_const,1,snd_dist_min_var,snd_dist_max_var);
        snd_arr[2,0] = snd_add_scr(mur_03_snd_path,true,snd_group_mon_const,1,snd_dist_min_var,snd_dist_max_var);
        snd_arr[3,0] = snd_add_scr(mur_04_snd_path,true,snd_group_mon_const,1,snd_dist_min_var,snd_dist_max_var);
        wake_snd_var[1] = snd_add_scr(mur_wake_snd_path,global.wake_3d_var,snd_group_mon_const,1,snd_dist_min_var,snd_dist_max_var);
        switch theme_scr(global.mur_theme_var,global.theme_var,1,0,0,1)
        {
            case 1: { mus_snd_var = snd_add_scr(mur_rom_mus_snd_path,false,snd_group_mus_const,1,0,0); break; }
            default: { mus_snd_var = snd_add_scr(mur_mus_snd_path,false,snd_group_mus_const,1,0,0); break; }
        }
        fmod_snd_set_group_scr(mus_snd_var,snd_group_mus_const);
        // Textures
        wall_bg_var = bg_add_scr(amn_wall_bg_path,false,false);
        floor_bg_var = bg_add_scr(amn_floor_02_bg_path,false,false);
        ceil_bg_var = bg_add_scr(amn_ceil_bg_path,false,false);
        crate_bg_var = bg_add_scr(amn_crate_bg_path,false,false);
        // Water
        water_bg_var = bg_add_scr(amn_water_bg_path,false,false);
        water_path_var = path_add();
        path_set_closed(water_path_var,true);
        path_set_kind(water_path_var,true);
        path_set_precision(water_path_var,4);
        path_add_point(water_path_var,0,0,100);
        path_add_point(water_path_var,0,16,100);
        path_add_point(water_path_var,8,8,100);
        path_add_point(water_path_var,8,-8,100);
        path_add_point(water_path_var,-8,-16,100);
        // Zone
        zone_list_var = ds_list_create();
        ds_list_clear(zone_list_var);
        ds_list_add(zone_list_var,amn_hall_01_rm);
        ds_list_add(zone_list_var,amn_hall_02_rm);
        ds_list_add(zone_list_var,amn_hall_03_rm);
        ds_list_add(zone_list_var,amn_hall_04_rm);
        ds_list_add(zone_list_var,amn_hall_05_rm);
        ds_list_add(zone_list_var,amn_hall_06_rm);
        ds_list_add(zone_list_var,amn_hall_07_rm);
        ds_list_add(zone_list_var,amn_hall_08_rm);
        ds_list_add(zone_list_var,amn_hall_09_rm);
        ds_list_add(zone_list_var,amn_hall_10_rm);
        ds_list_add(zone_list_var,amn_hall_11_rm);
        ds_list_add(zone_list_var,amn_hall_12_rm);
        ds_list_add(zone_list_var,amn_hall_13_rm);
        ds_list_add(zone_list_var,amn_hall_14_rm);
        ds_list_add(zone_list_var,amn_hall_15_rm);
        ds_list_add(zone_list_var,amn_hall_16_rm);
        // Whitelist
        whitelist_hd_var = ds_list_create();
        ds_list_clear(whitelist_hd_var);
        ds_list_add(whitelist_hd_var,gel_obj);
        ds_list_add(whitelist_hd_var,bab_obj);
        ds_list_add(whitelist_hd_var,killer_obj);
        ds_list_add(whitelist_hd_var,mur_obj);
    }
    water_tex_var = background_get_texture(water_bg_var);
    crate_tex_var = background_get_texture(crate_bg_var);
    ring_tex_var = background_get_texture(ring_bg_var);
    part_tex_var = background_get_texture(part_bg_var);
    if local.hdwhitelist { whitelist_var = whitelist_hd_var; }
    // Zone
    if zone_var
    { zone_override_scr(zone_list_var,noone); }
');
// Destroy Event
object_event_add
(argument0,ev_destroy,0,'
    event_inherited();
    if zone_var
    { zone_override_reset_scr(zone_list_var,noone); }
    global.wall_bg_tex = background_get_texture(global.wall_bg);
    global.floor_bg_tex = background_get_texture(global.floor_bg);
    global.ceil_bg_tex = background_get_texture(global.ceil_bg);
    local.bool = false;
    with object_index { if id != other.id && object_index == other.object_index { local.bool = true; break; }}
    if !local.bool
    {
        sprite_delete(spr_var);
        sprite_delete(icon_spr_var);
        background_delete(ring_bg_var);
        background_delete(part_bg_var);
        fmod_snd_free_scr(mus_snd_var);
        for (local.i=0; local.i<snd_len_var; local.i+=1;)
        { fmod_snd_free_scr(snd_arr[local.i,0]); }
        fmod_snd_free_scr(wake_snd_var[1]);
        background_delete(wall_bg_var);
        background_delete(floor_bg_var);
        background_delete(ceil_bg_var);
        background_delete(crate_bg_var);
        background_delete(water_bg_var);
        path_delete(water_path_var);
        ds_list_destroy(zone_list_var);
        ds_list_destroy(whitelist_hd_var);
    }
    with amn_water_obj { if par_var == other.id { instance_destroy(); }}
    with amn_crate_obj { if par_var == other.id { instance_destroy(); }}
');
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,'
    // Spawn
    if instance_exists(mur_spawn_obj)
    {
        x = mur_spawn_obj.x;
        y = mur_spawn_obj.y;
        z = mur_spawn_obj.z;
        spawn_var = -1;
        event_inherited();
        if !on_var && fast_spawn_var
        {
            event_perform(ev_alarm,0);
            set_alarm_scr(0,-1);
        }
    }
    else
    {
        spawn_var = 0;
        event_inherited();
    }
    // Variables
    move_len_var = 0;
    splash_time_var = 0;
    // Water
    if !instance_exists(amn_water_obj)
    {
        with water_obj { instance_destroy(); }
        with instance_create(0,0,amn_water_obj)
        {
            par_var = other.id;
            store_tex_var = other.water_tex_var;
            tex_var = store_tex_var;
            path_var = other.water_path_var;
            path_start(path_var,0.02*global.delta_time_var,1,true);
            spd_mult_var = other.water_spd_mult_var;
            spd_mult_deep_var = other.water_spd_mult_deep_var;
            image_alpha = other.water_alpha_var;
        }
    }
    // Fog
    with fog_par_obj { if prio_var < other.fog_prio_var { instance_destroy(); }}
    if !instance_exists(fog_par_obj)
    {
        with instance_create(0,0,fog_water_par_obj)
        {
            par_var = other.id;
            prio_var = other.fog_prio_var;
            fog_var = true;
            fog_dark_var = false;
            fog_color_var = other.fog_color_var;
            fog_start_var = other.fog_start_var;
            fog_end_var = other.fog_end_var;
            event_user(0);
            // Water
            fog_water_var = true;
            fog_water_dark_var = false;
            fog_water_color_var = other.fog_water_color_var;
            fog_water_start_var = other.fog_water_start_var;
            fog_water_end_var = other.fog_water_end_var;
        }
    }
    // Crates
    local.crate = false;
    if global.mark_len_var > 0
    {
        for (local.i=0; local.i<global.mark_len_var; local.i+=1;)
        {
            if !global.mark_arr[local.i,3]
            {
                with instance_create(global.mark_arr[local.i,0],global.mark_arr[local.i,1],amn_crate_obj)
                {
                    par_var = other.id;
                    store_tex_var = other.crate_tex_var;
                    tex_var = store_tex_var;
                    sink_var = other.sink_var;
                    zstart = water_obj.z_base_var-10;
                    z = zstart;
                }
                global.mark_arr[local.i,3] = true;
                local.crate = true;
            }
        }
    }
    if !local.crate { spd_mult_per_var = crateless_spd_mult_var;}
    else { spd_mult_per_var = 1; }
    // Textures
    global.wall_bg_tex = background_get_texture(wall_bg_var);
    global.floor_bg_tex = background_get_texture(floor_bg_var);
    global.ceil_bg_tex = background_get_texture(ceil_bg_var);
');
// Move Event
object_event_add
(argument0,ev_other,ev_user0,'
    event_inherited();
    if instance_exists(water_obj)
    {
        if spd_var > 0
        {
            splash_time_var += spd_var*global.delta_time_var;
            if !instance_exists(target_var) && do_ring_var
            {
                if splash_time_var > ring_rate_var
                {
                    splash_time_var = 0;
                    with instance_create(x,y,splash_eff_obj)
                    {
                        z = water_obj.z;
                        ring_tex_var = other.ring_tex_var;
                        part_tex_var = other.part_tex_var;
                        splash_spr_var = other.spr_var;
                        splash_tex_var = sprite_get_texture(splash_spr_var,0);
                        set_alarm_scr(0,-1);
                        set_alarm_scr(2,-1);
                    }
                }
            }
            else if splash_time_var > splash_rate_var
            {
                splash_time_var = 0;
                with instance_create(x,y,splash_eff_obj)
                {
                    z = water_obj.z;
                    ring_tex_var = other.ring_tex_var;
                    part_tex_var = other.part_tex_var;
                    splash_spr_var = other.spr_var;
                    splash_tex_var = sprite_get_texture(splash_spr_var,0);
                }
                // Splash Sound
                /*if fmod_inst_is_play_scr(inst_var) && fmod_inst_is_3d_scr(inst_var)
                { fmod_inst_stop_scr(inst_var); }*/
                local.snd = irandom(snd_len_var-1);
                inst_var = fmod_snd_3d_play_scr(snd_arr[local.snd,0],x,y,z+snd_h_var);
                if global.pitch_bend_var { fmod_inst_set_pitch_scr(inst_var,random_range(0.95,1.05)); }
                sub_var[0] = snd_arr[local.snd,1];
                sub_var[1] = snd_arr[local.snd,2];
            }
        }
        else { splash_time_var = 0; }
    }
');
// Target Event
object_event_add
(argument0,ev_other,ev_user6,'
    local.water = instance_exists(water_obj);
    if enter_var || wander_var || !local.water
    { event_inherited(); }
    else if local.water
    {
        target_var = noone;
        with (player_obj)
        {
            if z < water_obj.z
            {
                local.dist = point_distance_3d_scr(other.x,other.y,other.z,x,y,z);
                if on_var && !in_door_var && !dead_var && (other.target_var == noone || local.dist < other.target_dist_var)
                { other.target_var = id; }
            }
        }
        if target_var != noone
        {
            target_x_var = target_var.x;
            target_y_var = target_var.y;
            target_z_var = target_var.z;
            // Save position
            for (local.i=move_len_var-1; local.i>=0; local.i-=1;)
            {
                move_arr_var[local.i+1,0] =  move_arr_var[local.i,0];
                move_arr_var[local.i+1,1] =  move_arr_var[local.i,1];
                move_arr_var[local.i+1,2] =  move_arr_var[local.i,2];
                move_arr_var[local.i+1,3] =  move_arr_var[local.i,3];
            }
            move_arr_var[0,0] = x;
            move_arr_var[0,1] = y;
            move_arr_var[0,2] = z;
            move_arr_var[0,3] = current_time;
            if move_len_var == 0 { move_len_var = 1; }
            else
            {
                local.len = 0;
                for (local.i=0; local.i<=move_len_var; local.i+=1;)
                {
                    if current_time-move_arr_var[local.i,3] <= wander_time_var
                    || local.len == 0
                    { local.len = local.i+1; }
                }
                move_len_var = local.len;
            }
        }
        else if move_len_var > 0
        {
            target_x_var = move_arr_var[move_len_var-1,0];
            target_y_var = move_arr_var[move_len_var-1,1];
            target_z_var = move_arr_var[move_len_var-1,2];
            spd_mult_var *= wander_spd_var;
        }
        else
        {
            target_x_var = x;
            target_y_var = y;
            target_z_var = z;
        }
    }
    if local.water
    {
        target_z_var = min(water_obj.z,target_z_var);
        target_dist_var = point_distance_3d_scr(x,y,z,target_x_var,target_y_var,target_z_var);
    }
');
// End Step Event
object_event_add
(argument0,ev_step,ev_step_end,'
    event_inherited();
    if instance_exists(water_obj)
    { z = min(water_obj.z,z); }
');