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
    name_var = translate_mon_str_scr("wf",global.name_var);
    loop_snd_var[2] = string_replace(ini_read_string("SUB","wf","SUB_wf"),"@n",name_var); loop_snd_var[3] = false;
    ini_close();
    // Variables
    type_var = 0;
    spd_base_var = 1;
    spr_spd_var = 1;
    dur_var = 11;
    delay_var = 64;
    dmg_var = 99999;
    dmg_alarm_var = 90;
    w_var = 12;
    h_var = 16.5;
    eye_h_var = 20.5;
    z_off_base_var = 10;
    z_off_var = z_off_base_var;
    dupe_var = dupe_canon_const;
    atk_range_var = 48;
    dead_rm_var = dead_crash_rm;
    // Boss
    boss_var = 2;
    boss_color_var = c_white;
    // Sounds
    do_snd_var = 1; // At least for now
    loop_snd_var[0] = true;
    loop_snd_dist_min_var = 0;
    loop_snd_dist_max_var = 600;
    glitch_snd_len_var = 4;
    mus_prio_var = mon_mus_prio_const;
    // Effect
    res_var = (global.player_len_var <= 1);
    res_w_var = 640;
    res_h_var = 360;
    no_fun_var = true;
    door_trig_var = true;
    eff_02_alarm_var = 12;
    // Anim
    anim_off_var = 1;
    anim_type_var = 4;
    // other
    do_fog_var = true;
    zone_var = true;
    web_var = true;
    color_prio_var = 1;
    fog_prio_var = 1;
    reflect_var= -1;
    // Assets
        // Search for existing assets to save memory
    local.loaded = false;
    with object_index
    {
        if id != other.id && object_index == other.object_index
        {
            other.boss_icon_var = boss_icon_var;
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
            for (local.i=0; local.i<glitch_snd_len_var; local.i+=1;)
            { other.glitch_snd_arr[local.i] = glitch_snd_arr[local.i]; }
            other.mus_snd_var = mus_snd_var;
            local.loaded = true;
            break;
        }
    }
        // If no existing assets were found, load them
    if !local.loaded
    {
        boss_icon_var = execute_file(main_directory_const+"\SPR\MON\wf_icon_spr.gml",main_directory_const+"\SPR\MON\wf_icon_spr.png");
        spr_var = wf_spr;
        bg_var = background_add(vanilla_directory_const+"\TEX\sprites\MS28_02_spr.png",false,false);
        tex_spr_var = sprite_add(vanilla_directory_const+"\TEX\sprites\MS28_08_spr.png",3,false,false,0,0);
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
        loop_snd_var[1] = fmod_snd_add_scr(main_directory_const+"\SND\MON\wf_snd.wav",true);
        glitch_snd_arr[0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\glitch_01_snd.wav");
        glitch_snd_arr[1] = fmod_snd_add_scr(main_directory_const+"\SND\MON\glitch_02_snd.wav");
        glitch_snd_arr[2] = fmod_snd_add_scr(main_directory_const+"\SND\MON\glitch_03_snd.wav");
        glitch_snd_arr[3] = fmod_snd_add_scr(main_directory_const+"\SND\MON\glitch_04_snd.wav");
        for (local.i=0; local.i<glitch_snd_len_var; local.i+=1;)
        { fmod_snd_set_group_scr(glitch_snd_arr[local.i],snd_group_mon_const); }
        mus_snd_var = fmod_snd_add_scr(vanilla_directory_const+"\SND\AMB\WF_AMB.mp3");
        fmod_snd_set_group_scr(mus_snd_var,snd_group_mus_const);
    }
    tex_02_var = background_get_texture(bg_var);
    web_tex_var = background_get_texture(web_bg_var);
    // Behavior
    if global.wf_type_var == -1 { local.type = irandom(7); }
    else { local.type = global.wf_type_var; }
    local.set = false;
    switch local.type
    {
        case 7: // Imscared Recode
        case 6: // Mayas Idea
        case 0: // Recode
        {
            atk_range_var = global.mon_coll[2];
            // Smaller Resolution
            res_w_var = 640;
            res_h_var = 480;
            break;
        }
        case 4: // Old HD
        {
            dmg_var = 60;
            dmg_alarm_var = 180;
            local.set = true;
        }
        case 2: // HD
        {
            if !local.set
            {
                dmg_var = 30;
                dmg_alarm_var = 60;
            }
            delay_min_var = 90;
            delay_max_var = 180;
            dur_var = 14;
            boss_var = false;
            // Movement
            type_var = 2;
            spd_base_var = 4/pf_ms_rate_const;
            do_acc_var = true;
            acc_var = 16/675; // 0.02r370
            frick_var = acc_var;
            // Uhh
            atk_range_var = 4/pixel_meter_rate_const;
            spr_spd_var = 1/6; // 0.1r6 I think
            // Effects
            res_var = false;
            do_fog_var = false;
            door_trig_var = false;
            // Estimates
            w_var = 8;
            h_var = 11;
            z_off_base_var = 12;
            // Autobrake (close enough)
            autobrake_var = true;
            autobrake_spd_var = 0;
            autobrake_dir_var = 60;
            break;
        }
    }
    if zone_var
    {
        global.zone_var = zone_list_var;
        zone_reset_scr();
    }
    global.hide_rm_var = true;
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
        sprite_delete(boss_icon_var);
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
        { fmod_snd_free_scr(glitch_snd_arr[local.i]); }
        fmod_snd_free_scr(loop_snd_var[1]);
        fmod_snd_free_scr(mus_snd_var);
        if no_fun_var { global.js_override_var = false; }
        if res_var
        {
            global.res_override_var = false;
            global.res_override_w_var = global.res_w_var;
            global.res_override_h_var = global.res_h_var;
        }
    }
    if zone_var { zone_from_num_scr(global.zone_num_var); }
    with wf_eff_obj { if par_var == other.id { instance_destroy(); }}
    with player_obj { unheal_var = 0; hp_var = hp_max_var; }
    global.hide_rm_var = false;
');
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,'
    event_inherited();
    // Loop
    with door_trig_obj { rm_count_var = 0; }
    // Zone
    if zone_var { global.rm_name_var = string_replace(global.rm_name_var,"Long","My"); }
    // Webs
    if web_var
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
    if door_trig_var
    {
        local.mon = id;
        with door_trig_obj
        {
            if object_index != wf_door_trig_obj
            {
                event_perform(ev_other,ev_room_start);
                par_var = other.id;
                instance_change(wf_door_trig_obj,false)
            }
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
    with player_obj
    {
        if !dead_var
        {
            hp_var = 0;
            unheal_var = hp_max_var;
        }
    }
');
// Animation
object_event_add
(argument0,ev_other,ev_user1,'
    event_inherited();
    if anim_type_var == 4
    {
        spr_prog_var -= spr_spd_var*global.delta_time_var;
        if spr_prog_var <= 0
        {
            spr_prog_var = 1;
            if !irandom(2) { spr_id_var = irandom(sprite_get_number(spr_var)-1); }
            if !irandom(1) { tex_var = tex_02_var; }
            else { tex_var = sprite_get_texture(spr_var,floor(spr_id_var)); }
            x_off_var = random_range(-anim_off_var,anim_off_var);
            y_off_var = random_range(-anim_off_var,anim_off_var);
            z_off_var = z_off_base_var+random_range(-anim_off_var,anim_off_var);
        }
    }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if do_fog_var && global.fog_dark_var && global.fog_var
    {
        d3d_set_fog(true,c_black,0,256);
        event_inherited();
        d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var);
    }
    else { event_inherited(); }
');