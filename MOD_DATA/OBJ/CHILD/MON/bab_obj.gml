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
        {
            name_var = ini_read_string("NAME","bab","NAME_bab");
            break;
        }
        case name_num_og_const:
        case name_num_hd_const:
        {
            name_var = ini_read_string("NAME","bab_num","NAME_bab_num");
            break;
        }
    }
    ini_close();
    type_var = 1;
    if global.mode_var == 0
    {
        spd_base_var = 0.25;
        spr_spd_var = 1/6;
        delay_var = 128;
    }
    else
    {
        spd_base_var = 2/3; // 0.r6
        spr_spd_var = 1/3;
        delay_var = 704/3; // 234.r6
    }
    dur_var = irandom_range(20,30);
    dmg_var = 60;
    dmg_alarm_var = 120;
    w_var = 10;
    w_01_var = 7;
    w_02_var = 3.5;
    h_var = 20;
    // Sounds
    snd_len_var = 4;
    snd_num_var = 1;
    snd_den_var = 2;
    snd_alarm_min_var = 80;
    snd_alarm_max_var = 240;
    snd_dist_var = 800;
    hurt_snd_var = 4;
    // Special
    eff_var = true;
    eff_alpha_min_var = 0.2;
    eff_alpha_min_var = 0.6;
    flesh_var = true;
    flesh_alarm_min_var = 160;
    flesh_alarm_max_var = 420;
    flesh_per_var = false;
    flesh_door_var = true;
    // Theme
    mus_prio_var = theme_mus_prio_const;
    // Assets
        // Search for existing assets to save memory
    with object_index
    {
        if id != other.id
        {
            other.new_spr_var = new_spr_var;
            other.old_spr_var = old_spr_var;
            other.flesh_spr_var = flesh_spr_var;
            other.eff_spr_var = eff_spr_var;
            for (local.i=0; local.i<snd_len_var; local.i+=1;)
            { other.snd_arr[local.i,0] = snd_arr[local.i,0]; }
            other.mus_snd_var = mus_snd_var;
            local.loaded = true;
            break;
        }
    }
        // If no existing assets were found, load them
    if !local.loaded
    {
        new_spr_var = sprite_add(vanilla_directory_const+"\TEX\sprites\MS4_01_spr.png",16,false,false,0,0);
        old_spr_var = sprite_add(main_directory_const+"\SPR\MON\bab_old_spr.png",11,false,false,0,0);
        flesh_spr_var = sprite_add(main_directory_const+"\SPR\MON\bab_flesh_spr.png",4,false,false,0,0);
        eff_spr_var = sprite_add(vanilla_directory_const+"\TEX\sprites\MS4_03_spr.png",4,false,false,0,0);
        snd_arr[0,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\bab_01_snd.wav",true);
        snd_arr[1,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\bab_02_snd.wav",true);
        snd_arr[2,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\bab_03_snd.wav",true);
        snd_arr[3,0] = fmod_snd_add_scr(main_directory_const+"\SND\MON\bab_04_snd.wav",true);
        mus_snd_var = fmod_snd_add_scr(main_directory_const+"\SND\MON\bab_mus_snd.mp3");
    }
    spr_var = new_spr_var;
    // Behavior
    if global.bab_type_var == -1 { local.type = irandom(3); }
    else { local.type = global.bab_type_var; }
    switch local.type
    {
        case 0:
        {
            spd_base_var = 0.6;
            spr_spd_var = 1/3;
            delay_var = 128;
            flesh_door_var = false;
            w_01_var = 7.7; // 7
            w_02_var = 2.8; // 3.5
            break;
        }
        case 2: // HD
        {
            dur_var = irandom_range(10,15);
            dmg_alarm_var = 180;
            delay_min_var = 90;
            delay_max_var = 180;
            spr_spd_var = 1/3;
            w_01_var = 7.7; // 7
            w_02_var = 2.8; // 3.5
            flesh_door_var = false;
            eff_var = false;
            flesh_alarm_min_var = 180;
            flesh_alarm_max_var = 180;
            flesh_per_var = true;
            // Sound
            snd_alarm_min_var = 90;
            snd_alarm_max_var = 240;
            snd_den_var = 1;
            snd_dist_var = 500;
            // Movement
            spd_base_var = 34/45; // 0.7r5
            do_acc_var = true;
            acc_var = 16/675; // 0.02r370
            frick_var = acc_var;
            // Autobrake (close enough)
            autobrake_var = true;
            autobrake_spd_var = 0;
            autobrake_dir_var = 60;
            break;
        }
        case 3: // Old
        {
            spr_var = old_spr_var;
            spr_spd_var = 1/6;
            spd_base_var = 0.2;
            delay_var = 96;
            w_01_var = 5;
            w_02_var = 5;
            h_var = 20;
            z_off_var = 2;
            flesh_var = false;
            eff_alpha_min_var = 0.7;
            eff_alpha_max_var = 1;
            // Stop the player
            stop_var = true;
            stop_delay_min_var = 90;
            stop_delay_max_var = 120;
            stop_alarm_min_var = 30;
            stop_alarm_max_var = 60;
            stop_chance_var = 3; // 1 in 3
            // Drain Stamina
            drain_var = true;
            drain_delay_min_var = 120;
            drain_delay_max_var = 160;
            drain_chance_var = 3;
            break;
        }
    }
    // Alarms
    alarm_len_var = 10;
');
// Destroy Event
object_event_add
(argument0,ev_destroy,0,'
    event_inherited();
    if instance_number(object_index) <= 1
    {
        sprite_delete(new_spr_var);
        sprite_delete(old_spr_var);
        sprite_delete(flesh_spr_var);
        sprite_delete(eff_spr_var);
        fmod_snd_free_scr(mus_snd_var);
        for (local.i=0; local.i<snd_len_var; local.i+=1;)
        { fmod_snd_free_scr(snd_arr[local.i,0]); }
    }
    if flesh_var { with bab_flesh_obj { if par_var == other.id { instance_destroy(); }}}
    if eff_var { with bab_eff_obj { if par_var == other.id { instance_destroy(); }}}
');
// Room Start Event
object_event_add
(argument0,ev_other,ev_room_start,'
    event_inherited();
    if flesh_var && !instance_exists(bab_flesh_obj)
    {
        with instance_create(0,0,bab_flesh_obj)
        {
            par_var = other.id;
            spr_var = other.flesh_spr_var;
            door_var = other.flesh_door_var;
            alarm_min_var = other.flesh_alarm_min_var;
            alarm_max_var = other.flesh_alarm_max_var;
            per_var = other.flesh_per_var;
            set_alarm_scr(0,irandom_range(alarm_min_var,alarm_max_var));
        }
    }
    if eff_var && !instance_exists(bab_eff_obj)
    {
        with instance_create(0,0,bab_eff_obj)
        {
            par_var = other.id;
            spr_var = other.eff_spr_var;
            alpha_min_var = other.eff_alpha_min_var;
            alpha_max_var = other.eff_alpha_max_var;
            image_alpha = random_range(alpha_min_var,alpha_max_var);
        }
    }
');
// Delay Alarm
object_event_add
(argument0,ev_alarm,0,'
    event_inherited();
    if stop_var && instance_number(mon_par_obj) <= 1 { event_perform(ev_alarm,8); }
    if drain_var && instance_number(mon_par_obj) <= 1 { event_perform(ev_alarm,9); }
');
// Stop Alarm
object_event_add
(argument0,ev_alarm,8,'
    if stop_var && instance_number(mon_par_obj) <= 1
    {
        if frac_chance_scr(1,stop_chance_var)
        {
            with instance_create(0,0,player_freeze_obj)
            {
                player_var = player_obj;
                set_alarm_scr(0,irandom_range(other.stop_alarm_min_var,other.stop_alarm_max_var));
            }
        }
        set_alarm_scr(8,irandom_range(stop_delay_min_var,stop_delay_max_var));
    }
');
// Drain Alarm
object_event_add
(argument0,ev_alarm,9,'
    if drain_var && instance_number(mon_par_obj) <= 1
    {
        if frac_chance_scr(1,drain_chance_var)
        {
            with player_obj
            {
                if do_stam_var 
                { stam_var = 0; }
            }
        }
        set_alarm_scr(9,irandom_range(drain_delay_min_var,drain_delay_max_var));
    }
');
// Draw
object_event_add
(argument0,ev_draw,0,'
    if on_var || visible_var
    {
        draw_set_color(image_blend); draw_set_alpha(image_alpha);
        d3d_transform_set_identity();
        if do_mdl_var
        {
            // d3d_transform_add_rotation_y(pitch_var);
            d3d_transform_add_rotation_z(yaw_var);
            d3d_transform_add_translation(x+x_off_var,y+y_off_var,z+z_off_var);
            d3d_model_draw(mdl_var,0,0,0,tex_var);
        }
        else
        {
            // Draw
            d3d_transform_add_rotation_z(point_direction(x,y,global.cam_x_var[view_current],global.cam_y_var[view_current]));
            d3d_transform_add_translation(x+x_off_var,y+y_off_var,z+z_off_var);
            d3d_draw_wall(0,w_01_var,h_var,0,-w_02_var,0,tex_var,1,1);
        }
        d3d_transform_set_identity();
        draw_set_color(c_white); draw_set_alpha(1);
        if global.debug_var && type_var > 0
        {
            d3d_set_hidden(false);
            if path_exists(path_var)
            { draw_path(path_var,x,y,false); }
            d3d_set_hidden(true);
            // mp_grid_draw(grid_var);
        }
    }
');