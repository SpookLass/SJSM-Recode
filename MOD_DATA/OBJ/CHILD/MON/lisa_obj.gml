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
    name_var = translate_mon_str_scr("lisa",global.name_var);
    wake_snd_var[2] = string_replace(ini_read_string("SUB","lisa","SUB_lisa"),"@n",name_var); wake_snd_var[3] = false;
    note_str_len_var = 6;
    note_str_arr[0] = ini_read_string("NOTE","lisa_01","NOTE_lisa_01");
    note_str_arr[1] = ini_read_string("NOTE","lisa_02","NOTE_lisa_02");
    note_str_arr[2] = ini_read_string("NOTE","lisa_03","NOTE_lisa_03");
    note_str_arr[3] = ini_read_string("NOTE","lisa_04","NOTE_lisa_04");
    note_str_arr[4] = ini_read_string("NOTE","lisa_05","NOTE_lisa_05");
    note_str_arr[5] = ini_read_string("NOTE","lisa_06","NOTE_lisa_06");
    ini_close();
    // Main
    type_var = 0;
    spd_base_var = 0.1;
    spr_spd_var = 1;
    dur_var = 40;
    delay_var = 56; // Assuming unseen speed
    dmg_var = 30;
    dmg_alarm_var = 60;
    dead_rm_var = lisa_dead_rm;
    // Sounds
    wake_snd_var[0] = 2;
    snd_dist_min_var = 0;
    snd_dist_max_var = 600;
    // Theme
    mus_prio_var = mon_mus_prio_const;
    // Render
    do_mdl_var = true;
    head_len_var = 4;
    alarm_len_var = 9;
    alarm_ini_scr();
    head_alarm_min_var = 1;
    head_alarm_max_var = 3;
    seen_alpha_rate_var = 0.02;
    head_x_var = random_range(-0.05,0.05);
    head_y_var = random_range(-0.05,0.05);
    head_z_var = random_range(-0.05,0.05);
    // Movement
    do_seen_var = true;
    do_seen_mult_var = true; // Experimental!
    seen_type_var = 1;
    seen_yaw_var = 30;
    unseen_mult_var = 30;
    frick_var = 0.2;
    do_acc_var = 3; // Friction only
    player_spawn_var = false;
    // Attack
    attack_tp_var = true;
    tp_dist_var = 300;
    attack_alpha_var = false;
    // Uhhh
    vis_spd_var = 6;
    seen_mult_var = vis_spd_var;
    vis_phase_var = true;
    // Timing
    start_var = 17;
    js_start_var = 4;
    js_end_var = 15;
    loop_start_var = 19; // Gotta be 1 early because pain
    red_start_var = 4;
    red_end_var = 14;
    vis_phase_end_var = 21;
    amb_start_var = 8;
    zone_end_var = 0;
    // Other
    note_rand_var = false;
    note_var = 0;
    hide_var = true;
    js_chance_var = 1;
    red_rand_var = false;
    cyan_min_var = 55;
    cyan_max_var = 255;
    cyan_rand_min_var = 51;
    cyan_rand_max_var = 178.5;
    color_prio_var = 3;
    loop_fake_var = false;
    // Assets
        // Search for existing assets to save memory
    local.loaded = false;
    with object_index
    {
        if id != other.id && object_index == other.object_index
        {
            other.bg_var = bg_var;
            other.js_bg_01_var = js_bg_01_var;
            other.js_bg_02_var = js_bg_02_var;
            other.mdl_var = mdl_var;
            for (local.i=0; local.i<other.head_len_var; local.i+=1;)
            { other.head_mdl_arr[local.i] = head_mdl_arr[local.i]; }
            other.wake_snd_var[1] = wake_snd_var[1];
            other.amb_mus_snd_var = amb_mus_snd_var;
            other.zone_list_var = zone_list_var;
            local.loaded = true;
            break;
        }
    }
        // If no existing assets were found, load them
    if !local.loaded
    {
        bg_var = background_add(vanilla_directory_const+"\3D\lisa_tex.png",false,false);
        js_bg_01_var = background_add(vanilla_directory_const+"\TEX\SCARE_01C.png",false,false);
        js_bg_02_var = background_add(vanilla_directory_const+"\TEX\SCARE_01B.png",false,false);
        wake_snd_var[1] = fmod_snd_add_scr(main_directory_const+"\SND\MON\lisa_wake_snd.wav",global.wake_3d_var);
        amb_mus_snd_var = fmod_snd_add_scr(vanilla_directory_const+"\SND\AMB\LISA_AMB.mp3");
        fmod_snd_set_group_scr(amb_mus_snd_var,snd_group_mus_const);
        chase_mus_snd_var = fmod_snd_add_scr(vanilla_directory_const+"\SND\AMB\LISA_AMB2.mp3");
        fmod_snd_set_group_scr(chase_mus_snd_var,snd_group_mus_const);
        mdl_var = d3d_model_create();
        d3d_model_load(mdl_var,main_directory_const+"\MDL\MON\lisa_mdl.gmmod");
        for (local.i=0; local.i<head_len_var; local.i+=1;)
        { head_mdl_arr[local.i] = d3d_model_create(); }
        d3d_model_load(head_mdl_arr[0],main_directory_const+"\MDL\MON\lisa_head_01_mdl.gmmod");
        d3d_model_load(head_mdl_arr[1],main_directory_const+"\MDL\MON\lisa_head_02_mdl.gmmod");
        d3d_model_load(head_mdl_arr[2],main_directory_const+"\MDL\MON\lisa_head_03_mdl.gmmod");
        d3d_model_load(head_mdl_arr[3],main_directory_const+"\MDL\MON\lisa_head_04_mdl.gmmod");
        // Zone
        zone_list_var = ds_list_create();
        ds_list_clear(zone_list_var);
        ds_list_add(zone_list_var,hall_01_rm); ds_list_add(zone_list_var,hall_01_rm);
        ds_list_add(zone_list_var,hall_02_a_rm); ds_list_add(zone_list_var,hall_02_a_rm);
        ds_list_add(zone_list_var,hall_03_rm); ds_list_add(zone_list_var,hall_03_rm);
        ds_list_add(zone_list_var,hall_05_a_rm); ds_list_add(zone_list_var,hall_05_a_rm);
        ds_list_add(zone_list_var,hall_06_a_rm);
        ds_list_add(zone_list_var,hall_06_b_rm);
        ds_list_add(zone_list_var,hall_07_a_rm);
        ds_list_add(zone_list_var,hall_07_b_rm);
        ds_list_add(zone_list_var,hall_08_rm); ds_list_add(zone_list_var,hall_08_rm);
        ds_list_add(zone_list_var,hall_09_a_rm);
        ds_list_add(zone_list_var,hall_09_b_rm);
        ds_list_add(zone_list_var,hall_10_a_rm);
        ds_list_add(zone_list_var,hall_10_b_rm);
        ds_list_add(zone_list_var,hall_11_a_rm);
        ds_list_add(zone_list_var,hall_11_b_rm);
    }
    tex_var = background_get_texture(bg_var);
    mus_snd_var = -1;
    head_mdl_var = head_mdl_arr[irandom(head_len_var-1)];
    // Behavior
    if global.lisa_type_var == -1 { local.type = irandom(3); }
    else { local.type = global.lisa_type_var; }
    local.set = false;
    switch local.type
    {
        case 3: // Alternate (Normal Loop)
        { local.set = true; }
        case 0: // Recode
        {
            dur_var = 35;
            delay_var = 90;
            dmg_alarm_var = 120;
            type_var = 2;
            vis_spd_var = 1;
            seen_mult_var = 1;
            seen_yaw_var = 60;
            seen_pitch_var = 60;
            player_spawn_var = true;
            attack_tp_var = 2;
            attack_alpha_var = true;
            red_rand_var = true;
            cyan_rand_min_var = 55;
            cyan_rand_max_var = 155;
            zone_end_var = 16;
            js_chance_var = 2;
            // Timing
            start_var = 15;
            js_start_var = 3;
            js_end_var = 15;
            
            red_start_var = 1;
            red_end_var = 15;
            vis_phase_end_var = 19;
            amb_start_var = 5;
            loop_start_var = 19; // Gotta be 1 early because pain
            if !local.set { loop_fake_var = true; }
            break;
        }
        case 2: // HD
        {
            spd_base_var = 4/75; // 0.05r3
            type_var = 2;
            do_acc_var = false;
            dmg_var = 15;
            dmg_alarm_var = 120;
            delay_min_var = 30;
            delay_max_var = 60;
            seen_mult_var = 1;
            unseen_mult_var = 200/3; // 66.r6
            vis_phase_var = false;
            seen_alpha_rate_var = 1/300; // 0.00r3
            player_spawn_var = true;
            seen_yaw_var = 60;
            attack_tp_var = false;
            attack_alpha_var = 2;
            snd_dist_max_var = 500;
            vis_phase_end_var = -1;
            // Room stuffs
            start_var = 16;
            zone_end_var = 15;
            js_start_var = 3;
            js_end_var = 16;
            loop_start_var = 19; // Gotta be 1 early because pain
            red_start_var = 3;
            red_end_var = -1;
            red_rand_var = true;
            amb_start_var = 7;
            vis_phase_end_var = -1;
            mus_prio_var = -1;
            js_chance_var = 3;
            note_rand_var = true;
            break;
        }
    }
    if zone_end_var > 0
    {
        global.zone_var = zone_list_var;
        zone_reset_scr();
    }
    global.js_override_var = true;
    global.js_override_num_var = 0;
    global.js_override_den_var = 1;
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
        fmod_snd_free_scr(amb_mus_snd_var);
        fmod_snd_free_scr(chase_mus_snd_var);
        fmod_snd_free_scr(wake_snd_var[1]);
        d3d_model_destroy(mdl_var);
        ds_list_destroy(zone_list_var);
        for (local.i=0; local.i<head_len_var; local.i+=1;)
        { d3d_model_destroy(head_mdl_arr[local.i]); }
        global.js_override_var = false;
        global.note_override_var = false;
    }
    if zone_end_var > 0
    { zone_from_num_scr(global.zone_num_var); }
    if loop_fake_var && loop_start_var > 0
    { global.rm_count_override_var = noone; }
