// Builtin Variables
object_set_depth(argument0,-3);
object_set_mask(argument0,noone);
object_set_parent(argument0,mon_par_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
// Create Event
object_event_add
(argument0,ev_create,1,'
    ini_open(global.lang_var);
    name_var = translate_mon_str_scr("husk_swarm",global.name_var);
    ini_close();
    dur_var = irandom_range(30,50);
    dupe_var = dupe_never_const;
    mus_prio_var = theme_mus_prio_const;
    persist_var = false;
    husk_var = irandom_range(5,10);
    // Sounds
    snd_len_var = 5;
    snd_dist_min_var = 0;
    snd_dist_max_var = 512;
    snd_alarm_min_var = 60;
    snd_alarm_max_var = 80;
    snd_num_var = 7;
    snd_den_var = 8;
    // Husk
    spawn_dist_var = 24;
    revive_var = false;
    atk_dist_var = 8.5;
    atk_range_var = 20;
    hp_min_var = 2;
    hp_max_var = 7;
    spd_min_var = 0.15;
    spd_max_var = 0.2;
    hurt_dist_var = 5;
    heal_var = false;
    hurt_down_var = true;
    dead_rm_var = husk_dead_rm;
    // Blob
    do_blob_var = false;
    troll_var = false;
    blob_var = false;
    blob_hurt_var = true;
    blob_hurt_dist_var = 5;
    troll_num_var = 0;
    troll_den_var = 5;
    // Behavior
    if global.husk_type_var == -1 { local.type = irandom(2); }
    else { local.type = global.husk_type_var; }
    switch local.type
    {
        case 0:
        {
            persist_var = true;
            spawn_dist_var = 96;
            revive_var = true;
            // Sounds
            snd_alarm_min_var = 60;
            snd_alarm_max_var = 120;
            snd_num_var = 5;
            snd_den_var = 8;
            snd_dist_max_var = 512;
            break;
        }
        case 2: // HD
        {
            mus_prio_var = -1;
            persist_var = true;
            atk_dist_var = 32/3;
            atk_range_var = 80/3; // 26.r6
            hp_min_var = 3;
            hp_max_var = 6;
            spd_min_var = 1.5/pf_ms_rate_const;
            spd_max_var = 2/pf_ms_rate_const;
            hurt_dist_var = 2/pixel_meter_rate_const;
            heal_var = true;
            spawn_dist_var = 0;
            hurt_down_var = false;
            // Sounds
            snd_dist_min_var = 32/3;
            snd_dist_max_var = 500/pixel_meter_rate_const; // This doesnt seem right
            snd_alarm_min_var = 60;
            snd_alarm_max_var = 72;
            // Blob
            do_blob_var = 2;
            troll_num_var = 1;
            blob_hurt_var = 2;
            blob_hurt_dist_var = 0;
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
            other.main_spr_var = main_spr_var;
            other.dead_spr_var = dead_spr_var;
            other.hurt_bg_var = hurt_bg_var;
            other.doll_blood_bg_var = doll_blood_bg_var;
            other.shadow_bg_var = shadow_bg_var;
            other.mdl_bg_var = mdl_bg_var;
            other.mdl_var = mdl_var;
            for (local.i=0; local.i<snd_len_var; local.i+=1;)
            { other.snd_arr[local.i] = snd_arr[local.i]; }
            other.hurt_snd_var = hurt_snd_var[1];
            other.mus_snd_var = mus_snd_var;
            local.loaded = true;
            break;
        }
    }
        // If no existing assets were found, load them
    if !local.loaded
    {
        main_spr_var = sprite_add(dh_directory_const+"\TEX\sprites\NPC1_SPR.png",17,false,false,0,0);
        dead_spr_var = sprite_add(dh_directory_const+"\TEX\sprites\NPC1C_SPR.png",7,false,false,0,0);
        hurt_bg_var = background_add(dh_directory_const+"\TEX\sprites\NPC1B_SPR.png",false,false);
        doll_blood_bg_var = background_add(main_directory_const+"\BG\DH\doll_blood_bg.png",false,false);
        shadow_bg_var = background_add(main_directory_const+"\BG\DH\shadow_bg.png",false,false);
        mdl_bg_var = background_add(main_directory_const+"\BG\DH\husk_bg.png",false,false);
        mdl_var = d3d_model_create();
        d3d_model_load(mdl_var,main_directory_const+"\MDL\DH\husk_mdl.gmmod");
        // Sounds
        snd_arr[0] = fmod_snd_add_scr(main_directory_const+"\SND\DH\husk_01_snd.wav",true);
        snd_arr[1] = fmod_snd_add_scr(main_directory_const+"\SND\DH\husk_02_snd.wav",true);
        snd_arr[2] = fmod_snd_add_scr(main_directory_const+"\SND\DH\husk_03_snd.wav",true);
        snd_arr[3] = fmod_snd_add_scr(main_directory_const+"\SND\DH\husk_04_snd.wav",true);
        snd_arr[4] = fmod_snd_add_scr(main_directory_const+"\SND\DH\husk_05_snd.wav",true);
        for (local.i=0; local.i<snd_len_var; local.i+=1;)
        {
            fmod_snd_set_minmax_dist_scr(snd_arr[local.i],snd_dist_min_var,snd_dist_max_var);
            fmod_snd_set_group_scr(snd_arr[local.i],snd_group_mon_const);
        }
        // Hurt Sound
        hurt_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\DH\doll_hurt_snd.wav",true);
        fmod_snd_set_minmax_dist_scr(hurt_snd_var,snd_dist_min_var,snd_dist_max_var);
        fmod_snd_set_group_scr(hurt_snd_var,snd_group_mon_const);
        // Music
        switch theme_scr(global.husk_theme_var,global.theme_var,1,0,1,0)
        {
            case 1: { mus_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\DH\east_mus_snd.mp3"); break; }
            default: { mus_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\MON\husk_mus_snd.ogg"); break; }
        }
        
        fmod_snd_set_group_scr(mus_snd_var,snd_group_mus_const);
        fmod_snd_set_minmax_dist_scr(hurt_snd_var,snd_dist_min_var,snd_dist_max_var);
    }
    doll_blood_tex_var = background_get_texture(doll_blood_bg_var);
    shadow_tex_var = background_get_texture(shadow_bg_var);
    mdl_tex_var = background_get_texture(mdl_bg_var);
    // Spawn Husks if persistent
    if do_blob_var > 0 { blob_var = irandom(do_blob_var); }
    if troll_num_var > 0 && blob_var == 1 { troll_var = frac_chance_scr(troll_num_var,troll_den_var); }
    if persist_var
    {
        for (local.i=0; local.i<husk_var; local.i+=1;)
        {
            with instance_create(0,0,husk_obj)
            {
                persistent = true;
                par_var = other.id;
                // Variables
                spawn_dist_var = other.spawn_dist_var;
                revive_var = other.revive_var;
                hurt_dist_base_var = other.hurt_dist_var;
                heal_var = other.heal_var;
                hurt_down_var = other.hurt_down_var;
                dead_rm_var = other.dead_rm_var;
                // Random
                hp_var = irandom_range(other.hp_min_var,other.hp_max_var);
                hp_max_var = hp_var;
                spd_base_var = random_range(other.spd_min_var,other.spd_max_var);
                spr_spd_var = spd_base_var/1.45;
                // Sound
                snd_alarm_min_var = other.snd_alarm_min_var;
                snd_alarm_max_var = other.snd_alarm_max_var;
                snd_dist_min_var = other.snd_dist_min_var;
                snd_dist_max_var = other.snd_dist_max_var;
                snd_num_var = other.snd_num_var;
                snd_den_var = other.snd_den_var;
                // Blob
                blob_hurt_var = other.blob_hurt_var;
                blob_hurt_dist_var = other.blob_hurt_dist_var;
                // Assets
                mdl_var = other.mdl_var;
                mdl_tex_var = other.mdl_tex_var;
                main_spr_var = other.main_spr_var;
                dead_spr_var = other.dead_spr_var;
                hurt_bg_var = other.hurt_bg_var;
                shadow_tex_var = other.shadow_tex_var;
                doll_blood_tex_var = other.doll_blood_tex_var;
                for (local.j=0; local.j<other.snd_len_var; local.j+=1;)
                { snd_arr[local.j,0] = other.snd_arr[local.j]; }
                hurt_snd_var[1] = other.hurt_snd_var;
                // Sprite
                spr_var = main_spr_var;
                tex_var = sprite_get_texture(spr_var,floor(spr_id_var));
                // Blob
                blob_var = other.blob_var;
                if other.troll_var
                { if frac_chance_scr(other.troll_num_var,other.troll_den_var) { blob_var = 2; }}
                event_user(14);
                // Spawn
                //event_perform(ev_user_const,0);
                event_user(15);
            }
        }
    }
');
// Room End Event
object_event_add
(argument0,ev_other,ev_room_end,'
    if persist_var
    {
        local.exist = false;
        with husk_obj
        {
            if par_var == other.id
            && (!dead_var || (revive_var && dead_var < 2))
            { local.exist = true; break; }
        }
        if !local.exist { instance_destroy(); }
    }
    event_inherited();
');
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,'
    event_inherited();
    if do_blob_var > 0 { blob_var = irandom(do_blob_var); }
    if troll_num_var > 0 && blob_var == 1 { troll_var = frac_chance_scr(troll_num_var,troll_den_var); }
    if !persist_var
    {
        for (local.i=0; local.i<global.mark_len_var; local.i+=1;)
        {
            if !global.mark_arr[local.i,3]
            {
                with instance_create(global.mark_arr[local.i,0],global.mark_arr[local.i,1],husk_obj)
                {
                    persistent = false;
                    par_var = other.id;
                    x = global.mark_arr[local.i,0];
                    y = global.mark_arr[local.i,1];
                    z = global.mark_arr[local.i,2];
                    // Variables
                    spawn_dist_var = other.spawn_dist_var;
                    revive_var = other.revive_var;
                    hurt_dist_base_var = other.hurt_dist_var;
                    heal_var = other.heal_var;
                    hurt_down_var = other.hurt_down_var;
                    dead_rm_var = other.dead_rm_var;
                    // Sound
                    snd_alarm_min_var = other.snd_alarm_min_var;
                    snd_alarm_max_var = other.snd_alarm_max_var;
                    snd_dist_min_var = other.snd_dist_min_var;
                    snd_dist_max_var = other.snd_dist_max_var;
                    snd_num_var = other.snd_num_var;
                    snd_den_var = other.snd_den_var;
                    // Blob
                    blob_hurt_var = other.blob_hurt_var;
                    blob_hurt_dist_var = other.blob_hurt_dist_var;
                    // Assets
                    mdl_var = other.mdl_var;
                    mdl_tex_var = other.mdl_tex_var;
                    main_spr_var = other.main_spr_var;
                    dead_spr_var = other.dead_spr_var;
                    hurt_bg_var = other.hurt_bg_var;
                    shadow_tex_var = other.shadow_tex_var;
                    doll_blood_tex_var = other.doll_blood_tex_var;
                    for (local.j=0; local.j<other.snd_len_var; local.j+=1;)
                    { snd_arr[local.j,0] = other.snd_arr[local.j]; }
                    hurt_snd_var[1] = other.hurt_snd_var;
                    // Blob
                    blob_var = other.blob_var;
                    if other.troll_var
                    { if frac_chance_scr(other.troll_num_var,other.troll_den_var) { blob_var = 2; }}
                    event_user(14);
                    // Sprite
                    spr_var = main_spr_var;
                    tex_var = sprite_get_texture(spr_var,floor(spr_id_var));
                }
                global.mark_arr[local.i,3] = true;
            }
        }
    }
    else if do_blob_var > 0
    {
        with husk_obj
        {
            if par_var == other.id
            {
                blob_var = other.blob_var;
                if other.troll_var
                { if frac_chance_scr(other.troll_num_var,other.troll_den_var) { blob_var = 2; }}
            }
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
        sprite_delete(dead_spr_var);
        background_delete(hurt_bg_var);
        background_delete(doll_blood_bg_var);
        background_delete(shadow_bg_var);
        background_delete(mdl_bg_var);
        d3d_model_destroy(mdl_var);
        fmod_snd_free_scr(mus_snd_var);
        for (local.i=0; local.i<snd_len_var; local.i+=1;)
        { fmod_snd_free_scr(snd_arr[local.i]); }
        fmod_snd_free_scr(hurt_snd_var);
    }
    with husk_obj { if par_var == other.id { instance_destroy(); }}
');