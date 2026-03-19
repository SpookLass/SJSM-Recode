// Builtin Variables
object_set_depth(argument0,-3);
object_set_mask(argument0,noone);
object_set_parent(argument0,echidna_obj);
object_set_persistent(argument0,true);
object_set_solid(argument0,false);
object_set_sprite(argument0,noone);
object_set_visible(argument0,true);
/*
state_var
    0: Normal chase
    1: Waiting at door
    2: Attacking from door
*/
// Create Event
object_event_add
(argument0,ev_create,1,'
    ini_open(global.lang_var);
    name_var = translate_mon_str_scr("bekka",global.name_var);
    ini_close();
    // Variables
    type_var = 0;
    spd_base_var = 0.75;
    spr_spd_var = 1;
    dur_var = irandom_range(17,25);
    delay_var = 256/3; // 85.r3
    dmg_var = 30;
    dmg_alarm_var = 30;
    w_var = 14;
    h_var = 21;
    eye_h_var = 18.9;
    dead_rm_var = bekka_dead_rm;
    atk_range_var = 48;
    // mus
    mus_prio_var = theme_mus_prio_const;
    // Assets
    // Search for existing assets to save memory
    local.loaded = false;
    with object_index
    {
        if id != other.id && object_index == other.object_index
        {
            other.bg_var = bg_var;
            other.bg_overlay_var = bg_overlay_var;
            other.mus_snd_var = mus_snd_var;
            local.loaded = true;
            break;
        }
    }
    // If no existing assets were found, load them
    if !local.loaded
    {
        bg_var = background_add(vanilla_directory_const+"\TEX\sprites\MS23_01_spr.png",false,false);
        bg_overlay_var = background_add(vanilla_directory_const+"\TEX\sprites\fog_spr.png",false,false);
        mus_snd_var = fmod_snd_add_scr(vanilla_directory_const+"\SND\AMB\BEKKA_AMB.mp3");
        fmod_snd_set_group_scr(mus_snd_var,snd_group_mus_const);
    }
    tex_var = background_get_texture(bg_var);
    // Sounds
    snd_len_var = -1;
    // Rand
    draw_chance_var = 2;
    rand_alarm_min_var = 6;
    rand_alarm_max_var = 30;
    rand_chance_var = 3;
    alpha_min_var = 0.3;
    alpha_max_var = 1;
    // Effect
    overlay_color_var = c_black;
    overlay_alpha_var = 0.5;
    dark_var = true;
    dark_color_var = make_color_rgb(38,38,42);
    bright_var = false;
    exit_fade_alarm_var = 18;
    color_prio_var = 2;
    fog_prio_var = 2;
    // The door!
    enter_spawn_var = true;
    exit_spawn_var = false;
    bekka_type_var = 1;
    exit_chance_var = 2;
    exit_alarm_min_var = 60;
    exit_alarm_max_var = 180;
    exit_delay_var = 0;
    exit_spd_var = 1;
    exit_dist_var = 16;
    // Trigger
    trig_type_var = 0; // Box
    trig_dist_var = 64;
    trig_w_var = 128;
    trig_h_var = 32/6; // 5.r3
    // Mayas idea
    derand_var = false;
    // Yoshis idea
    fade_var = false;
    fade_dmg_var = 10;
    fade_dmg_alarm_var = 30;
    fade_alarm_var = 300;
    // Birds idea
    scare_var = false;
    scare_dist_var = 48;
    scare_alarm_var = 480;
    // Behavior
    if global.bekka_type_var == -1
    {
        local.type = irandom(5);
        local.setname = true;
    }
    else { local.type = global.bekka_type_var; }
    switch local.type
    {
        case 5: // Mayas Idea
        {
            exit_dist_var = 0;
            exit_spd_var = 0;
        }
        case 0: // Recode
        {
            exit_alarm_min_var = 30;
            trig_dist_var = 48;
            exit_alarm_max_var = exit_alarm_min_var;
            trig_type_var = 2;
            exit_spawn_var = true;
            dark_color_var = make_color_rgb(97,97,106);
            bright_var = true;
            derand_var = true;
            blood_spr_var = blood_kh_spr;
            atk_range_var = global.mon_coll[2];
            break;
        }
        case 2: // HD
        {
            dur_var = irandom_range(10,15);
            enter_spawn_var = false;
            exit_spawn_var = true;
            spd_base_var = 8/15; // 0.5r3
            dmg_alarm_var = 180;
            bekka_type_var = 2;
            overlay_color_var = c_white;
            overlay_alpha_var = 0.1;
            dark_var = false;
            atk_range_var = 32;
            break;
        }
        case 3: // Remodeled
        {
            exit_spawn_var = true;
            exit_alarm_min_var = 180;
            trig_type_var = 1;
            fade_var = true;
            exit_fade_alarm_var = 20;
            break;
        }
        case 4: // Rogue
        {
            draw_chance_var = 5;
            dur_var = irandom_range(17,23);
            delay_var = 150;
            scare_var = true;
            bright_var = true;
            exit_fade_alarm_var = 20;
            dark_color_var = make_color_rgb(127,127,127);
            break;
        }
    }
    // Alarms
    alarm_len_var = 11;
    alarm_ini_scr();
    // Bools
    do_snd_var = false;
    if bright_var { color_var = -1; }
');
// Destroy Event
object_event_add
(argument0,ev_destroy,0,'
    event_inherited();
    local.bool = false;
    with object_index { if id != other.id && object_index == other.object_index { local.bool = true; break; }}
    if !local.bool
    {
        fmod_snd_free_scr(mus_snd_var);
        background_delete(bg_var);
        background_delete(bg_overlay_var);
    }
    with fog_overlay_obj
    { if par_var == other.id { instance_destroy(); }}
    with bekka_fade_obj { if par_var == other.id { instance_destroy(); }}
');
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,'
    event_inherited();
    visible = true;
    // Effects
    if !instance_exists(fog_overlay_obj)
    {
        with instance_create(0,0,fog_overlay_obj) do
        {
            par_var = other.id;
            image_blend = other.overlay_color_var;
            image_alpha = other.overlay_alpha_var;
            bg_var = other.bg_overlay_var;
        }
    }
    // Make sure the room isnt golden
    if dark_var
    {
        with torch_obj { if !gold_var { on_var = false; }}
        with candle_obj { if !gold_var { on_var = false; }}
        with color_par_obj { if prio_var < other.color_prio_var { instance_destroy(); }}
        if !instance_exists(color_par_obj)
        {
            with instance_create(0,0,color_par_obj)
            {
                prio_var = other.color_prio_var;
                image_blend = other.dark_color_var;
                event_user(0);
            }
        }
        with fog_par_obj { if prio_var < other.fog_prio_var { instance_destroy(); }}
        if !instance_exists(fog_par_obj)
        {
            with instance_create(0,0,fog_par_obj)
            {
                fog_var = true;
                fog_color_var = c_black;
                fog_start_var = 2;
                fog_end_var = 128;
                fog_dark_var = true;
                event_user(0);
            }
        }
    }
    // Spawn at exit
    state_var = 0;
    if exit_spawn_var
    {
        // Mayas idea
        if derand_var { local.active = (dur_start_var-dur_var) mod exit_chance_var; }
        else { local.active = frac_chance_scr(1,exit_chance_var); }
        if local.active
        {
            // Wait
            state_var = 1;
            event_perform(ev_alarm,0);
            set_alarm_scr(0,-1);
            move_var = false;
            // Reset Position
            if global.unlock_var > 0 { spawn_var = global.unlock_var; }
            else { spawn_var = irandom_range(1,global.spawn_len_var-1); }
            yaw_var = global.spawn_arr[spawn_var,3];
            x = global.spawn_arr[spawn_var,0]-lengthdir_x(exit_dist_var,yaw_var);
            y = global.spawn_arr[spawn_var,1]-lengthdir_y(exit_dist_var,yaw_var);
            z = global.spawn_arr[spawn_var,2];
            set_motion_3d_scr(0,true,yaw_var,true,0,true);
            // Set target
            event_user(6);
        }
        else if !enter_spawn_var
        {
            on_var = false;
            set_alarm_scr(0,-1);
        }
    }
');
// Delay
object_event_add
(argument0,ev_alarm,0,'
    event_perform(ev_alarm,8); // Random anim
    if scare_var { event_perform(ev_alarm,10); } // Scare
    event_inherited();
');
// Random anim
object_event_add
(argument0,ev_alarm,8,'
    if frac_chance_scr(1,rand_chance_var)
    { image_alpha = 1; }
    else { image_alpha = random_range(alpha_min_var,alpha_max_var); }
    set_alarm_scr(8,irandom_range(rand_alarm_min_var,rand_alarm_max_var)); // Self
');
// Animation
object_event_add
(argument0,ev_other,ev_user1,'
    spr_prog_var -= spr_spd_var*global.delta_time_var;
    if spr_prog_var <= 0
    {
        spr_prog_var = 1;
        visible = frac_chance_scr(1,draw_chance_var);
    }
');
// Step Event
object_event_add
(argument0,ev_step,ev_step_normal,'
    if on_var
    {
        switch state_var
        {
            case 1:
            {
                local.active = false;
                switch trig_type_var
                {
                    case 0: // Box
                    {
                        with player_obj
                        {
                            if !dead_var && !in_door_var && !invuln_var && on_var
                            {
                                if box_coll_scr(x,y,z,coll_var[2],coll_var[2],coll_var[1],other.x,other.y,other.z,other.trig_w_var,other.trig_w_var,other.trig_h_var)
                                { local.active = true; break; }
                            }
                        }
                        break;
                    }
                    case 1: // Circle
                    {
                        with player_obj
                        {
                            if !dead_var && !in_door_var && !invuln_var && on_var
                            {
                                if point_distance_3d_scr(x,y,z,other.x,other.y,other.z) < other.trig_dist_var
                                { local.active = true; break; }
                            }
                        }
                        break;
                    }
                    case 2: // Smart Circle
                    {
                        with player_obj
                        {
                            if !dead_var && !in_door_var && !invuln_var && on_var
                            {
                                local.dist = point_distance_3d_scr(x,y,z,global.spawn_arr[other.spawn_var,0],global.spawn_arr[other.spawn_var,1],global.spawn_arr[other.spawn_var,2]);
                                if local.dist < other.trig_dist_var
                                {
                                    local.xvec = (x-global.spawn_arr[other.spawn_var,0])/local.dist;
                                    local.yvec = (y-global.spawn_arr[other.spawn_var,1])/local.dist;
                                    local.zvec = (z-global.spawn_arr[other.spawn_var,2])/local.dist;
                                    local.newdist = check_ray_scr
                                    (
                                        global.spawn_arr[other.spawn_var,0],global.spawn_arr[other.spawn_var,1],global.spawn_arr[other.spawn_var,2],
                                        local.xvec,local.yvec,local.zvec
                                    );
                                    if local.dist <= local.newdist+1 { local.active = true; break; }
                                }
                            }
                        }
                        break;
                    }
                }
                if local.active
                {
                    state_var = 2;
                    move_var = do_move_var;
                    set_alarm_scr(9,irandom_range(exit_alarm_min_var,exit_alarm_max_var)); // Vanish
                }
                break;
            }
            case 2:
            {
                spd_mult_var = exit_spd_var;
                break;
            }
        }
    }
    event_inherited();
');
// Vanish
object_event_add
(argument0,ev_alarm,9,'
    with instance_create(0,0,fade_eff_obj)
    {
        image_blend = c_black; 
        set_alarm_scr(0,other.exit_fade_alarm_var); 
        invert_var = false;
        stay_var = false;
        cam_id_var = -1;
    }
    if fade_var
    {
        // Remodeled only
        with instance_create(0,0,bekka_fade_obj)
        {
            par_var = other.id;
            possess_var = other.possess_var;
            dmg_var = other.fade_dmg_var;
            dmg_alarm_var = other.fade_dmg_alarm_var;
            dead_rm_var = other.dead_rm_var;
            mon_var = other.id;
            bg_var = other.bg_var;
            set_alarm_scr(0,other.fade_alarm_var);
        }
        set_motion_3d_scr(0,true);
        on_var = false;
    }
    else if enter_spawn_var
    {
        state_var = 0;
        // Reset Variables
        move_var = do_move_var;
        anim_var = do_anim_var;
        atk_var = do_atk_var;
        hurt_var = false;
        enter_var = type_var > 0;
        do_coll_var = false;
        // Reset Position
        yaw_var = global.spawn_arr[0,3];
        x = global.spawn_arr[0,0]-lengthdir_x(32,yaw_var);
        y = global.spawn_arr[0,1]-lengthdir_y(32,yaw_var);
        z = global.spawn_arr[0,2];
        set_motion_3d_scr(0,true,yaw_var,true,0,true);
        // Set target
        event_user(6);
        // Delay
        if exit_delay_var > 0
        {
            on_var = false;
            set_alarm_scr(0,exit_delay_var);
        }
        else { event_perform(ev_alarm,0); }
    }
    else
    {
        set_motion_3d_scr(0,true);
        on_var = false;
    }
');
// Rogue
object_event_add
(argument0,ev_alarm,10,'
    event_user(6);
    if instance_exists(target_var)
    {
        x = target_x_var+lengthdir_x(lengthdir_x(scare_dist_var,target_var.eye_yaw_var),target_var.eye_pitch_var);
        y = target_y_var+lengthdir_x(lengthdir_y(scare_dist_var,target_var.eye_yaw_var),target_var.eye_pitch_var);
        z = target_z_var-lengthdir_y(scare_dist_var,target_var.eye_pitch_var);
    }
    with instance_create(0,0,fade_eff_obj)
    {
        image_blend = c_black; 
        set_alarm_scr(0,other.exit_fade_alarm_var); 
        invert_var = false;
        stay_var = false;
        cam_id_var = -1;
    }
    set_alarm_scr(10,scare_alarm_var);
');
// Attack Success
object_event_add
(argument0,ev_other,ev_user3,'
    event_inherited();
    if state_var == 2
    {
        event_perform(ev_alarm,9);
        set_alarm_scr(9,-1);
    }
    if scare_var
    {
        on_var = false;
        set_motion_3d_scr(0,true);
        set_alarm_scr(0,irandom_range(delay_min_var,delay_max_var));
    }
');
// Draw
object_event_add
(argument0,ev_draw,0,'
    if state_var != 1
    {
        if bright_var && global.fog_dark_var 
        {
            d3d_set_fog(false,c_black,0,0);
            event_inherited();
            d3d_set_fog(global.fog_var,global.fog_color_var,global.fog_start_var,global.fog_end_var);
        }
        else { event_inherited(); }
    }
');