');
// Room Start
object_event_add
(argument0,ev_other,ev_room_start,'
    event_inherited();
    image_alpha = 1;
    local.start = dur_start_var-dur_var;
    if start_var <= 0 || local.start >= start_var
    {
        if local.start == start_var
        {
            hide_var = false;
            snd_var = fmod_snd_play_scr(wake_snd_var[1]);
            sub_var[0] = wake_snd_var[2];
            sub_var[1] = wake_snd_var[3];
            mus_snd_var = chase_mus_snd_var;
            mus_prio_var = theme_mus_prio_const;
            with mus_control_obj { event_user(0); }
        }
        if vis_phase_end_var > 0 && local.start < vis_phase_end_var
        { vis_phase_var = true; seen_mult_var = vis_spd_var; }
        else { vis_phase_var = false; seen_mult_var = 1; }
        if player_spawn_var
        {
            x = global.spawn_arr[0,0];
            y = global.spawn_arr[0,1];
            enter_var = false;
            if type_var > 0 { do_coll_var = true; }
        }
    }
    else
    {
        on_var = false; 
        set_alarm_scr(0,-1);
    }
    if amb_start_var > 0 && amb_start_var < start_var && local.start == amb_start_var
    {
        mus_snd_var = amb_mus_snd_var;
        mus_prio_var = mon_mus_prio_const;
        with mus_control_obj { event_user(0); }
    }
    if loop_start_var > 0 && local.start >= loop_start_var
    {
        if !loop_fake_var
        { with door_trig_obj { rm_count_var = 0; }}
        else if global.rm_count_override_var == noone
        { global.rm_count_override_var = global.rm_count_var; }
    }
    
    if red_start_var > 0 && local.start >= red_start_var
    {
        with color_par_obj { if prio_var < other.color_prio_var { instance_destroy(); }}
        if !instance_exists(color_par_obj)
        {
            if red_end_var > red_start_var && local.start < red_end_var
            {
                local.per = (local.start-red_start_var)/(red_end_var-red_start_var);
                local.cyan = round(lerp_scr(cyan_max_var,cyan_min_var,local.per));
                with instance_create(0,0,color_par_obj)
                {
                    prio_var = other.color_prio_var;
                    image_blend = make_color_rgb(255,local.cyan,local.cyan);
                    event_perform(ev_create,0);
                }
            }
            else if red_rand_var
            {
                local.cyan = round(lerp_scr(cyan_rand_min_var,cyan_rand_max_var,random(1)));
                with instance_create(0,0,color_par_obj)
                {
                    prio_var = other.color_prio_var;
                    image_blend = make_color_rgb(255,local.cyan,local.cyan);
                    event_perform(ev_create,0);
                }
            }
            else
            {
                with instance_create(0,0,color_par_obj)
                {
                    prio_var = other.color_prio_var;
                    image_blend = make_color_rgb(255,other.cyan_min_var,other.cyan_min_var);
                    event_perform(ev_create,0);
                }
            }
        }
    }
    global.js_override_var = true;
    if js_start_var > 0 && local.start >= js_start_var && local.start < js_end_var
    {
        with js_obj
        {
            store_tex_var = background_get_texture(other.js_bg_01_var);
            store_tex_02_var = background_get_texture(other.js_bg_02_var);
            tex_var = store_tex_var;
            tex_02_var = store_tex_02_var;
            silent_var = true;
        }
    }
    else  { with js_obj { instance_destroy(); }}
    if zone_end_var > 0 && local.start == zone_end_var
    { zone_from_num_scr(global.zone_num_var); }
');
// Room End Event
object_event_add
(argument0,ev_other,ev_room_end,'
    event_inherited();
    local.start = dur_start_var-dur_var;
    if js_start_var > 0 && local.start >= js_start_var && local.start < js_end_var
    {
        if instance_exists(note_obj)
        {
            with note_obj
            { if read_var { other.note_var += 1; }}
        }
        global.note_override_var = true;
        global.note_override_num_var = 1;
        global.note_override_den_var = 1;
        if note_rand_var { global.note_override_str_var = note_str_arr[irandom(note_str_len_var-1)]; }
        else { global.note_override_str_var = note_str_arr[mod_scr(note_var,note_str_len_var)]; }
        global.js_override_num_var = 1;
        global.js_override_den_var = js_chance_var;
    }
    else
    {
        if js_end_var > 0 && local.start == js_end_var
        { global.note_override_var = false; }
        global.js_override_num_var = 0;
        global.js_override_den_var = 1;
    }
');
// Delay Alarm
object_event_add
(argument0,ev_alarm,0,'
    event_inherited();
    set_alarm_scr(8,irandom_range(head_alarm_min_var,head_alarm_max_var));
');
// Alarm 8
object_event_add
(argument0,ev_alarm,8,'
    head_mdl_var = head_mdl_arr[irandom(head_len_var-1)];
    set_alarm_scr(8,irandom_range(head_alarm_min_var,head_alarm_max_var));
');
// Animation Event
object_event_add
(argument0,ev_other,ev_user1,'
    if (is_seen_var == 1 || attack_alpha_var == 2) && !vis_phase_var
    { image_alpha -= seen_alpha_rate_var*global.delta_time_var; }
    else { image_alpha = 1; }
    spr_prog_var -= spr_spd_var*global.delta_time_var;
    if spr_prog_var <= 0 
    {
        spr_prog_var = 1;
        visible = irandom(1);
        head_x_var = random_range(-0.05,0.05);
        head_y_var = random_range(-0.05,0.05);
        head_z_var = random_range(-0.05,0.05);
    }
');
// Attack Success
// Uses atk_target_var as an argument, usually the player.
object_event_add
(argument0,ev_other,ev_user3,'
    event_inherited();
    set_motion_scr(0,true);
    switch attack_tp_var
    {
        case 1:
        {
            x -= lengthdir_x(tp_dist_var,yaw_var);
            y -= lengthdir_y(tp_dist_var,yaw_var);
            break;
        }
        case 2:
        {
            x = global.spawn_arr[0,0];
            y = global.spawn_arr[0,1];
            break;
        }
    }
    if attack_alpha_var { image_alpha = 1; }
');
// Draw Event
object_event_add
(argument0,ev_draw,0,'
    if (on_var || visible_var) && (!possess_var || cam_id_var != view_current)
    {
        draw_set_color(image_blend); draw_set_alpha(image_alpha);
        d3d_transform_set_identity();
        d3d_transform_add_rotation_z(yaw_var);
        d3d_transform_add_translation(x+x_off_var,y+y_off_var,z+z_off_var);
        d3d_model_draw(head_mdl_var,head_x_var,head_y_var,head_z_var,tex_var);
        d3d_transform_set_identity();
        draw_set_color(image_blend); draw_set_alpha(image_alpha);
    }
    event_inherited();
');