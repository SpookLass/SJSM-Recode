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
    atk_range_var = 28.8;
    dead_rm_var = ringu_dead_rm;
    do_anim_var = false;
    wander_spd_var = 0.25;
    splash_time_var = 0;
    splash_rate_var = 12;
    water_spd_mult_var = 0.6;
    water_spd_mult_deep_var = 0.6;
    crateless_spd_mult_var = 1;
    zone_var = true;
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
    if global.mur_type_var == -1 { local.type = irandom(3); }
    else { local.type = global.mur_type_var; }
    switch local.type
    {
        case 0:
        {
            spd_base_var = 1.25; // 1.r3;
            splash_rate_var = 18.75;
            dmg_var = 10;
            atk_range_var = global.mon_coll[2];
            type_var = 2;
            water_spd_mult_var = 1;
            fog_end_var = 128;
            crateless_spd_mult_var = 0.64;
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
            other.ring_bg_var = ring_bg_var;
            other.part_bg_var = part_bg_var;
            for (local.i=0; local.i<snd_len_var; local.i+=1;)
            { other.snd_arr[local.i,0] = snd_arr[local.i,0]; }
            other.wake_snd_var[1] = wake_snd_var[1];
            other.mus_snd_var = mus_snd_var;
            other.hurt_snd_var[1] = hurt_snd_var[1];
            other.wall_bg_var = wall_bg_var;
            other.floor_bg_var = floor_bg_var;
            other.ceil_bg_var = ceil_bg_var;
            other.crate_bg_var = crate_bg_var;
            other.water_bg_var = water_bg_var;
            other.water_path_var = water_path_var;
            other.zone_list_var = zone_list_var;
            local.loaded = true;
            break;
        }
    }
        // If no existing assets were found, load them
    if !local.loaded
    {
        spr_var = sprite_add(vanilla_directory_const+"\TEX\sprites\MS11_01_spr.png",8,false,false,0,0);
        ring_bg_var = background_add(vanilla_directory_const+"\TEX\sprites\MS11_02_spr.png",false,false);
        part_bg_var = background_add(vanilla_directory_const+"\TEX\sprites\MS11_03_spr.png",false,false);
        snd_arr[0,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\mur_01_snd.wav",true);
        snd_arr[1,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\mur_02_snd.wav",true);
        snd_arr[2,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\mur_03_snd.wav",true);
        snd_arr[3,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\mur_04_snd.wav",true);
        wake_snd_var[1] = fmod_snd_add_scr(main_directory_const+"\SND\MON\mur_wake_snd.wav",global.wake_3d_var);
        switch theme_scr(global.mur_theme_var,global.theme_var,1,0,0,1)
        {
            case 1: { mus_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\MON\ROMM\mur_rom_mus_snd.ogg"); break; }
            default: { mus_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\MON\mur_mus_snd.mp3"); break; }
        }
        fmod_snd_set_group_scr(mus_snd_var,snd_group_mus_const);
        // Textures
        wall_bg_var = background_add(vanilla_directory_const+"\TEX\mobile\MB10_02_tex.png",false,false);
        floor_bg_var = background_add(vanilla_directory_const+"\TEX\mobile\MB10_10_tex.png",false,false);
        ceil_bg_var = background_add(vanilla_directory_const+"\TEX\mobile\MB10_03_tex.png",false,false);
        crate_bg_var = background_add(vanilla_directory_const+"\TEX\mobile\MB10_18_tex.png",false,false);
        // Water
        water_bg_var = background_add(vanilla_directory_const+"\TEX\mobile\MB10_16_tex.png",false,false);
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
    }
    water_tex_var = background_get_texture(water_bg_var);
    crate_tex_var = background_get_texture(crate_bg_var);
    ring_tex_var = background_get_texture(ring_bg_var);
    part_tex_var = background_get_texture(part_bg_var);
    // Zone
    if zone_var
    {
        global.zone_var = zone_list_var;
        zone_reset_scr();
    }
');
// Destroy Event
object_event_add
(argument0,ev_destroy,0,'
    event_inherited();
    global.wall_bg_tex = background_get_texture(global.wall_bg);
    global.floor_bg_tex = background_get_texture(global.floor_bg);
    global.ceil_bg_tex = background_get_texture(global.ceil_bg);
    local.bool = false;
    with object_index { if id != other.id && object_index == other.object_index { local.bool = true; break; }}
    if !local.bool
    {
        sprite_delete(spr_var);
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
    }
    zone_from_num_scr(global.zone_num_var);
');
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,'
    event_inherited();
    // Water
    if !instance_exists(amn_water_obj)
    {
        with water_obj { instance_destroy(); }
        with instance_create(0,0,amn_water_obj)
        {
            store_tex_var = other.water_tex_var;
            tex_var = store_tex_var;
            path_var = other.water_path_var;
            path_start(path_var,0.02*global.delta_time_var,1,true);
            spd_mult_var = other.water_spd_mult_var;
            spd_mult_deep_var = other.water_spd_mult_deep_var;
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
    if spd_var > 0 && instance_exists(water_obj)
    {
        splash_time_var += spd_var*global.delta_time_var;
        if splash_time_var > splash_rate_var
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
            inst_var = fmod_snd_3d_play_scr(snd_arr[local.snd,0],x,y,z);
            if global.pitch_bend_var { fmod_inst_set_pitch_scr(inst_var,random_range(0.95,1.05)); }
            sub_var[0] = snd_arr[local.snd,1];
            sub_var[1] = snd_arr[local.snd,2];
        }
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
        target_dist_var = 0;
        with (player_obj)
        {
            if z < water_obj.z
            {
                local.dist = point_distance_3d_scr(other.x,other.y,other.z,x,y,z);
                if on_var && !in_door_var && !dead_var && (other.target_var == noone || local.dist < other.target_dist_var)
                {
                    other.target_var = id;
                    other.target_dist_var = local.dist;
                }
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
    if local.water
    { target_z_var = min(water_obj.z,target_z_var); }
');
// End Step Event
object_event_add
(argument0,ev_step,ev_step_end,'
    event_inherited();
    if instance_exists(water_obj)
    { z = min(water_obj.z,z); }
');