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
    snd_alarm_min_var = 180;
    snd_alarm_max_var = 300;
    snd_dist_min_var = 0;
    snd_dist_max_var = 600;
    hurt_snd_var = 4;
    // Translation
    ini_open("lang_"+global.lang_var+".ini");
    name_var = translate_mon_str_scr("sg",global.name_var);
    local.sub = string_replace(ini_read_string("SUB","sg","SUB_sg"),"@n",name_var);
    for (local.i=0; local.i<snd_len_var; local.i+=1)
    { snd_arr[local.i,1] = local.sub; snd_arr[local.i,2] = false; }
    hurt_snd_var[2] = local.sub;
    ini_close();
    // Variables
    type_var = 1;
    spd_base_var = 0.2;
    spr_spd_var = 1/15;
    dmg_var = 40;
    dmg_alarm_var = 120;
    dmg_eff_var = true;
    dmg_stam_var = false;
    dmg_unbalance_var = false;
    dmg_min_var = 0;
    atk_alarm_var = 0;
    atk_range_var = 48;
    alarm_len_var = 10;
    alarm_ini_scr();
    blood_spr_var = blood_kh_spr;
    atk_type_var = 0;
    atk_flash_var = true;
    atk_snd_var = 0;
    kill_var = true;
    eye_h_var = 17.7;
    dead_rm_var = sg_dead_load_rm;
    // No official value
    dur_var = irandom_range(10,20); 
    delay_var = 120;
    // Model
    do_mdl_var = true;
    mdl_len_var = 12;
    anim_type_var = 4;
    // Spawning
    spawn_attempt_var = 30; 
    spawn_player_dist_var = 24;
    // Charge
    do_atk_var = false;
    charge_var = true;
    charge_dist_var = 24;
    charge_spd_var = 3;
    charge_alarm_01_var = 30;
    charge_alarm_02_var = 15;
    charge_alarm_03_var = 15;
    // Wander
    do_wander_var = false;
    chase_dist_var = 128/3;
    // Effects
    fog_end_var = 96;
    fog_color_var = c_black;
	do_fog_var = true;
	fog_type_var = 0;
	wall_num_var = 6;
	wall_alpha_var = 0.15;
	wall_start_var = 24;
	wall_end_var = 64;
	wall_color_var = make_color_rgb(98,57,57);
    fog_prio_var = 2;
    // Theme
    mus_prio_var = mon_mus_prio_const;
    // Behavior
    if global.sg_type_var == -1 { local.type = irandom(3); }
    else { local.type = global.sg_type_var; }
    switch local.type
    {
        case 0:
        {
            // charge_alarm_01_var = 15;
            spawn_player_dist_var = 96;
            dmg_var = 30;
            atk_range_var = global.mon_coll[2];
            fog_end_var = 128;
            //fog_color_var = wall_color_var;
            delay_var = 30;
            snd_dist_max_var = 300;
            break;
        }
        case 2: // HD
        { dmg_stam_var = 2; }
        case 3: // KH HD
        {
            // I hate this
            charge_var = false;
            do_atk_var = true;
            do_wander_var = true;
            wander_attempt_var = 30;
            // Variables
            atk_range_var = 416/15; // 27.7r3
            dmg_alarm_var = 30;
            atk_alarm_var = 180;
            dur_var = irandom_range(10,15); // Likely
            snd_den_var = 1;
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
            other.bg_var = bg_var;
            other.overlay_bg_var = overlay_bg_var;
            for (local.i=0; local.i<snd_len_var; local.i+=1;)
            { other.snd_arr[local.i,0] = snd_arr[local.i,0]; }
            other.hurt_snd_var[1] = hurt_snd_var[1];
            for (local.i=0; local.i<mdl_len_var; local.i+=1;)
            { other.mdl_arr[local.i] = mdl_arr[local.i]; }
            other.mus_snd_var = mus_snd_var;
            local.loaded = true;
            break;
        }
    }
        // If no existing assets were found, load them
    if !local.loaded
    {
        bg_var = bg_add_scr(sg_bg_path,false,false);
        overlay_bg_var = bg_add_scr(vignette_bg_path,false,false);
        snd_arr[0,0] = snd_add_scr(sg_01_snd_path,true,snd_group_mon_const,1,snd_dist_min_var,snd_dist_max_var);
        snd_arr[1,0] = snd_add_scr(sg_02_snd_path,true,snd_group_mon_const,1,snd_dist_min_var,snd_dist_max_var);
        snd_arr[2,0] = snd_add_scr(sg_03_snd_path,true,snd_group_mon_const,1,snd_dist_min_var,snd_dist_max_var);
        snd_arr[3,0] = snd_add_scr(sg_04_snd_path,true,snd_group_mon_const,1,snd_dist_min_var,snd_dist_max_var);
        hurt_snd_var[1] = snd_add_scr(sg_hurt_snd_path,true,snd_group_mon_const,1,snd_dist_min_var,snd_dist_max_var);
        mus_snd_var = snd_add_scr(sg_mus_snd_path,false,snd_group_mus_const,1,0,0);
        // Models
        mdl_arr[0] = mdl_add_scr(sg_01_mdl_path);
        mdl_arr[1] = mdl_add_scr(sg_02_mdl_path);
        mdl_arr[2] = mdl_add_scr(sg_03_mdl_path);
        mdl_arr[3] = mdl_add_scr(sg_04_mdl_path);
        mdl_arr[4] = mdl_add_scr(sg_05_mdl_path);
        mdl_arr[5] = mdl_add_scr(sg_06_mdl_path);
        mdl_arr[6] = mdl_add_scr(sg_07_mdl_path);
        mdl_arr[7] = mdl_add_scr(sg_08_mdl_path);
        mdl_arr[8] = mdl_add_scr(sg_09_mdl_path);
        mdl_arr[9] = mdl_add_scr(sg_10_mdl_path);
        mdl_arr[10] = mdl_add_scr(sg_11_mdl_path);
        mdl_arr[11] = mdl_add_scr(sg_12_mdl_path);
    }
    tex_var = background_get_texture(bg_var);
    mdl_var = mdl_arr[0];
