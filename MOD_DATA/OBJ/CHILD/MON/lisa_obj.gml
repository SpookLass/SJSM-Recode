// Builtin Variables
object_set_depth(argument0,-2);
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
        case name_num_og_const:
        case name_hd_const:
        case name_fanon_const:
        {
            name_var = ini_read_string("NAME","lisa","NAME_lisa");
            break;
        }
        
        case name_num_hd_const:
        {
            name_var = ini_read_string("NAME","lisa_num","NAME_lisa_num");
            break;
        }
    }
    wake_snd_var[2] = string_replace(ini_read_string("SUB","lisa","SUB_lisa"),"@n",name_var);
    ini_close();
    type_var = 0;
    spd_base_var = 0.1;
    spr_spd_var = 1;
    dur_var = 40;
    delay_var = 56; // Assuming unseen speed
    dmg_var = 30;
    dmg_alarm_var = 60;
    // Sounds
    wake_snd_var[0] = 2;
    snd_dist_var = 600;
    // Theme
    mus_prio_var = mon_mus_prio_const;
    // Render
    do_mdl_var = true;
    head_len_var = 4;
    alarm_len_var = 9;
    head_alarm_min_var = 1;
    head_alarm_max_var = 3;
    seen_alpha_rate_var = 0.02;
    // Movement
    do_seen_var = true;
    do_seen_mult_var = true; // Experimental!
    seen_yaw_var = 30;
    unseen_mult_var = 30;
    frick_var = 0.2;
    do_acc_var = 3; // Friction only
    // Attack
    attack_tp_var = true;
    tp_dist_var = 300;
    attack_alpha_var = false;
    // Uhhh
    vis_spd_var = 6;
    seen_mult_var = vis_spd_var;
    vis_phase_var = true;
    // Other
    start_var = 17;
    js_start_var = 4;
    js_end_var = 15;
    loop_start_var = 19;
    red_start_var = 4;
    red_end_var = 14;
    vis_phase_end_var = 21;
    amb_start_var = 8;
    red_rand_var = false;
    cyan_min_var = 55;
    cyan_max_var = 255;
    cyan_rand_min_var = 51;
    cyan_rand_max_var = 178.5;
    // Assets
        // Search for existing assets to save memory
    with object_index
    {
        if id != other.id
        {
            other.bg_var = bg_var;
            other.mdl_var = mdl_var;
            for (local.i=0; local.i<other.head_len_var; local.i+=1;)
            { other.head_mdl_arr[local.i] = head_mdl_arr[local.i]; }
            other.wake_snd_var[1] = wake_snd_var[1];
            other.amb_mus_snd_var = amb_mus_snd_var;
            local.loaded = true;
            break;
        }
    }
        // If no existing assets were found, load them
    if !local.loaded
    {
        bg_var = background_add(vanilla_directory_const+"\3D\lisa_tex.png",false,false);
        wake_snd_var[1] = fmod_snd_add_scr(main_directory_const+"\SND\MON\lisa_wake_snd.wav");
        amb_mus_snd_var = fmod_snd_add_scr(vanilla_directory_const+"\SND\AMB\LISA_AMB.mp3");
        chase_mus_snd_var = fmod_snd_add_scr(vanilla_directory_const+"\SND\AMB\LISA_AMB2.mp3");
        mdl_var = d3d_model_create();
        d3d_model_load(mdl_var,main_directory_const+"\MDL\MON\lisa_mdl.gmmod");
        for (local.i=0; local.i<head_len_var; local.i+=1;)
        { head_mdl_arr[local.i] = d3d_model_create(); }
        d3d_model_load(head_mdl_arr[0],main_directory_const+"\MDL\MON\lisa_head_01_mdl.gmmod");
        d3d_model_load(head_mdl_arr[1],main_directory_const+"\MDL\MON\lisa_head_02_mdl.gmmod");
        d3d_model_load(head_mdl_arr[2],main_directory_const+"\MDL\MON\lisa_head_03_mdl.gmmod");
        d3d_model_load(head_mdl_arr[3],main_directory_const+"\MDL\MON\lisa_head_04_mdl.gmmod");
    }
    tex_var = background_get_texture(bg_var);
    mus_snd_var = -1;
    head_mdl_var = head_mdl_arr[irandom(head_len_var-1)];
    // Behavior
    if global.lisa_type_var == -1 { local.type = irandom(3); }
    else { local.type = global.lisa_type_var; }
    switch local.type
    {
        case 3: // Alternate (no loop)
        {
            loop_start_var = -1;
            local.set = true;
        }
        case 0: // Recode
        {
            dur_var = irandom_range(30,40);
            if !local.set { loop_start_var = dur_var-10; }
            delay_var = 90;
            dmg_alarm_var = 120;
            type_var = 2;
            vis_spd_var = 1;
            seen_mult_var = 1;
            seen_pitch_var = 30;
            player_spawn_var = true;
            attack_tp_var = 2;
            attack_alpha_var = true;
            red_rand_var = true;
            cyan_rand_min_var = 55;
            cyan_rand_max_var = 155;
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
            snd_dist_var = 500;
            vis_phase_end_var = -1;
            // Room stuffs
            start_var = 16;
            js_start_var = 3;
            js_end_var = 16;
            loop_start_var = 19;
            red_start_var = 3;
            red_end_var = -1;
            red_rand_var = true;
            amb_start_var = 7;
            vis_phase_end_var = -1;
            mus_prio_var = -1;
            break;
        }
    }
');
// Destroy Event
object_event_add
(argument0,ev_destroy,0,'
    event_inherited();
    if instance_number(object_index) <= 1
    {
        background_delete(bg_var);
        fmod_snd_free_scr(amb_mus_snd_var);
        fmod_snd_free_scr(chase_mus_snd_var);
        fmod_snd_free_scr(wake_snd_var[1]);
        d3d_model_destroy(mdl_var);
        for (local.i=0; local.i<head_len_var; local.i+=1;)
        { d3d_model_destroy(head_mdl_arr[local.i]); }
    }
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
    { door_trig_obj.rm_count_var = 0; }
    if red_start_var > 0 && local.start >= red_start_var && !instance_exists(maze_dark_color_obj)
    {
        with color_par_obj { instance_destroy(); }
        if red_end_var > red_start_var && local.start < red_end_var
        {
            local.per = (local.start-red_start_var)/(red_end_var-red_start_var);
            local.cyan = round(lerp_scr(cyan_max_var,cyan_min_var,local.per));
            with instance_create(0,0,color_par_obj)
            {
                image_blend = make_color_rgb(255,local.cyan,local.cyan);
                event_perform(ev_create,0);
            }
        }
        else if red_rand_var
        {
            local.cyan = round(lerp_scr(cyan_rand_min_var,cyan_rand_max_var,random(1)));
            with instance_create(0,0,color_par_obj)
            {
                image_blend = make_color_rgb(255,local.cyan,local.cyan);
                event_perform(ev_create,0);
            }
        }
        else
        {
            with instance_create(0,0,color_par_obj)
            {
                image_blend = make_color_rgb(255,other.cyan_min_var,other.cyan_min_var);
                event_perform(ev_create,0);
            }
        }
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
// Uses attack_target_var as an argument, usually the player.
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
    if on_var || visible_var
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