');
// Destroy Event
object_event_add
(argument0,ev_destroy,0,'
    event_inherited();
    local.bool = false;
    with object_index { if id != other.id && object_index == other.object_index { local.bool = true; break; }}
    if !local.bool
    {
        background_delete(bg_var);
        background_delete(overlay_bg_var);
        fmod_snd_free_scr(mus_snd_var);
        fmod_snd_free_scr(hurt_snd_var[1]);
        for (local.i=0; local.i<snd_len_var; local.i+=1;)
        { fmod_snd_free_scr(snd_arr[local.i,0]); }
        for (local.i=0; local.i<mdl_len_var; local.i+=1;)
        { d3d_model_destroy(mdl_arr[local.i]); }
    }
    with kh_fog_obj { if par_var == other.id { instance_destroy(); }}
	with kh_overlay_obj { if par_var == other.id { instance_destroy(); }}
');
// Room Start
object_event_add
(argument0,ev_other,ev_room_start,'
    if do_wander_var { wander_var = true; }
    spawn_var = 0;
    if rand_spawn_scr(spawn_attempt_var,false,spawn_player_dist_var,spawn_player_dist_var,0)
    { spawn_var = -1; }
    // Spawn
    for (local.i=0; local.i<spawn_attempt_var; local.i+=1;)
    {
        local.flr = instance_find(floor_par_obj,irandom(instance_number(floor_par_obj)-1));
        local.xtmp = local.flr.x;//+random_range(-local.flr.w_var/2,local.flr.w_var/2);
        local.ytmp = local.flr.y;//+random_range(-local.flr.h_var/2,local.flr.h_var/2);
        local.ztmp = local.flr.z;
        local.bool = true;
        if spawn_player_dist_var > 0
        {
            with player_obj
            {
                if on_var && !dead_var && !in_door_var
                {
                    if point_distance_3d_scr(local.xtmp,local.ytmp,local.ztmp,x,y,z) < other.spawn_player_dist_var
                    { local.bool = false; break; }
                }
            }
            if point_distance_3d_scr(local.xtmp,local.ytmp,local.ztmp,global.spawn_arr[0,0],global.spawn_arr[0,1],global.spawn_arr[0,2]) < spawn_player_dist_var
            { local.bool = false; break; }
        }
        if local.bool
        {
            if !check_coll_scr(0,0,0,0,0,local.xtmp,local.ytmp,local.ztmp)
            {
                x = local.xtmp;
                y = local.ytmp;
                z = local.ztmp;
                spawn_var = -1;
                break;
            }
        }
    }
    event_inherited();
    if spawn_var == -1
    {
        set_alarm_scr(0,-1);
        event_perform(ev_alarm,0);
    }
    // Effects
    if do_fog_var
    {
        with fog_par_obj { if prio_var < other.fog_prio_var { instance_destroy(); }}
        if !instance_exists(fog_par_obj)
        {
            with instance_create(0,0,fog_par_obj)
            {
                prio_var = other.fog_prio_var;
                par_var = other.id;
                fog_var = true;
                fog_color_var = other.fog_color_var;
                fog_start_var = 0;
                fog_end_var = other.fog_end_var;
                fog_dark_var = true;
                event_user(0);
            }
        }
        if !instance_exists(kh_fog_obj)
        {
            with instance_create(0,0,kh_fog_obj)
            {
                prio_var = other.fog_prio_var;
                par_var = other.id;
                fog_type_var = other.fog_type_var;
                image_blend = other.wall_color_var;
                image_alpha = other.wall_alpha_var;
                wall_num_var = other.wall_num_var;
                wall_start_var = other.wall_start_var;
                wall_end_var = other.wall_end_var;
                event_user(0);
            }
        }
    }
	if !instance_exists(kh_overlay_obj)
	{
		with instance_create(0,0,kh_overlay_obj)
		{
			par_var = other.id;
			overlay_bg_var = other.overlay_bg_var;
			overlay_var = true;
			overlay_alpha_var = 0.5;
			spr_spd_var = 0.1;
			image_alpha = 0.025;
		}
	}
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if do_wander_var
    {
        wander_var = true;
        with player_obj { if point_distance_3d_scr(x,y,z,other.x,other.y,other.z) < other.chase_dist_var
        { other.wander_var = false; break; }}
    }
    event_inherited();
    if on_var && !enter_var && charge_var && move_var
    {
        if possess_var { local.bool = (global.input_press_arr[interact_input_const,player_id_var] == 1); }
        else { local.bool = target_dist_var <= charge_dist_var && instance_exists(target_var); }
        if local.bool
        {
            if possess_var { charge_yaw_var = eye_yaw_var; }
            else { charge_yaw_var = point_direction(x,y,target_x_var,target_y_var); }
            move_var = false;
            anim_var = false;
            set_alarm_scr(8,charge_alarm_01_var);
            set_motion_3d_scr(0,true,charge_yaw_var,true);
        }
        
    }
');
// Start Charging
object_event_add
(argument0,ev_alarm,8,'
    set_motion_scr(charge_spd_var,true,charge_yaw_var,true);
    atk_var = true;
    local.time = charge_alarm_02_var;
    if charge_var == 2 { local.time = min(local.time,target_dist_var/charge_spd_var); }
    set_alarm_scr(9,local.time);
    set_alarm_scr(4,local.time);
');
// Stop Charging
object_event_add
(argument0,ev_alarm,9,'
    set_motion_3d_scr(0,true);
    set_alarm_scr(1,charge_alarm_03_var);
    set_alarm_scr(2,charge_alarm_03_var);
    set_alarm_scr(3,charge_alarm_03_var);
');
// Animation
object_event_add
(argument0,ev_other,ev_user1,'
    if anim_type_var == 4
    {
        spr_id_var = (spr_id_var+(spr_spd_var*global.delta_time_var)) mod mdl_len_var;
        mdl_var = mdl_arr[floor(spr_id_var)];
    }
    else { event_inherited(); }
');